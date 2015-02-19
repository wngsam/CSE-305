package loveBucket.Controllers;

import java.util.List;
import loveBucket.Domain.Date;
import loveBucket.Domain.Likes;
import loveBucket.Domain.Profile;
import loveBucket.Handlers.DatesHandler;
import loveBucket.Handlers.ProfileHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProfilePageController {
    private ProfileHandler profileHandler;
    private DatesHandler datesHandler;

    public DatesHandler getDatesHandler() {
        return datesHandler;
    }

    public void setDatesHandler(DatesHandler datesHandler) {
        this.datesHandler = datesHandler;
    }
    public ProfileHandler getProfileHandler() { return profileHandler; }
    public void setProfileHandler(ProfileHandler profileHandler) { this.profileHandler = profileHandler; }    
    
    @RequestMapping(value="/viewprofile={profileID}", method= RequestMethod.GET)
    public ModelAndView Profile(@PathVariable("profileID") String profileID, ModelAndView mv) {
        List <Date> dates;
        List <Likes> likes;
        Profile profile;
        profile = profileHandler.findProfileById(profileID);  
        likes = profileHandler.getLikesOnProfile(profileID);
        dates = datesHandler.getDatesByID(profileID);
        
        if(profile!= null && likes!= null && dates!= null){
           mv.addObject("currentProfile", profile);
           mv.addObject("likes",likes);
           mv.addObject("dates",dates);
           mv.setViewName("profile"); 
        } 
        
        else{ mv.setViewName("redirect:/mainpage"); }        
        return mv;
    }  
}