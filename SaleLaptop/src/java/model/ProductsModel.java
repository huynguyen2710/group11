/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.ProductInCart;
import entity.Products;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;


public class ProductsModel {
    public List<Products> getAll() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        List<Products> list = new ArrayList<Products>();
        try {
            session.beginTransaction();
            list = session.createCriteria(Products.class).list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return list;
    }
    
    @Autowired
    public int create(Products p) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            ModelMap model = new ModelMap();
            session.beginTransaction();
            session.save(p);
            session.getTransaction().commit();
            model.addAttribute("notify", "Product has been added!");
            return 1;
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
            return 0;
        }
    }

    public Products getProduct(String id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Products p = new Products();
        try {
            session.beginTransaction();
            p = (Products) session.get(Products.class, id);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }
        return p;
    }

    
    
    public void edit(Products p) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.update(p);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }
    }

    public void remove(Products p) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.delete(p);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }
    }
}
