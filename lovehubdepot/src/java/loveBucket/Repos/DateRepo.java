/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loveBucket.Repos;

import java.util.List;
import loveBucket.Domain.Date;
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
    
    public DateRepo(SessionFactory f) { sessionFactory = f;}  
     @Transactional
     
    public List<Date> getDatesByID(String id){
        Session session = sessionFactory.getCurrentSession();
        
        Query query =  session.createSQLQuery(
                "SELECT * FROM date "+
                "WHERE  profile1 = ? OR profile2 = ?")
                .addEntity(Date.class)
                .setString(0, id)
                .setString(1, id);
       
        List <loveBucket.Domain.Date> result = query.list();
       
        if ( result.isEmpty() )
            return null;
        return result;
    }
    
}
