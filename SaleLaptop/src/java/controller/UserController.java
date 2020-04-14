/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Customers;
import entity.ProductInCart;
import entity.Products;
import entity.ReceiptDetails;
import entity.Receipts;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.CustomersModel;
import model.HibernateUtil;
import model.ProductsModel;
import model.ReceiptsModel;
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
import org.springframework.web.multipart.MultipartFile;


@Controller
public class UserController {

    @RequestMapping(value = "toregister.htm", method = RequestMethod.GET)
    public String toregister(ModelMap model) {
        Customers cus = new Customers();
        model.addAttribute("customer", cus);
        return "register";
    }

    @RequestMapping(value = "register.htm", method = RequestMethod.POST)
    public String register(ModelMap model, @ModelAttribute(value = "customer") Customers cus, BindingResult errors) {
        if (cus.getName().trim().length() == 0) {
            errors.rejectValue("name", "name", "Please enter your name!");
        }
        if (cus.getEmail().trim().length() == 0) {
            errors.rejectValue("email", "customer", "Please enter your email!");
        }
        if (cus.getIdentificationNumber().trim().length() == 0) {
            errors.rejectValue("identificationNumber", "customer", "Please enter your identification number!");
        }
        if (cus.getPhoneNumber().trim().length() == 0) {
            errors.rejectValue("phoneNumber", "customer", "Please enter your phone number!");
        }
        Pattern pattern = Pattern.compile("\\d*");
        Matcher matcher = pattern.matcher(cus.getPhoneNumber().trim());
        if (matcher.matches() == false) {
            errors.rejectValue("phoneNumber", "customer", "Phone numbers must be in the correct format");
        }
        if (cus.getAddress().trim().length() == 0) {
            errors.rejectValue("address", "customer", "Please enter your address!");
        }
        if (cus.getUserName().trim().length() == 0) {
            errors.rejectValue("userName", "customer", "Please enter user name!");
        }
        if (cus.getPassword().trim().length() == 0) {
            errors.rejectValue("password", "customer", "Please enter your password!");
        }
        if (errors.hasErrors()) {
            return "register";
        } else {
            CustomersModel cusm = new CustomersModel();
            cus.setProfilePicture("customer.png");
            if (cus.getCustomerId().equals("CT")) {
                cus.setCustomerId(cus.getCustomerId() + cusm.getAll().size());
            }
            cus.setAdminPermission(false);
            if (cusm.create(cus) == 1) {
                model.addAttribute("page2", "home");
                ProductsModel pro = new ProductsModel();
                model.addAttribute("listproduct", pro.getAll());
                return "index";
            }
            return "register";
        }
    }

    @RequestMapping(value = "contact.htm", method = RequestMethod.GET)
    public String toLienHe(ModelMap model) {
        model.addAttribute("page2", "contact");
        return "index";
    }

    @RequestMapping(value = "toforgotpassword", method = RequestMethod.GET)
    public String toQMK(ModelMap model) {
        Customers customer = new Customers();
        model.addAttribute("customer1", customer);
        return "forgotpassword";
    }

    @Autowired
    JavaMailSender mailer2;

    @RequestMapping("send2")
    public String send2(ModelMap model, @ModelAttribute(value = "customer1") Customers customer, HttpServletRequest request, BindingResult errors) {
        if (customer.getUserName().trim().length() == 0) {
            errors.rejectValue("userName", "customer", "Please enter your account name!");
        }
        if (customer.getEmail().trim().length() == 0) {
            errors.rejectValue("email", "customer", "Please enter your email!");
        }
        if (errors.hasErrors()) {
            return "forgotpassword";
        } else {
            try {
                CustomersModel customerm = new CustomersModel();
                String userName = customer.getUserName();
                String email = customer.getEmail();
                if (customerm.checkUserName(userName, email) != true) {
                    return "forgotpassword";
                } else {
                    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
                    session.beginTransaction();
                    String hql = "FROM Customers where userName =:userName AND Admin_Permission='0'";
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
                    MimeMessage mail = mailer2.createMimeMessage();
                    MimeMessageHelper helper = new MimeMessageHelper(mail);
                    helper.setFrom(from, from);
                    helper.setTo(customer.getEmail());
                    helper.setReplyTo(from, from);
                    helper.setSubject(subject);
                    helper.setText(body, true);
                    mailer2.send(mail);
                    return "login";
                }
            } catch (Exception ex) {
                return "forgotpassword";
            }
        }
    }

    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String todetail(@RequestParam(value = "productId") String id, ModelMap m) {
        ProductsModel model = new ProductsModel();
        Products product = model.getProduct(id);
        m.addAttribute("product", product);
        m.addAttribute("page2", "productdetail");
        return "index";
    }

    @RequestMapping(value = "toinfor.htm", method = RequestMethod.GET)
    public String toinfor(@RequestParam(value = "customerId") String id, ModelMap model) {
        CustomersModel customerm = new CustomersModel();
        Customers customer = customerm.getCustomers(id);
        model.addAttribute("customer", customer);
        return "infor";
    }

    @RequestMapping(value = "history.htm", method = RequestMethod.GET)
    public String tohistory(@RequestParam(value = "customerId") String id, ModelMap model) {
        Receipts hd = new Receipts();
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        String hql = "FROM Receipts where customer_Id =:customerId";
        Query query = session.createQuery(hql);
        query.setParameter("customerId", id);
        List<Receipts> results = query.list();
        session.getTransaction().commit();
        if (!results.isEmpty()) {
            model.addAttribute("listreceipt", results);
            return "history";
        }
        return "infor";
    }

