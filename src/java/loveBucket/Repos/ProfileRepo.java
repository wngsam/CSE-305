package loveBucket.Repos;

import java.util.ArrayList;
import java.util.List;
import loveBucket.Domain.Date;
import loveBucket.Domain.Likes;
import loveBucket.Domain.Person;
import loveBucket.Domain.Profile;
import loveBucket.Domain.pendingdate;
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
                + "WHERE Likee = ? OR liker=?")
                .addEntity(Likes.class)
                .setString(0, profileID)
                .setString(1, profileID);
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

    /**
     * Needed to check for null '' which SQL query did not recognize as null.
     *
     * @param a
     * @return
     */
    public String checkNull(String a) {
        if (a.equals("")) {
            return null;
        }
        return a;
    }

    /////
    @Transactional
    public void editProfile(Profile profile) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "UPDATE profile \n"
                + "SET Age = COALESCE(?, Age), DatingAgeRangeStart = COALESCE(?, DatingAgeRangeStart), DatingAgeRangeEnd = COALESCE(?, DatingAgeRangeEnd), DatinGeoRange = COALESCE(?, DatinGeoRange), M_F = COALESCE(?, M_F), Hobbies = COALESCE(?, Hobbies), Height = COALESCE(?, Height), Weight = COALESCE(?, Weight), HairColor = COALESCE(?, HairColor) \n"
                + "WHERE ProfileID = ? ")
                .setString(0, checkNull(profile.getAge()))
                .setString(1, checkNull(profile.getDatingAgeRangeStart()))
                .setString(2, checkNull(profile.getDatingAgeRangeEnd()))
                .setString(3, checkNull(profile.getDatinGeoRange()))
                .setString(4, checkNull(profile.getGender()))
                .setString(5, checkNull(profile.getHobbies()))
                .setString(6, checkNull(profile.getHeight()))
                .setString(7, checkNull(profile.getWeight()))
                .setString(8, checkNull(profile.getHairColor()))
                .setString(9, checkNull(profile.getProfileID()));
        query.executeUpdate();

    }

    @Transactional
    public void likeProfile(String liker, String likee) {
        if (liker != null && likee != null) {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createSQLQuery(
                    "INSERT INTO Likes(Liker, Likee, Date_Time)\n"
                    + "Values(?,?,NOW()) ")
                    .setString(0, liker)
                    .setString(1, likee);
            query.executeUpdate();
        }
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

    @Transactional
    public List<Profile> getMostPopular() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT ProfileID, OwnerSSN, Age, DatingAgeRangeStart, DatingAgeRangeEnd, DatinGeoRange, M_F, Hobbies, Height, Weight, HairColor, CreationDate, LastModDate \n"
                + "FROM Profile P, \n"
                + "        (SELECT Likee, Count(*) AS Likes \n"
                + "        FROM likes D \n"
                + "        Group By Likee \n"
                + "        Order By Count(*) DESC) AS D \n"
                + "WHERE P.profileID=D.Likee \n"
                + "Order By Likes DESC")
                .addEntity(Profile.class);
        query.setMaxResults(12);
        List<Profile> result = query.list();
        return result;
    }

    @Transactional
    public List<Profile> getHighestRated() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT P.ProfileID, P.OwnerSSN, P.Age, P.DatingAgeRangeStart, P.DatingAgeRangeEnd, P.DatinGeoRange, P.M_F, P.Hobbies, P.Height, P.Weight, P.HairColor, P.CreationDate, P.LastModDate \n"
                + "FROM Profile P, User U \n"
                + "WHERE U.SSN = P.OwnerSSN \n"
                + "Order By U.Rating DESC;")
                .addEntity(Profile.class);
        //query.setMaxResults(12);
        List<Profile> result = query.list();
        return result;
    }

    @Transactional
    public List<Profile> getMostActive() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT * \n"
                + "FROM Profile \n"
                + "Order By LastModDate DESC").addEntity(Profile.class);
        //query.setMaxResults(12);
        List<Profile> result = query.list();
        return result;
    }

    @Transactional
    public Profile nodateself(String ssn, String dateprofile) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT * FROM profile pro, person per \n"
                + "WHERE per.ssn = ? AND per.ssn=pro.ownerssn AND pro.profileid=?")
                .addEntity(Profile.class)
                .setString(0, ssn)
                .setString(1, dateprofile);
        List<Profile> result = query.list();

        if (result.isEmpty()) {

            return null;
        }
        Profile profile = result.get(0);
        return profile;
    }

    @Transactional
    public void addprofile(Profile profile) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "INSERT INTO profile\n"
                + "Values(?,?,?,?,?,?,?,?,?,?,?,NOW(),NOW())")
                .setString(0, checkNull(profile.getProfileID()))
                .setString(1, checkNull(profile.getOwnerSSN()))
                .setString(2, checkNull(profile.getAge()))
                .setString(3, checkNull(profile.getDatingAgeRangeStart()))
                .setString(4, checkNull(profile.getDatingAgeRangeEnd()))
                .setString(5, checkNull(profile.getDatinGeoRange()))
                .setString(6, checkNull(profile.getGender()))
                .setString(7, checkNull(profile.getHobbies()))
                .setString(8, checkNull(profile.getHeight()))
                .setString(9, checkNull(profile.getWeight()))
                .setString(10, checkNull(profile.getHairColor()));
        query.executeUpdate();
    }

    @Transactional
    public void deleteprofile(String profileid) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "delete from profile where profileid = ? ")
                .addEntity(Profile.class)
                .setString(0, profileid);
        query.executeUpdate();
    }

    @Transactional
    public void geodate(String ssn, String profileid) {
        List<pendingdate> pendingdate;
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("Select * from person \n"
                + "Where ssn=?")
                .addEntity(Person.class)
                .setString(0, ssn);
        List<Person> personresult = query.list();
        String zipcode = personresult.get(0).getZipcode();
        query = session.createSQLQuery("Select * from profile \n"
                + "Where profileid=?")
                .addEntity(Profile.class)
                .setString(0, profileid);
        List<Profile> profileresult = query.list();
        String rangezip = profileresult.get(0).getDatinGeoRange();
        for (int i = Integer.parseInt(zipcode); i <= Integer.parseInt(rangezip); i++) {
            query = session.createSQLQuery("Select * from profile pro,person per \n"
                    + "Where pro.ownerssn=per.ssn AND per.zipcode=?")
                    .addEntity(Profile.class)
                    .setString(0, Integer.toString(i));
            profileresult = query.list();
            if (!profileresult.isEmpty()) {
                for (int x = 0; x < profileresult.size(); x++) {
                    Profile profile = profileresult.get(x);
                    query = session.createSQLQuery("Select * from pendingdate \n"
                            + "Where (profile1=? AND profile2=?) OR (profile1=? AND profile2=?)")
                            .addEntity(pendingdate.class)
                            .setString(0, profileid)
                            .setString(1, profile.getProfileID())
                            .setString(2, profile.getProfileID())
                            .setString(3, profileid);
                    pendingdate = query.list();

                    if (pendingdate.isEmpty()) {
                        query = session.createSQLQuery("INSERT INTO pendingdate values(?,?,?)")
                                .setParameter(0, profileid)
                                .setParameter(1, profile.getProfileID())
                                .setParameter(2, null);
                        query.executeUpdate();
                        return;
                    }
                }
            }
        }
        for (int i = Integer.parseInt(zipcode) - Integer.parseInt(rangezip); i <= Integer.parseInt(zipcode); i++) {
            query = session.createSQLQuery("Select * from profile pro,person per \n"
                    + "Where pro.ownerssn=per.ssn AND per.zipcode=?")
                    .addEntity(Profile.class)
                    .setString(0, Integer.toString(i));
            profileresult = query.list();
            if (!profileresult.isEmpty()) {
                for (int x = 0; x < profileresult.size(); x++) {
                    Profile profile = profileresult.get(x);
                    query = session.createSQLQuery("Select * from pendingdate \n"
                            + "Where (profile1=? AND profile2=?) OR (profile1=? AND profile2=?)")
                            .addEntity(pendingdate.class)
                            .setString(0, profileid)
                            .setString(1, profile.getProfileID())
                            .setString(2, profile.getProfileID())
                            .setString(3, profileid);
                    pendingdate = query.list();
                    if (pendingdate.isEmpty()) {
                        query = session.createSQLQuery("INSERT INTO pendingdate values(?,?,?)")
                                .setParameter(0, profileid)
                                .setParameter(1, profile.getProfileID())
                                .setParameter(2, null);
                        query.executeUpdate();
                        return;
                    }
                }
            }
        }
    }
    @Transactional
    public List<Date> getLocationRanked(){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery(
                "SELECT * \n" +
                "FROM Date \n" +
                "GROUP by location \n" +
                "ORDER by count(location) desc")
                .addEntity(Date.class);
        List<Date> result = query.list();
        return result;
        
    }

    @Transactional
    public List<Profile> getsuggestlist(String profileid) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("Select * from profile where profileid = ?"
        )
                .addEntity(Profile.class)
                .setString(0, profileid);
        List<Profile> profiles = query.list();
        int start = Integer.parseInt(profiles.get(0).getDatingAgeRangeStart());
        int end = Integer.parseInt(profiles.get(0).getDatingAgeRangeEnd());
        profiles.clear();
        for (int i = start; i <= end; i++) {
            query = session.createSQLQuery(
                    "Select * from profile Where age = ? AND profileid != ?")
                    .addEntity(Profile.class)
                    .setString(0, Integer.toString(i))
                    .setString(1, profileid);
            profiles.addAll(query.list());
        }

        return profiles;
    }
}
