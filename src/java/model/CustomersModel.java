/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Customers;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.hibernate.Session;


public class CustomersModel {
    public List<Customers> getAll() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        List<Customers> list = new ArrayList<Customers>();
        try {
            session.beginTransaction();
            list = session.createCriteria(Customers.class).list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return list;
    }
    public Boolean checkUserName(String username, String email){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        List<Customers> list = new ArrayList<>();
        try {
            session.beginTransaction();
            list = session.createCriteria(Customers.class).list();
            session.getTransaction().commit();
            for(int i =0; i<list.size();i++){
                if(username.equals(list.get(i).getUserName().trim())&&email.equals(list.get(i).getEmail().trim())){
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return false;
    }
    
    static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    Random rdd = new Random();
    public String randomString( int a ){
       StringBuilder sb = new StringBuilder( a );
       for( int i = 0; i <a; i++ ) 
          sb.append( AB.charAt( rdd.nextInt(AB.length()) ) );
       return sb.toString();
    }
    public int create(Customers c) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.save(c);
            session.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
            return 0;
        }
    }
    public Customers getCustomers(String id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Customers c = new Customers();
        try {
            session.beginTransaction();
            c = (Customers) session.get(Customers.class, id);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }
        return c;
    }
    
    public void edit(Customers c) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.update(c);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }
    }

    public void remove(Customers c) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.delete(c);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("error:" + e.toString());
        }
    }
}