    @RequestMapping(value = "toupdateinfor.htm", method = RequestMethod.GET)
    public String toUpdateInfor(@RequestParam(value = "customerId") String id, ModelMap model) {
        CustomersModel customerm = new CustomersModel();
        Customers customer = customerm.getCustomers(id);
        model.addAttribute("customer", customer);
        return "updateinfor";
    }

    @Autowired
    ServletContext context;

    @RequestMapping(value = "updateinfor", method = RequestMethod.POST)
    public String update(@ModelAttribute(value = "customer") Customers customer, Model m, @RequestParam("photo") MultipartFile photo) {
        CustomersModel model = new CustomersModel();
        try {
            String photoPath = context.getRealPath("/resources/images/" + customer.getCustomerId() + photo.getOriginalFilename());
            photo.transferTo(new File(photoPath));
            if (photo.getOriginalFilename().equals("")) {
                customer.setProfilePicture("customer.png");
            } else {
                customer.setProfilePicture(customer.getCustomerId() + photo.getOriginalFilename());
            }
        } catch (Exception ex) {
            customer.setProfilePicture("customer.png");
        }
        model.edit(customer);
        return "infor";
    }

    List<ProductInCart> list = new ArrayList<>();
    
    @RequestMapping(value = "addtocart", method = RequestMethod.POST)
    public String addtocart(ModelMap model, @RequestParam("productId") String id, @RequestParam("quantity") int q) {
        ProductsModel spm = new ProductsModel();
        Products sp = new Products();
        sp = spm.getProduct(id);
        if (list.size() != 0) {
            int check = 0;
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getProductId().equals(id)) {
                    check = 1;
                    list.get(i).setQuantity(q+list.get(i).getQuantity());
                    list.get(i).setTotal(list.get(i).getQuantity()*list.get(i).getPrice());
                    break;
                }
            }
            if (check == 0) {
                ProductInCart pic = new ProductInCart();
                pic.setProductId(sp.getProductId());
                pic.setName(sp.getName());
                pic.setPrice(sp.getPrice());
                pic.setQuantity(q);
                pic.setImage(sp.getImage());
                pic.setTotal(pic.getQuantity() * pic.getPrice());
                list.add(pic);
            }
        } else {
            ProductInCart pic = new ProductInCart();
            pic.setProductId(sp.getProductId());
            pic.setName(sp.getName());
            pic.setPrice(sp.getPrice());
            pic.setQuantity(q);
            pic.setImage(sp.getImage());
            pic.setTotal(pic.getQuantity() * pic.getPrice());
            list.add(pic);
        }
        model.addAttribute("listcart", list);
        if (list.size() == 0) {
            model.addAttribute("notification", "Cart is empty!");
        }
        model.addAttribute("page2", "cart");
        return "index";
    }

    @RequestMapping(value = "removecart", method = RequestMethod.GET)
    public String removeCart(ModelMap model, @RequestParam(value = "productId") String id) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getProductId().equals(id)) {
                list.remove(i);
            }
        }
        model.addAttribute("page2", "cart");
        if (list.size() == 0) {
            model.addAttribute("notification", "Cart is empty");
        }
        model.addAttribute("listcard", list);
        return "redirect:tocart.htm";
    }
    @RequestMapping(value = "tocart", method = RequestMethod.GET)
    public String toCart(ModelMap model) {
        model.addAttribute("page2", "cart");
        if (list.size() == 0) {
            model.addAttribute("notification", "Cart is empty!");
        }
        model.addAttribute("listcart", list);
        return "index";
    }

    @RequestMapping("logout")
    public String logout(ModelMap model, HttpServletRequest request, @ModelAttribute(value = "customer1") Customers customer) {
        HttpSession ss = request.getSession();
        list.clear();
        ss.invalidate();
        return "login";
    }

    @RequestMapping("toreceipt")
    public String toreceipt(ModelMap model, Receipts receipt) {
        model.addAttribute("date", java.time.LocalDate.now());
        model.addAttribute("receipt", receipt);
        model.addAttribute("listcart", list);
        int sl = 0;
        int tt = 0;
        if (list.size() != 0) {
            for (int i = 0; i < list.size(); i++) {
                sl += list.get(i).getQuantity();
                tt += list.get(i).getTotal();
            }
        }
        model.addAttribute("quantity", sl);
        model.addAttribute("total", tt);
        return "receipt";
    }
    @RequestMapping("pay")
    public String pay(ModelMap model, @ModelAttribute(value = "receipt") Receipts receipt) {
        ReceiptsModel hdm = new ReceiptsModel();
        if (receipt.getReceiptId().equals("R")) {
            receipt.setReceiptId(receipt.getReceiptId()+ hdm.getAll().size());
        }
        if (hdm.create(receipt) == 1) {
            model.addAttribute("page2", "cart");
            model.addAttribute("listcart", list);
            for (int i = 0; i < list.size(); i++) {
                ProductsModel spm = new ProductsModel();
                ReceiptDetails rd = new ReceiptDetails(receipt.getReceiptId()+ list.get(i).getProductId(), spm.getProduct(list.get(i).getProductId()), receipt, list.get(i).getQuantity());
                hdm.createDT(rd);
            }
            list.clear();
            model.addAttribute("notification", "Payment success!");
            return "index";
        }
        model.addAttribute("page2", "cart");
        return "index";
    }

    public List<ProductInCart> getList() {
        return list;
    }

    public void setList(List<ProductInCart> list) {
        this.list = list;
    }
}
