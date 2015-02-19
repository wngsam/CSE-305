package loveBucket.Controllers;

import java.util.List;
import javax.servlet.http.HttpSession;
import loveBucket.Domain.Date;
import loveBucket.Domain.Likes;
import loveBucket.Domain.Person;
import loveBucket.Domain.Profile;
import loveBucket.Handlers.DatesHandler;
import loveBucket.Handlers.ProfileHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

    public ProfileHandler getProfileHandler() {
        return profileHandler;
    }

    public void setProfileHandler(ProfileHandler profileHandler) {
        this.profileHandler = profileHandler;
    }

    @RequestMapping(value = "/viewprofile={profileID}", method = RequestMethod.GET)
    public ModelAndView Profile(@PathVariable("profileID") String profileID, ModelAndView mv) {
        List<Date> dates;
        List<Likes> likes;
        Profile profile;
        List<Profile> suggestList;
        profile = profileHandler.findProfileById(profileID);
        likes = profileHandler.getLikesOnProfile(profileID);
        dates = datesHandler.getDatesByID(profileID);
        
        suggestList = profileHandler.getsuggestlist(profileID);
        if (profile != null) {
            mv.addObject("suggestlist", suggestList);
            mv.addObject("currentProfile", profile);
            mv.addObject("likes", likes);
            mv.addObject("dates", dates);
            mv.setViewName("profile");
        } else {
            mv.setViewName("redirect:/mainpage");
        }
        return mv;
    }

    @RequestMapping(value = "likeprofile={profileID}={SSN}", method = RequestMethod.GET)
    public ModelAndView likeProfile(@PathVariable String profileID, @PathVariable String SSN
    ) {
        ModelAndView mv = new ModelAndView("profile");

        if (SSN != null && !SSN.equals("")) {
            Person p = new Person();
            p.setSSN(SSN);

            List<Profile> liker = profileHandler.getProfileBySSN(p);
            String pID = "";

            for (int i = 0; i < liker.size(); i++) {
                pID = liker.get(i).getProfileID();
                if (pID.equals(profileID)) {
                    mv.addObject("liked", "You cannot like yourself!");
                    mv.addObject("disable", true);
                    return Profile(profileID, mv);
                }
            }

            profileHandler.likeProfile(pID, profileID);
            mv.addObject("liked", "Thanks for liking " + profileID);
            mv.addObject("disable", true);

        } else {
            mv.addObject("liked", "You are not logged in!");
        }
        //mv.addObject("currentProfile", profileHandler.findProfileById(profileID));
        return Profile(profileID, mv);
    }

    @RequestMapping(value = "profileinfo={profileID}={SSN}", method = RequestMethod.GET)
    public ModelAndView editProfile(@PathVariable("profileID") String profileID, @PathVariable String SSN,
            HttpSession session) {

        Person p = new Person();
        p.setSSN(SSN);
        List<Profile> l = profileHandler.getProfileBySSN(p);
        ModelAndView mv = new ModelAndView("profileinfo");

        for (int i = 0; i < l.size(); i++) {
            if (profileID.equals(l.get(i).getProfileID())) {
                session.setAttribute("profileID", profileID);
                return mv;
            }
        }

        mv.addObject("liked", "You cannot edit this profile!");
        return Profile(profileID, mv);
    }

    @RequestMapping(value = "profileinfo", method = RequestMethod.POST)
    public ModelAndView goEditProfile(
            @RequestParam("age") String age,
            @RequestParam("datingagerangestart") String datingagerangestart, @RequestParam("datingagerangeend") String datingagerangeend,
            @RequestParam("datinggeorange") String datinggeorange, @RequestParam("gender") String gender, @RequestParam("hobbies") String hobbies,
            @RequestParam("height") String height, @RequestParam("weight") String weight, @RequestParam("haircolor") String haircolor,
            HttpSession session) {

        String profileID = (String) session.getAttribute("profileID");

        Profile profile = new Profile();
        profile.setProfileID(profileID);
        profile.setAge(age);
        profile.setDatingAgeRangeStart(datingagerangestart);
        profile.setDatingAgeRangeEnd(datingagerangeend);
        profile.setDatinGeoRange(datinggeorange);
        profile.setGender(gender);
        profile.setHobbies(hobbies);
        profile.setHeight(height);
        profile.setWeight(weight);
        profile.setHairColor(haircolor);

        profileHandler.editProfile(profile);
        session.removeAttribute("profileID");
        ModelAndView mv = new ModelAndView("profile");
        mv.addObject("currentProfile", profileHandler.findProfileById(profileID));
        return mv;
    }

    @RequestMapping(value = "newprofile={ssn}", method = RequestMethod.POST)
    public ModelAndView newprofile(@RequestParam("age") String age,
            @RequestParam("datingagerangestart") String datingagerangestart, @RequestParam("datingagerangeend") String datingagerangeend,
            @RequestParam("datinggeorange") String datinggeorange, @RequestParam("gender") String gender, @RequestParam("hobbies") String hobbies,
            @RequestParam("height") String height, @RequestParam("weight") String weight,
            @RequestParam("haircolor") String haircolor, @RequestParam("profileid") String profileid, ModelAndView mv,
            @PathVariable("ssn") String ssn) {
        Person person = new Person();
        person.setSSN(ssn);
        if (profileHandler.findProfileById(profileid) != null) {
            mv.setViewName("newprofile");
            return mv;
        }
        Profile profile = new Profile();
        profile.setOwnerSSN(ssn);
        profile.setProfileID(profileid);
        profile.setAge(age);
        profile.setDatingAgeRangeStart(datingagerangestart);
        profile.setDatingAgeRangeEnd(datingagerangeend);
        profile.setDatinGeoRange(datinggeorange);
        profile.setGender(gender);
        profile.setHobbies(hobbies);
        profile.setHeight(height);
        profile.setWeight(weight);
        profile.setHairColor(haircolor);
        profileHandler.addprofile(profile);
        mv.setViewName("profile");
        mv.addObject("currentProfile", profile);
        return mv;
    }

    @RequestMapping(value = "/commentdate={profile1}={profile2}={Date_Time}", method = RequestMethod.GET)
    public ModelAndView commentdate(@PathVariable("profile1") String profile1,
            @PathVariable("profile2") String profile2,
            @PathVariable("Date_Time") String datetime, ModelAndView mv) {
        mv.addObject("datetime", datetime);
        mv.addObject("profile1", profile1);
        mv.addObject("profile2", profile2);
        mv.setViewName("commentdate");
        return mv;
    }

    @RequestMapping(value = "/commentdate={profile1}={profile2}={Date_Time}", method = RequestMethod.POST)
    public ModelAndView docommentdate(@PathVariable("profile1") String profile1,
            @PathVariable("profile2") String profile2,
            @PathVariable("Date_Time") String datetime,
            @RequestParam(value = "comment") String comment, ModelAndView mv) {
        String result;
  
        result = datesHandler.commentdate(profile1, profile2, datetime, comment);
        mv.addObject("result", result);
        mv.setViewName("actionresult");
        return mv;
    }
}
