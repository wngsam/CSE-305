package loveBucket.Repos;

import java.sql.ResultSet;
import java.util.List;
import loveBucket.Domain.Employee;
import loveBucket.Domain.Profile;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

public class EmployeeRepo {
    private SessionFactory sessionFactory;
    
    public EmployeeRepo(SessionFactory f) {
        sessionFactory = f;
    }
    @Transactional
    public String getRole(String SSN)
    {
        Session session = sessionFactory.getCurrentSession();
        Query query =  session.createSQLQuery(
                "SELECT * FROM Employee "+
                "WHERE  SSN = ?")
                .addEntity(Employee.class)
                .setString(0, SSN);
       
        List <Employee> result = query.list();
       
        if ( result.isEmpty() )
            return null;
        Employee employee = result.get(0);
        String employeeRole = employee.getRole();
        return employeeRole;        
    }
    
    ///Rep. Transactions
    @Transactional
    public List<Profile> dateSuggest(String profileID){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT DISTINCT A.* \n" +
                "FROM Date D, Profile P, Profile A, Profile X \n" +
                "WHERE \n" +
                "	(P.ProfileID = ? AND P.ProfileID = D.Profile1 AND D.Profile2 = X.ProfileID AND A.M_F = X.M_F AND \n" +
                "	(A.HairColor = X.HairColor OR A.Weight = X.Weight OR A.Age = X.Age OR A.Height = X.Height \n" +
                "       OR P.DatingAgeRangeStart<=A.Age<=P.DatingAgeRangeEnd)) OR \n" +
                "       (P.ProfileID = ? AND P.ProfileID = D.Profile2 AND D.Profile1 = X.ProfileID AND A.M_F = X.M_F AND \n" +
                "       (A.HairColor = X.HairColor OR A.Weight = X.Weight OR A.Age = X.Age OR A.Height = X.Height \n" +
                "       OR P.DatingAgeRangeStart<=A.Age<=P.DatingAgeRangeEnd));")
                .addEntity(Profile.class)
                .setString(0, profileID)
                .setString(1, profileID);
                
                return query.list();
    }
    
    @Transactional
    public String mailingList(){
        
        String maillist="";
        
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT B.FirstName, B.LastName, B.Street, B.City, B.State, B.Zipcode \n" +
                "FROM User A, Person B \n" +
                "WHERE A.SSN = B.SSN");
        
        return maillist;
    }
    
    @Transactional
    public String delete(String SSN){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
            "DELETE FROM person "
            + "WHERE SSN=?")
            .setString(0, SSN);
        int result = query.executeUpdate();
        String message;
        if (result == 0)
            message = "No employee was deleted because there was no match for that SSN";
        else
            message = "Employee matching SSN: "+SSN+" was deleted";
        return message;
    }  
    
    @Transactional
    public void edit(String SSN,String role,String startDate,String hourlyRate){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
            "UPDATE employee "
                    +"SET SSN=? , role=?, startDate=?,hourlyRate=?"
            + "WHERE SSN=?")
            .setString(0, SSN)
            .setString(1, role)
            .setString(2, startDate)
            .setString(3, hourlyRate)
            .setString(4, SSN);
        query.executeUpdate();
    }     
    @Transactional
    public void add(String SSN, String role, String startDate, String hourlyRate) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
            "INSERT INTO  employee "
                    +"(SSN, role, startDate,hourlyRate)"
            + "VALUES (?,?,?,?)")
            .setString(0, SSN)
            .setString(1, role)
            .setString(2, startDate)
            .setString(3, hourlyRate);
        query.executeUpdate();         
    }
}
