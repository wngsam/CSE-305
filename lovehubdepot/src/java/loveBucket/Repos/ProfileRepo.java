package loveBucket.Repos;

import java.util.ArrayList;
import java.util.List;
import loveBucket.Domain.Likes;
import loveBucket.Domain.Person;
import loveBucket.Domain.Profile;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

public class ProfileRepo {

    private SessionFactory sessionFactory;

    public ProfileRepo(SessionFactory f) {
        sessionFactory = f;
    }

    @Transactional
    public Profile getProfileByID(String id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT * FROM profile "
                + "WHERE  profileID = ?")
                .addEntity(Profile.class)
                .setString(0, id);
        List<Profile> result = query.list();
        if (result.isEmpty()) {
            return null;
        }
        Profile profile = result.get(0);
        return profile;
        //Alternative cleaner way but auto generates necessary SQL
        //Profile rofile = (Profile)session.get(Profile.class, id);
    }

    @Transactional
    public Profile getProfileBySSN(String ssn) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT * FROM profile "
                + "WHERE  ownerssn = ?")
                .addEntity(Profile.class)
                .setString(0, ssn);
        List<Profile> result = query.list();
        if (result.isEmpty()) {
            return null;
        }
        Profile profile = result.get(0);
        return profile;
        //Alternative cleaner way but auto generates necessary SQL
        //Profile rofile = (Profile)session.get(Profile.class, id);
    }

    @Transactional
    public List<Likes> getLikesOnProfile(String profileID) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT * FROM likes "
                + "WHERE Likee = ?")
                .addEntity(Likes.class)
                .setString(0, profileID);
        List<Likes> result = query.list();
        return result;
    }

    @Transactional
    public List<Profile> searchProfile(Profile profile) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT DISTINCT * FROM profile "
                + "WHERE profileID = ? OR age = ? OR M_F = ? OR height = ? OR weight = ? OR hobbies = ? OR hairColor = ?")
                .addEntity(Profile.class)
                .setString(0, profile.getProfileID())
                .setString(1, profile.getAge())
                .setString(2, profile.getGender())
                .setString(3, profile.getHeight())
                .setString(4, profile.getWeight())
                .setString(5, profile.getHobbies())
                .setString(6, profile.getHairColor());

        List<Profile> result = query.list();
        return result;
    }

    @Transactional
    public List<Profile> searchPerson(Person person) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT  DISTINCT * FROM profile pro, person per "
                + "WHERE  (per.SSN=pro.ownerSSN ) AND (per.city=? OR per.state=? OR per.zipcode=?) ")
                .addEntity(Profile.class)
                .setString(0, person.getCity())
                .setString(1, person.getState())
                .setString(2, person.getZipcode());
        List<Profile> result = query.list();
        return result;
    }
    @Transactional
     public List<Profile> getProfileBySSN(Person person) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT  DISTINCT * FROM profile pro, person per "
                + "WHERE  per.SSN=? AND (per.SSN=pro.ownerSSN )  ")
                .addEntity(Profile.class)
                .setString(0, person.getSSN());
        List<Profile> result = query.list();
        return result;
    }
}
