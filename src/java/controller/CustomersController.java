/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Customers;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import model.CustomersModel;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CustomersController {
    @RequestMapping(value = "admin/tocustomermanagement", method = RequestMethod.GET)
    public String toCustomerManagement(ModelMap model) {
        CustomersModel customer = new CustomersModel();
        model.addAttribute("listcustomer", customer.getAll());
        return "admin/customermanagement";
    }

    @RequestMapping(value = "admin/toaddcustomer", method = RequestMethod.GET)
    public String toAddCustomer(ModelMap model) {
        Customers customer = new Customers();
        model.addAttribute("customer", customer);
        return "admin/addcustomer";
    }

    @RequestMapping(value = "admin/adforgotpassword", method = RequestMethod.GET)
    public String toAdForgotPassword(ModelMap model) {
        Customers customer = new Customers();
        model.addAttribute("customer", customer);
        return "admin/forgotpassword";
    }

    @Autowired
    JavaMailSender mailer;

    @RequestMapping("admin/send")
    public String send(ModelMap model, @ModelAttribute(value = "customer") Customers customer, HttpServletRequest request, BindingResult errors) {
        if (customer.getUserName().trim().length() == 0) {
            errors.rejectValue("userName", "customer", "Please enter your account name!");
        }
        if (customer.getEmail().trim().length() == 0) {
            errors.rejectValue("email", "customer", "Please enter your email!");
        }
        if (errors.hasErrors()) {
            return "admin/forgotpassword";
        } else {
            try {
                CustomersModel customerm = new CustomersModel();
                String userName = customer.getUserName();
                String email = customer.getEmail();
                if (customerm.checkUserName(userName, email) != true) {
                    return "admin/forgotpassword";
                } else {
                    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
                    session.beginTransaction();
                    String hql = "FROM Customers where userName =:userName AND Admin_Permission='1'";
                    Query query = session.createQuery(hql);
                    query.setParameter("userName", customer.getUserName());
                    List results = query.list();
                    Customers customer2 = new Customers();
                    customer2 = (Customers) results.get(0);
                    String newpass = customerm.randomString(10);
                    customer2.setPassword(newpass);
                    customerm.edit(customer2);
                    session.getTransaction().commit();
                    String from = "leanhhieuit@gmail.com";
                    String subject = "Password reset request";
                    String body = "We received your password reset request. If not you, please notify support. Your new password is: " + newpass + "";
                    MimeMessage mail = mailer.createMimeMessage();
                    MimeMessageHelper helper = new MimeMessageHelper(mail);
                    helper.setFrom(from, from);
                    helper.setTo(customer.getEmail());
                    helper.setReplyTo(from, from);
                    helper.setSubject(subject);
                    helper.setText(body, true);
                    mailer.send(mail);
                    return "admin/login";
                }
            } catch (Exception ex) {
                return "admin/forgotpassword";
            }
        }
    }

    @RequestMapping(value = "admin/createcustomer", method = RequestMethod.POST)
    public String create(@ModelAttribute(value = "customer") Customers customer, BindingResult errors) {
        if (customer.getCustomerId().trim().length() == 0) {
            errors.rejectValue("customerId", "customer", "Please do not leave it blank!");
        }
        if (customer.getName().trim().length() == 0) {
            errors.rejectValue("name", "customer", "Please do not leave it blank!");
        }
        if (customer.getPhoneNumber().trim().length() == 0) {
            errors.rejectValue("phoneNumber", "customer", "Please do not leave it blank!");
        }
        Pattern pattern = Pattern.compile("\\d*");
        Matcher matcher = pattern.matcher(customer.getPhoneNumber().trim());
        if (matcher.matches() == false) {
            errors.rejectValue("phoneNumber", "customer", "Phone numbers must be in the correct format!");
        }
        if (customer.getAddress().trim().length() == 0) {
            errors.rejectValue("address", "customer", "Please do not leave it blank!");
        }
        if (customer.getEmail().trim().length() == 0) {
            errors.rejectValue("email", "customer", "Please do not leave it blank");
        }
        if (customer.getIdentificationNumber().trim().length() == 0) {
            errors.rejectValue("identificationNumber", "customer", "Please do not leave it blank");
        }
        Pattern pattern2 = Pattern.compile("\\d*");
        Matcher matcher2 = pattern.matcher(customer.getIdentificationNumber().trim());
        if (matcher2.matches() == false) {
            errors.rejectValue("identificationNumber", "customer", "Identitfication number must be in the correct format");
        }
        if (customer.getDateOfBirth()== null) {
            errors.rejectValue("dateOfBirth", "customer", "Please enter your birthday!");
        }
        if (customer.getUserName().trim().length() == 0) {
            errors.rejectValue("userName", "customer", "Please do not leave it blank");
        }
        if (customer.getPassword().trim().length() == 0) {
            errors.rejectValue("password", "customer", "Please do not leave it blank");
        }
        if (errors.hasErrors()) {
            return "admin/addcustomer";
        } else {
            CustomersModel customerm = new CustomersModel();
            customer.setProfilePicture("customer.png");
            if (customerm.create(customer) == 1) {
                return "redirect:tocustomermanagement.htm";
            }
            return "admin/addcustomer";
        }
    }

    @RequestMapping(value = "admin/toupdatecustomer", method = RequestMethod.GET)
    public String edit(@RequestParam(value = "customerId") String id, ModelMap m
    ) {
        CustomersModel model = new CustomersModel();
        Customers customer = model.getCustomers(id);
        m.addAttribute("customer", customer);
        return "admin/updatecustomer";
    }

    @RequestMapping(value = "admin/updatecustomer", method = RequestMethod.POST)
    public String update(@ModelAttribute(value = "customer") Customers customer, Model m, BindingResult errors
    ) {
        if (customer.getName().trim().length() == 0) {
            errors.rejectValue("name", "customer", "Please do not leave it blank!");
        }
        if (customer.getPhoneNumber().trim().length() == 0) {
            errors.rejectValue("phoneNumber", "customer", "Please do not leave it blank!");
        }
        Pattern pattern = Pattern.compile("\\d*");
        Matcher matcher = pattern.matcher(customer.getPhoneNumber().trim());
        if (matcher.matches() == false) {
            errors.rejectValue("phoneNumber", "customer", "Phone numbers must be in the correct format!");
        }
        if (customer.getAddress().trim().length() == 0) {
            errors.rejectValue("address", "customer", "Please do not leave it blank!");
        }
        if (customer.getEmail().trim().length() == 0) {
            errors.rejectValue("email", "customer", "Please do not leave it blank");
        }
        if (customer.getIdentificationNumber().trim().length() == 0) {
            errors.rejectValue("identificationNumber", "customer", "Please do not leave it blank");
        }
        Pattern pattern2 = Pattern.compile("\\d*");
        Matcher matcher2 = pattern.matcher(customer.getIdentificationNumber().trim());
        if (matcher2.matches() == false) {
            errors.rejectValue("identificationNumber", "customer", "Identitfication number must be in the correct format!");
        }
        if (customer.getDateOfBirth()== null) {
            errors.rejectValue("dateOfBirth", "customer", "Please enter your birthday!");
        }
        if (customer.getUserName().trim().length() == 0) {
            errors.rejectValue("userName", "customer", "Please do not leave it blank");
        }
        if (customer.getPassword().trim().length() == 0) {
            errors.rejectValue("password", "customer", "Please do not leave it blank");
        }
        if (errors.hasErrors()) {
            return "admin/updatecustomer";
        } else {
            CustomersModel model = new CustomersModel();
            model.edit(customer);
            return "redirect:tocustomermanagement.htm";
        }
    }

    @RequestMapping(value = "removecustomer", method = RequestMethod.GET)
    public String remove(@RequestParam(value = "customerId") String id, ModelMap m
    ) {
        CustomersModel model = new CustomersModel();
        Customers customer = model.getCustomers(id);
        model.remove(customer);
        return "redirect:customermanagement.htm";
    }
}
