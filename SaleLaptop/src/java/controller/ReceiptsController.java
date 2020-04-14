/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.ReceiptsModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReceiptsController {
    @RequestMapping(value = "admin/tocheckthebill", method = RequestMethod.GET)
    public String tocheckbill(ModelMap model) {
        ReceiptsModel r = new ReceiptsModel();
        model.addAttribute("listreceipt", r.getAll());
        return "admin/checkbill";
    }
}
