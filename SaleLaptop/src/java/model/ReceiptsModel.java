/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.ReceiptDetails;
import entity.Receipts;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;


public class ReceiptsModel {
    public List<Receipts> getAll() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        List<Receipts> list = new ArrayList<Receipts>();
        try {
            session.beginTransaction();
            list = session.createCriteria(Receipts.class).list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return list;
    }

    public int create(Receipts rec) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.save(rec);
            session.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
            return 0;
        }
    }
    public int createDT(ReceiptDetails rdt) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.save(rdt);
            session.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
            return 0;
        }
    }
    public Receipts getReceipts(String id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Receipts rec = new Receipts();
        try {
            session.beginTransaction();
            rec = (Receipts) session.get(Receipts.class, id);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }
        return rec;
    }

    public void edit(Receipts rec) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.update(rec);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }
    }

    public void remove(Receipts rec) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.delete(rec);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }
    }
}
