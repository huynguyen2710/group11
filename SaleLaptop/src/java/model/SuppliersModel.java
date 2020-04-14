/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Suppliers;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;


public class SuppliersModel {
     public List<Suppliers> getAll() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        List<Suppliers> list = new ArrayList<Suppliers>();
        try {
            session.beginTransaction();
            list = session.createCriteria(Suppliers.class).list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return list;
    }

    public int create(Suppliers sup) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.save(sup);
            session.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
            return 0;
        }
    }
    public Suppliers getSuppliers(String id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Suppliers sup = new Suppliers();
        try {
            session.beginTransaction();
            sup = (Suppliers) session.get(Suppliers.class, id);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }
        return sup;
    }

    public void edit(Suppliers sup) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.update(sup);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }
    }

    public void remove(Suppliers sup) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.delete(sup);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }
    }
}
