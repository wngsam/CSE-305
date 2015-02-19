package loveBucket.Repos;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.UUID;
import loveBucket.Domain.Account;
import loveBucket.Domain.Person;
import loveBucket.Domain.Profile;
import loveBucket.Domain.User;
import org.apache.commons.codec.binary.Hex;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

public class PersonRepo {

    private SessionFactory sessionFactory;

    public PersonRepo(SessionFactory f) {
        sessionFactory = f;
    }

    @Transactional
    public List<Person> getAllPersons() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT * FROM person ")
                .addEntity(Person.class);
        List<Person> allPersons = query.list();
        return allPersons;
    }

    @Transactional
    public int addPerson(Person person) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        Session session = sessionFactory.getCurrentSession();
        String key = UUID.randomUUID().toString();
        Query q = session.createSQLQuery("INSERT INTO person values(?,?,?,?,?  ,?,?,?,?,? )")
                .setParameter(0, person.getSSN())
                .setParameter(1, hash(person.getPassword()))
                .setParameter(2, person.getFirstName())
                .setParameter(3, person.getLastName())
                .setParameter(4, person.getStreet())
                .setParameter(5, person.getCity())
                .setParameter(6, person.getState())
                .setParameter(7, person.getZipcode())
                .setParameter(8, person.getEmail())
                .setParameter(9, person.getTelephone());
        q.executeUpdate();
        return 0;
    }

    private String hash(String s) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        byte[] toHash = s.getBytes("UTF-8");
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashed = md.digest(toHash);
        String hash = new String(Hex.encodeHex(hashed));
        return hash;
    }

    @Transactional
    public List<Person> searchPerson(Person person) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT DISTINCT * FROM person "
                + "WHERE city = ? OR state = ? OR zipcode = ?")
                .addEntity(Person.class)
                .setString(0, person.getCity())
                .setString(1, person.getState())
                .setString(2, person.getZipcode());
        List<Person> result = query.list();
        return result;
    }

    @Transactional
    public Person getPersonByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT  * FROM person "
                + "WHERE email = ? ")
                .addEntity(Person.class)
                .setString(0, email);
        List<Person> result = query.list();
        if (result.isEmpty()) {
            return null;
        }
        Person person = result.get(0);
        return person;
    }

    @Transactional
    public Person getPersonBySSN(String ssn) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT * FROM person "
                + "WHERE  ssn = ?")
                .addEntity(Person.class)
                .setString(0, ssn);
        List<Person> result = query.list();
        if (result.isEmpty()) {
            return null;
        }
        Person person = result.get(0);
        return person;
        //Alternative cleaner way but auto generates necessary SQL
        //Profile rofile = (Profile)session.get(Profile.class, id);
    }
    
    @Transactional
    public Person login(String email, String password){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT * FROM person "
                + "WHERE email=? AND password=?")
                .addEntity(Person.class)
                .setString(0, email)
                .setString(1, password);
        List<Person> result = query.list();
        if (result.isEmpty()) {
            return null;
        }
        Person authPerson = (Person) result.get(0);
        return authPerson;
    }

    @Transactional
    public String deletePersonBySSN(String SSN) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "DELETE FROM person "
                + "WHERE SSN=?")
                .setString(0, SSN);
        int result = query.executeUpdate();
        String message;
        if (result == 0) {
            message = "No person was delete because there was no match for that SSN";
        } else {
            message = "Person matching SSN: " + SSN + " was deleted";
        }
        return message;
    }

    @Transactional
    public String deletePersonByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "DELETE FROM person "
                + "WHERE SSN=?")
                .setString(0, email);
        int result = query.executeUpdate();
        String message;
        if (result == 0) {
            message = "No person was delete because there was no match for that SSN";
        } else {
            message = "Person matching email: " + email + " was deleted";
        }
        return message;
    }

    @Transactional
    public String createaccount(String ssn, String cardnumber, String accountnumber) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("insert into account values(?,?,?,NOW())")
                .setString(0, ssn)
                .setString(1, cardnumber)
                .setString(2, accountnumber);
        try {
            query.executeUpdate();
            return "Successfully added account";
        } catch (Exception e) {
            return "Invalid input";
        }
    }

    @Transactional
    public List<Account> getaccountbyssn(Person person) {

        Session session = sessionFactory.getCurrentSession();
        System.out.print(person.getSSN());
        Query query = session.createSQLQuery("select * from account where ownerssn=?")
                .addEntity(Account.class)
                .setString(0, person.getSSN());
        System.out.print(query.list());
        List<Account> result = query.list();
        
        return result;
    }
    @Transactional
    public String deleteaccount(String ssn,String cardnumber){
       
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "DELETE FROM account "
                + "WHERE ownerssn=? AND cardnumber=?")
                .setString(0, ssn)
                .setString(1,cardnumber);
        try{
            query.executeUpdate();
            return "Sucessfully delted account";
        }
        catch(Exception e){
            return "invalid input";
        }
    }
    @Transactional
    public List<User> getuserbyssn(Person person){
          Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("Select * from user where ssn=?")
                .addEntity(User.class)
                .setString(0, person.getSSN());
        List<User> result = query.list();
        return result;
    }
    @Transactional
    public String upgradeaccount(String ssn) {
      Session session = sessionFactory.getCurrentSession();
      Query query = session.createSQLQuery("Select * from user where ssn=? ")
              .addEntity(User.class)
              .setString(0, ssn);
      List<User> result = query.list();
      User user = result.get(0);
      String PPP = user.getPPP();
      System.out.print(PPP);
      if("User-User".equals(PPP)){
           query = session.createSQLQuery("Update user set PPP=? ")
                   .setString(0, "Good-User");
           query.executeUpdate();
           return "Upgraded to Good-User";
      }
      else if("Good-User".equals(PPP)){
           query = session.createSQLQuery("Update user set PPP=? ")
                   .setString(0, "Super-User");
           query.executeUpdate();
           return "Upgraded to Super-User";
      }
      else{
          return "Unable to Upgrade.  Already at Super-User";
      }
    }
}
