package loveBucket.Handlers;

import java.util.List;
import loveBucket.Domain.Date;
import loveBucket.Domain.Likes;
import loveBucket.Domain.Person;
import loveBucket.Domain.Profile;
import loveBucket.Repos.ProfileRepo;

public class ProfileHandler {

    private ProfileRepo profileRepo;

    public ProfileHandler() {
    }

    public Profile findProfileById(String ID) {
        return profileRepo.getProfileByID(ID);
    }

    public List<Likes> getLikesOnProfile(String profileID) {
        return profileRepo.getLikesOnProfile(profileID);
    }

    public List<Date> getLocationRanked(){
        return profileRepo.getLocationRanked();
    }
    
    public ProfileRepo getProfileRepo() {
        return profileRepo;
    }

    public void setProfileRepo(ProfileRepo profileRepo) {
        this.profileRepo = profileRepo;
    }

    public List<Profile> searchProfile(Profile profile) {
        return profileRepo.searchProfile(profile);
    }

    public List<Profile> searchPerson(Person person) {
        return profileRepo.searchPerson(person);
    }

    public void editProfile(Profile profile) {
        profileRepo.editProfile(profile);
    }

    public void likeProfile(String liker, String likee) {
        profileRepo.likeProfile(liker, likee);
    }

    public List<Profile> getProfileBySSN(Person person) {
        return profileRepo.getProfileBySSN(person);
    }

    public List<Profile> getMostPopularProfiles() {
        return profileRepo.getMostPopular();
    }
    
    public List<Profile> getHighestRated(){
        return profileRepo.getHighestRated();
    }
    
    public List<Profile> getMostActive(){
        return profileRepo.getMostActive();
    }

    public Profile nodateself(String ssn,String dateprofile) {
        return profileRepo.nodateself(ssn,dateprofile);
    }

    public void addprofile(Profile profile) {
        profileRepo.addprofile(profile);
    }
    public void deleteprofile(String profileid){
        profileRepo.deleteprofile(profileid);
    }
    public void geodate(String ssn,String profileid){
        profileRepo.geodate(ssn,profileid);
    }
 public List<Profile> getsuggestlist(String profileid){
       return profileRepo.getsuggestlist(profileid);
   }
}
