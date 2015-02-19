/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loveBucket.Repos;

import java.util.List;
import loveBucket.Domain.BlindDate;
import loveBucket.Domain.Date;
import loveBucket.Domain.Person;
import loveBucket.Domain.pendingdate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author lun
 */
public class DateRepo {
    
    private SessionFactory sessionFactory;
    
    public DateRepo(SessionFactory f) {
        sessionFactory = f;
    }
    
    @Transactional
    
    public List<Date> getDatesByID(String id) {
        Session session = sessionFactory.getCurrentSession();
        
        Query query = session.createSQLQuery(
                "SELECT * FROM date "
                + "WHERE  profile1 = ? OR profile2 = ?")
                .addEntity(Date.class)
                .setString(0, id)
                .setString(1, id);
        
        List<loveBucket.Domain.Date> result = query.list();
        
        if (result.isEmpty()) {
            return null;
        }
        return result;
    }
    
    @Transactional
    public void insertPendingDates(String profile1, String profile2) {
        
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createSQLQuery("INSERT INTO pendingdate values(?,?,?)")
                .setParameter(0, profile1)
                .setParameter(1, profile2)
                .setParameter(2, null);
        q.executeUpdate();
    }
    
    @Transactional
    public List<pendingdate> getpendingdate(Person person) {
        Session session = sessionFactory.getCurrentSession();
        
        Query query = session.createSQLQuery(
                "SELECT * FROM pendingdate pend, person per, profile pro "
                + "WHERE  per.ssn = ? AND per.ssn=pro.ownerssn AND"
                + "(pro.profileid=pend.profile1 OR pro.profileid=pend.profile2)")
                .addEntity(pendingdate.class)
                .setString(0, person.getSSN());
        
        List<pendingdate> result = query.list();
        
        if (result.isEmpty()) {
            return null;
        }
        return result;
    }
    
    @Transactional
    public void deletependingdate(String id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "delete from pendingdate where id = ? ")
                .addEntity(pendingdate.class)
                .setString(0, id);
        query.executeUpdate();
    }
    
    @Transactional
    public pendingdate checkpendingdate(String ssn, String id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT * FROM pendingdate \n"
                + "WHERE id = ? ")
                .addEntity(pendingdate.class)
                .setString(0, id);
        List<pendingdate> result = query.list();
        if (result.isEmpty()) {
            return null;
        }
        query = session.createSQLQuery(
                "SELECT * FROM pendingdate pend, person per, profile pro "
                + "WHERE per.ssn = ? AND per.ssn=pro.ownerssn AND id = ? "
                + "AND (pro.profileid=pend.profile1 OR pro.profileid=pend.profile2)  ")
                .addEntity(pendingdate.class)
                .setString(0, ssn)
                .setString(1, id);
        result = query.list();
        if (result.isEmpty()) {
            return null;
        }
        pendingdate pendingdate = result.get(0);
        return pendingdate;
    }
    
    @Transactional
    public void referdate(String yourprofile, String profilea, String profileb) {
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createSQLQuery("INSERT INTO blinddate values(?,?,?,NOW())")
                .setParameter(0, yourprofile)
                .setParameter(1, profilea)
                .setParameter(2, profileb);
        q.executeUpdate();
    }
    
    @Transactional
    public List<BlindDate> getblinddate(Person person) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT * FROM person per,profile pro,blinddate blind \n "
                + "WHERE per.ssn=? AND per.ssn=pro.ownerssn AND (pro.profileid=blind.profilea OR pro.profileid=blind.profileb OR pro.profileid=blind.profilec)")
                .addEntity(BlindDate.class)
                .setString(0, person.getSSN());
        List<BlindDate> result = query.list();
        return result;
    }
    
    @Transactional
    public int deletereferdate(String yourprofile, String profilea, String profileb) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "delete from blinddate where profilea=? AND profileb=? AND profilec=?")
                .addEntity(BlindDate.class)
                .setString(0, yourprofile)
                .setString(1, profilea)
                .setString(2, profileb);
        try {
            query.executeUpdate();
            return 1;
        } catch (Exception e) {
            return 0;
        }
        
    }
    
    @Transactional
    public String commentdate(String profile1, String profile2, String datetime, String comment) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("Select * from date "
                + "where profile1=? AND profile2=? AND date_time=?")
                .addEntity(Date.class)
                .setString(0, profile1)
                .setString(1, profile2)
                .setString(2, datetime);
        List<Date> result = query.list();
        System.out.print(profile1 + profile2 + datetime+"FUCK");
        if (result.isEmpty()) {
            return "Invalid Input";
        }
        Date date = result.get(0);
        if(date.getComments()==null){
             query = session.createSQLQuery("Update date set comments =?  "
                + "where profile1=? AND profile2=? AND date_time=?")
                .setString(0, comment)
                .setString(1, profile1)
                .setString(2, profile2)
                .setString(3, datetime);
        try {
            query.executeUpdate();
            return "Sucessfully editied comment";
        } catch (Exception e) {
            return "Invalid Input";
        }
        }
        query = session.createSQLQuery("Update date set comments =concat(?,?) "
                + "where profile1=? AND profile2=? AND date_time=?")
                .setString(0, comment)
                .setString(1, date.getComments())
                .setString(2, profile1)
                .setString(3, profile2)
                .setString(4, datetime);
        try {
            query.executeUpdate();
            return "Sucessfully editied comment";
        } catch (Exception e) {
            return "Invalid Input";
        }
    }
}
