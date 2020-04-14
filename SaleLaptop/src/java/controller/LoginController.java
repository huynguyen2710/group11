/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Customers;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.CustomersModel;
import model.HibernateUtil;
import model.ProductsModel;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {

    @RequestMapping(value = "admin/index", method = RequestMethod.GET)
    public String login(ModelMap model) {
        Customers customer = new Customers();
        model.addAttribute("customer", customer);
        return "admin/login";
    }

    @RequestMapping("admin/login")
    public String toIndex(ModelMap model, @ModelAttribute(value = "customer") Customers customer, HttpServletRequest request, BindingResult errors) {
        try {
            if (customer.getUserName().trim().length() == 0) {
                errors.rejectValue("userName", "customer", "Please enter your account name!");
            }
            if (customer.getPassword().trim().length() == 0) {
                errors.rejectValue("password", "customer", "Please enter your password!");
            }
            if (errors.hasErrors()) {
                return "admin/login";
            } else {
                Session session = HibernateUtil.getSessionFactory().getCurrentSession();
                session.beginTransaction();
                String hql = "FROM Customers where UserName =:UserName AND PASSWORD =:PASSWORD AND Admin_Permission='1'";
                Query query = session.createQuery(hql);
                query.setParameter("UserName", customer.getUserName());
                query.setParameter("PASSWORD", customer.getPassword());
                List results = query.list();
                Customers customer2 = new Customers();
                session.getTransaction().commit();
                HttpSession ss = request.getSession();
                CustomersModel customerm = new CustomersModel();
                if (!results.isEmpty()) {
                    model.addAttribute("listcustomer", customerm.getAll());
                    ss.setAttribute("customerId", customer.getUserName());
                    customer2 = (Customers) results.get(0);
                    ss.setAttribute("customername", customer2.getName());
                    return "admin/customermanagement";
                }
                ss.invalidate();
                return "admin/login";
            }
        } catch (Exception e) {
            HttpSession ss = request.getSession();
            ss.invalidate();
            return "admin/login";
        }
    }

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String customerLogin(ModelMap model) {
        Customers customer = new Customers();
        model.addAttribute("page2", "home");
        ProductsModel sp = new ProductsModel();
        model.addAttribute("listproduct", sp.getAll());
        model.addAttribute("link", "tologin");
        model.addAttribute("name", "Login");
        return "index";
    }

    @RequestMapping("login")
    public String toIndexKH(ModelMap model, @ModelAttribute(value = "customer1") Customers customer, HttpServletRequest request, BindingResult errors) {
        try {
            if (customer.getUserName().trim().length() == 0) {
                errors.rejectValue("userName", "customer", "Please enter your account name!");
            }
            if (customer.getPassword().trim().length() == 0) {
                errors.rejectValue("password", "customer", "Please enter your password!");
            }
            if (errors.hasErrors()) {
                return "login";
            } else {
                Session session = HibernateUtil.getSessionFactory().getCurrentSession();
                session.beginTransaction();
                String hql = "FROM Customers where  UserName=:UserName AND PASSWORD =:PASSWORD";
                Query query = session.createQuery(hql);
                query.setParameter("UserName", customer.getUserName());
                query.setParameter("PASSWORD", customer.getPassword());
                List results = query.list();
                Customers customer2 = new Customers();
                session.getTransaction().commit();
                HttpSession ss = request.getSession();
                if (!results.isEmpty()) {
                    model.addAttribute("page2", "home");
                    ProductsModel pm = new ProductsModel();
                    model.addAttribute("listproduct", pm.getAll());
                    customer2 = (Customers) results.get(0);
                    ss.setAttribute("customer2", customer2.getName());
                    ss.setAttribute("customerID2", customer2.getCustomerId());
                    ss.setAttribute("email2", customer2.getEmail());
                    return "index";
                }
                ss.invalidate();
                return "login";
            }
        } catch (Exception e) {
            HttpSession ss = request.getSession();
            ss.invalidate();
            return "login";
        }

    }

    @RequestMapping(value = "tologin", method = RequestMethod.GET)
    public String toLogin(ModelMap model) {
        Customers customer = new Customers();
        model.addAttribute("customer1", customer);
        return "login";
    }
}
