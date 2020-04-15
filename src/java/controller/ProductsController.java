/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Products;
import entity.Suppliers;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletContext;
import model.ProductsModel;
import model.SuppliersModel;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping(value = "admin/")
public class ProductsController {
    @RequestMapping(value = "toproductmanagement", method = RequestMethod.GET)
    public String toProductManagement(ModelMap model) {
        ProductsModel product = new ProductsModel();
        model.addAttribute("listproduct", product.getAll());
        return "admin/productmanagement";
    }

    public void getSuppierID(ModelMap model) {
        SuppliersModel sm = new SuppliersModel();
        List<Suppliers> list = sm.getAll();
        if (!list.isEmpty()) {
            HashMap<String, String> cateMap = new HashMap<String, String>();
            for (Suppliers s : list) {
                cateMap.put(String.valueOf(s.getSupplierId()), s.getSupplierName());
            }
            model.addAttribute("supplierlist", cateMap);
        }
    }

    @RequestMapping(value = "toaddproduct", method = RequestMethod.GET)
    public String toAddProduct(ModelMap model) {
        Products product = new Products();
        getSuppierID(model);
        model.addAttribute("product", product);
        return "admin/addproduct";
    }

    @Autowired
    ServletContext context;

    @RequestMapping(value = "createproduct", method = RequestMethod.POST)
    public String create(@ModelAttribute(value = "product") Products product, @RequestParam("img2") MultipartFile photo, BindingResult errors, ModelMap model) {
        try {
            String photoPath = context.getRealPath("/resources/images/" + product.getProductId()+ photo.getOriginalFilename());
            photo.transferTo(new File(photoPath));
            if (photo.getOriginalFilename().equals("")) {
                product.setImage("product.png");
            } else {
                product.setImage(product.getProductId()+ photo.getOriginalFilename());
            }
        } catch (Exception e) {
            product.setImage("product.png");
        }
        if (product.getProductId().trim().length() == 0) {
            errors.rejectValue("productId", "product", "Please do not leave it blank!");
        }
        if (product.getName().trim().length() == 0) {
            errors.rejectValue("name", "product", "Please do not leave it blank!");
        }
        if (product.getBrand().trim().length() == 0) {
            errors.rejectValue("brand", "product", "Please do not leave it blank!");
        }
        if (product.getPrice()== 0) {
            errors.rejectValue("price", "product", "Vui lòng nhập giá bán");
        }
        if (product.getModelCode().trim().length() == 0) {
            errors.rejectValue("modelCode", "product", "Please do not leave it blank!");
        }
        if (product.getSize().trim().length() == 0) {
            errors.rejectValue("size", "product", "Please do not leave it blank!");
        }
        if (product.getWeight()== 0) {
            errors.rejectValue("weight", "product", "Please do not leave it blank!");
        }
        if (product.getColor().trim().length() == 0) {
            errors.rejectValue("color", "product", "Please do not leave it blank!");
        }
        if (product.getNetworkCommunication().trim().length() == 0) {
            errors.rejectValue("networkCommunication", "product", "Please do not leave it blank!");
        }
        if (product.getProcessor().trim().length() == 0) {
            errors.rejectValue("processor", "product", "Please do not leave it blank!");
        }
        if (product.getProcessorSpeed().trim().length() == 0) {
            errors.rejectValue("processorSpeed", "product", "Please do not leave it blank!");
        }
        if (product.getOperatingSystem().trim().length() == 0) {
            errors.rejectValue("operatingSystem", "product", "Please do not leave it blank!");
        }
        if (product.getScreenSize().trim().length() == 0) {
            errors.rejectValue("screenSize", "product", "Please do not leave it blank!");
        }
        if (product.getResolution().trim().length() == 0) {
            errors.rejectValue("resolution", "product", "Please do not leave it blank!");
        }
        if (product.getScreenType().trim().length() == 0) {
            errors.rejectValue("screenType", "product", "Please do not leave it blank!");
        }
        if (product.getVga().trim().length() == 0) {
            errors.rejectValue("vga", "product", "Please do not leave it blank!");
        }
        if (product.getVgaMemory().trim().length() == 0) {
            errors.rejectValue("vgaMemory", "product", "Please do not leave it blank!");
        }
        if (product.getHardDriveCapacity().trim().length() == 0) {
            errors.rejectValue("hardDriveCapacity", "product", "Please do not leave it blank!");
        }
        if (product.getDisc().trim().length() == 0) {
            errors.rejectValue("disc", "product", "Please do not leave it blank!");
        }
        if (product.getRamMemory().trim().length() == 0) {
            errors.rejectValue("ramMemory", "product", "Please do not leave it blank!");
        }
        if (product.getRamGen().trim().length() == 0) {
            errors.rejectValue("ramGen", "product", "Please do not leave it blank!");
        }
        if (product.getBus().trim().length() == 0) {
            errors.rejectValue("bus", "product", "Please do not leave it blank!");
        }
        if (product.getCamera().trim().length() == 0) {
            errors.rejectValue("camera", "product", "Please do not leave it blank!");
        }
        if (product.getPort().trim().length() == 0) {
            errors.rejectValue("port", "product", "Please do not leave it blank!");
        }
        if (product.getBattery().trim().length() == 0) {
            errors.rejectValue("battery", "product", "Please do not leave it blank!");
        }
        if (errors.hasErrors()) {
            getSuppierID(model);
            model.addAttribute("product", product);
            return "admin/addproduct";
        } else {
            ProductsModel productm = new ProductsModel();
            if (productm.create(product) == 1) {
                return "redirect:toproductmanagement.htm";
            }
            return "redirect:toaddproduct.htm";
        }
    }

