package loveBucket.Repos;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.UUID;
import loveBucket.Domain.Person;
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
                "SELECT * FROM profile ")
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
        if(result.isEmpty()){
            return null;
        }
        Person person = result.get(0);
        return person;
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
        if (result.isEmpty() )
            return null;
        Person authPerson = (Person) result.get(0);
        return authPerson;
    }
    
}
