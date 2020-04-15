/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Suppliers;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.SuppliersModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SuppliersController {
    @RequestMapping(value = "admin/tosuppliermanagement", method = RequestMethod.GET)
    public String toSupplierManagement(ModelMap model) {
        SuppliersModel supplier = new SuppliersModel();
        model.addAttribute("listsupplier", supplier.getAll());
        return "admin/suppliermanagement";
    }

    @RequestMapping(value = "admin/toaddsupplier", method = RequestMethod.GET)
    public String toAddSupplier(ModelMap model) {
        Suppliers supplier = new Suppliers();
        model.addAttribute("supplier", supplier);
        return "admin/addsupplier";
    }

    @RequestMapping(value = "admin/createsupplier", method = RequestMethod.POST)
    public String create(@ModelAttribute(value = "supplier") Suppliers supplier, BindingResult errors) {
        if (supplier.getSupplierId().trim().length() == 0) {
            errors.rejectValue("supplierId", "supplier", "Please do not leave it blank!");
        }
        if (supplier.getSupplierName().trim().length() == 0) {
            errors.rejectValue("supplierName", "supplier", "Please do not leave it blank!");
        }
        if (supplier.getAddress().trim().length() == 0) {
            errors.rejectValue("address", "supplier", "Please do not leave it blank!");
        }
        if (supplier.getPhoneNumber().trim().length() == 0) {
            errors.rejectValue("phoneNumber", "supplier", "Please do not leave it blank!");
        }
        Pattern pattern = Pattern.compile("\\d*");
        Matcher matcher = pattern.matcher(supplier.getPhoneNumber().trim());
        if (matcher.matches() == false) {
            errors.rejectValue("phoneNumber", "supplier", "Phone numbers must be in the correct format!");
        }
        if (errors.hasErrors()) {
            return "admin/addsupplier";
        } else {
            SuppliersModel supplierm = new SuppliersModel();
            if (supplierm.create(supplier) == 1) {
                return "redirect:tosuppliermanagement.htm";
            }
            return "redirect:toaddsupplier.htm";
        }
    }

    @RequestMapping(value = "admin/toupdatesupplier", method = RequestMethod.GET)
    public String edit(@RequestParam(value = "supplierId") String id, ModelMap m) {
        SuppliersModel model = new SuppliersModel();
        Suppliers supplier = model.getSuppliers(id);
        m.addAttribute("supplier", supplier);
        return "admin/updatesupplier";
    }

    @RequestMapping(value = "admin/updatesupplier", method = RequestMethod.POST)
    public String update(@ModelAttribute(value = "supplier") Suppliers supplier, Model m, BindingResult errors) {
        if (supplier.getSupplierName().trim().length() == 0) {
            errors.rejectValue("supplierName", "supplier", "Please do not leave it blank!");
        }
        if (supplier.getAddress().trim().length() == 0) {
            errors.rejectValue("address", "supplier", "Please do not leave it blank!");
        }
        if (supplier.getPhoneNumber().trim().length() == 0) {
            errors.rejectValue("phoneNumber", "supplier", "Please do not leave it blank!");
        }
        Pattern pattern = Pattern.compile("\\d*");
        Matcher matcher = pattern.matcher(supplier.getPhoneNumber().trim());
        if (matcher.matches() == false) {
            errors.rejectValue("phoneNumber", "supplier", "Phone numbers must be in the correct format!");
        }
        if (errors.hasErrors()) {
            return "admin/updatesuppiler";
        } else {
            SuppliersModel model = new SuppliersModel();
            model.edit(supplier);
            return "redirect:tosuppliermanagement.htm";
        }
    }

    @RequestMapping(value = "admin/removesupplier", method = RequestMethod.GET)
    public String remove(@RequestParam(value = "supplierId") String id, ModelMap m) {
        SuppliersModel model = new SuppliersModel();
        Suppliers supplier = model.getSuppliers(id);
        model.remove(supplier);
        return "redirect:tosuppliermanagement.htm";
    }

}