    @RequestMapping(value = "editproduct", method = RequestMethod.GET)
    public String edit(@RequestParam(value = "productId") String id, ModelMap m) {
        ProductsModel model = new ProductsModel();
        Products product = model.getProduct(id);
        m.addAttribute("product", product);
        getSuppierID(m);
        return "admin/updateproduct";
    }

    @RequestMapping(value = "updateproduct", method = RequestMethod.POST)
    public String update(@ModelAttribute(value = "product") Products product, Model m, @RequestParam("img2") MultipartFile photo, BindingResult errors, ModelMap model) {
        try {
            String photoPath = context.getRealPath("/resources/images/" + product.getProductId()+ photo.getOriginalFilename());
            photo.transferTo(new File(photoPath));
            if (photo.getOriginalFilename().equals("")) {
                product.setImage("product.png");
            } else {
                product.setImage(product.getProductId()+ photo.getOriginalFilename());
            }
        } catch (Exception e) {
            product.setImage("product.png");
        }
        if (product.getProductId().trim().length() == 0) {
            errors.rejectValue("productId", "product", "Please do not leave it blank!");
        }
        if (product.getName().trim().length() == 0) {
            errors.rejectValue("name", "product", "Please do not leave it blank!");
        }
        if (product.getBrand().trim().length() == 0) {
            errors.rejectValue("brand", "product", "Please do not leave it blank!");
        }
        if (product.getPrice()== 0) {
            errors.rejectValue("price", "product", "Vui lòng nhập giá bán");
        }
        if (product.getModelCode().trim().length() == 0) {
            errors.rejectValue("modelCode", "product", "Please do not leave it blank!");
        }
        if (product.getSize().trim().length() == 0) {
            errors.rejectValue("size", "product", "Please do not leave it blank!");
        }
        if (product.getWeight()== 0) {
            errors.rejectValue("weight", "product", "Please do not leave it blank!");
        }
        if (product.getColor().trim().length() == 0) {
            errors.rejectValue("color", "product", "Please do not leave it blank!");
        }
        if (product.getNetworkCommunication().trim().length() == 0) {
            errors.rejectValue("networkCommunication", "product", "Please do not leave it blank!");
        }
        if (product.getProcessor().trim().length() == 0) {
            errors.rejectValue("processor", "product", "Please do not leave it blank!");
        }
        if (product.getProcessorSpeed().trim().length() == 0) {
            errors.rejectValue("processorSpeed", "product", "Please do not leave it blank!");
        }
        if (product.getOperatingSystem().trim().length() == 0) {
            errors.rejectValue("operatingSystem", "product", "Please do not leave it blank!");
        }
        if (product.getScreenSize().trim().length() == 0) {
            errors.rejectValue("screenSize", "product", "Please do not leave it blank!");
        }
        if (product.getResolution().trim().length() == 0) {
            errors.rejectValue("resolution", "product", "Please do not leave it blank!");
        }
        if (product.getScreenType().trim().length() == 0) {
            errors.rejectValue("screenType", "product", "Please do not leave it blank!");
        }
        if (product.getVga().trim().length() == 0) {
            errors.rejectValue("vga", "product", "Please do not leave it blank!");
        }
        if (product.getVgaMemory().trim().length() == 0) {
            errors.rejectValue("vgaMemory", "product", "Please do not leave it blank!");
        }
        if (product.getHardDriveCapacity().trim().length() == 0) {
            errors.rejectValue("hardDriveCapacity", "product", "Please do not leave it blank!");
        }
        if (product.getDisc().trim().length() == 0) {
            errors.rejectValue("disc", "product", "Please do not leave it blank!");
        }
        if (product.getRamMemory().trim().length() == 0) {
            errors.rejectValue("ramMemory", "product", "Please do not leave it blank!");
        }
        if (product.getRamGen().trim().length() == 0) {
            errors.rejectValue("ramGen", "product", "Please do not leave it blank!");
        }
        if (product.getBus().trim().length() == 0) {
            errors.rejectValue("bus", "product", "Please do not leave it blank!");
        }
        if (product.getCamera().trim().length() == 0) {
            errors.rejectValue("camera", "product", "Please do not leave it blank!");
        }
        if (product.getPort().trim().length() == 0) {
            errors.rejectValue("port", "product", "Please do not leave it blank!");
        }
        if (product.getBattery().trim().length() == 0) {
            errors.rejectValue("battery", "product", "Please do not leave it blank!");
        }
        if (errors.hasErrors()) {
            getSuppierID(model);
            model.addAttribute("product", product);
            return "admin/toupdateproduct";
        } else {
            ProductsModel model2 = new ProductsModel();
            model2.edit(product);
            return "redirect:toproductmanagement.htm";
        }
    }

    @RequestMapping(value = "removeproduct", method = RequestMethod.GET)
    public String remove(@RequestParam(value = "productId") String id, ModelMap m) {
        ProductsModel model = new ProductsModel();
        Products product = model.getProduct(id);
        model.remove(product);
        return "redirect:toproductmanagement.htm";
    }
}
