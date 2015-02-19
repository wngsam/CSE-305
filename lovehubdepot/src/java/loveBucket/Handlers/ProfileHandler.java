package loveBucket.Handlers;

import java.util.List;
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

    public ProfileRepo getProfileRepo() {
        return profileRepo;
    }

    public void setProfileRepo(ProfileRepo profileRepo) {
        this.profileRepo = profileRepo;
    }

    public List<Profile> searchProfile(Profile profile) {
        return profileRepo.searchProfile(profile);
    }
    public List<Profile> searchPerson(Person person){
        return profileRepo.searchPerson(person);
    }
    public List<Profile> getProfileBySSN(Person person){
        return profileRepo.getProfileBySSN(person);
    }
}
