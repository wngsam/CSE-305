/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loveBucket.Controllers;

import java.util.List;
import javax.servlet.http.HttpSession;
import loveBucket.Domain.Account;
import loveBucket.Domain.BlindDate;
import loveBucket.Domain.Person;
import loveBucket.Domain.Profile;
import loveBucket.Domain.User;
import loveBucket.Domain.pendingdate;
import loveBucket.Handlers.DatesHandler;
import loveBucket.Handlers.PersonHandler;
import loveBucket.Handlers.ProfileHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author lun
 */
@Controller
public class PersonPageController {

    private PersonHandler personHandler;

    public PersonHandler getPersonHandler() {
        return personHandler;
    }

    public void setPersonHandler(PersonHandler personHandler) {
        this.personHandler = personHandler;
    }

    public DatesHandler getDatesHandler() {
        return datesHandler;
    }

    public void setDatesHandler(DatesHandler datesHandler) {
        this.datesHandler = datesHandler;
    }
    private DatesHandler datesHandler;
    private ProfileHandler profileHandler;

    public ProfileHandler getProfileHandler() {
        return profileHandler;
    }

    public void setProfileHandler(ProfileHandler profileHandler) {
        this.profileHandler = profileHandler;
    }

    @RequestMapping(value = "/viewperson={email:.+}", method = RequestMethod.GET)
    public ModelAndView Person(@PathVariable("email") String email, ModelAndView mv,
            HttpSession session) {
        List<pendingdate> pendingdate;
        Person person;
        List<Profile> profiles;
        List<BlindDate> blinddate;
        List<Account> account;
        List<User> user;

        person = personHandler.getPersonByEmail(email);
        account = personHandler.getaccountbyssn(person);
        user = personHandler.getuserbyssn(person);
        profiles = profileHandler.getProfileBySSN(person);
        pendingdate = datesHandler.getpendingdate(person);
        blinddate = datesHandler.getblinddate(person);
        Person authPerson = (Person) session.getAttribute("currentPerson");
        if (person == null || authPerson == null) {
            mv.setViewName("redirect:/mainpage");
        }
        if (authPerson.getEmail().equals(person.getEmail())) {
            mv.addObject("user", user);
            mv.addObject("account", account);
            mv.addObject("blinddate", blinddate);
            mv.addObject("pendingdate", pendingdate);
            mv.addObject("profiles", profiles);
            mv.addObject("person", person);
            mv.setViewName("person");
        } else {
            mv.setViewName("redirect:/mainpage");
        }
        return mv;
    }

    @RequestMapping(value = "/requestdate={ssn}", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView requestdate(String profiles, @RequestParam(value = "yourprofile") String yourprofile,
            @RequestParam(value = "dateprofile") String dateprofile,
            @PathVariable("ssn") String ssn,
            ModelAndView mv) {
        String result = "";
        if (profileHandler.nodateself(ssn, dateprofile) != null || profileHandler.findProfileById(yourprofile) == null || profileHandler.findProfileById(dateprofile) == null) {
            result = "Error Profile Input";
        } else {
            datesHandler.insertPendingDates(yourprofile, dateprofile);
            result = "Successfull Inserted into Pending Dates";
        }
        mv.addObject("result", result);
        mv.setViewName("actionresult");
        return mv;
    }

    @RequestMapping(value = "/deletedate={ssn}", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView deletedate(@RequestParam(value = "id") String id,
            @PathVariable("ssn") String ssn,
            ModelAndView mv) {

        String result = "";
        pendingdate pendingdate;
        pendingdate = datesHandler.checkpendingdate(ssn, id);
        if (pendingdate == null) {
            result = "Error input";
        } else {
            datesHandler.deletependingdate(id);
            result = "Deleted date";
        }
        mv.addObject("result", result);
        mv.setViewName("actionresult");
        return mv;
    }

    @RequestMapping(value = "/newprofile={ssn}", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView newprofile(@PathVariable("ssn") String ssn,
            ModelAndView mv) {
        mv.addObject("ssn", ssn);
        mv.setViewName("newprofile");
        return mv;
    }

    @RequestMapping(value = "deleteprofile={ssn}", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView deleteprofile(@RequestParam(value = "profileid") String profileid,
            @PathVariable("ssn") String ssn,
            ModelAndView mv) {
        Profile profile;
        String result = "";
        profile = profileHandler.nodateself(ssn, profileid);

        if (profile != null && profileHandler.findProfileById(profileid) != null) {
            profileHandler.deleteprofile(profileid);
            result = "Sucessfully deleted profile";
        } else {
            result = "Error invalid input";
        }
        mv.addObject("result", result);
        mv.setViewName("actionresult");
        return mv;
    }

    @RequestMapping(value = "geodate={ssn}", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView geodate(@RequestParam(value = "profileid") String profileid,
            @PathVariable("ssn") String ssn,
            ModelAndView mv) {
        Profile profile;
        String result = "";
        profile = profileHandler.nodateself(ssn, profileid);

        if (profile != null && profileHandler.findProfileById(profileid) != null) {
            profileHandler.geodate(ssn, profileid);
            result = "Sucessfully added Geo Date";
        } else {
            result = "Error invalid input";
        }
        mv.addObject("result", result);
        mv.setViewName("actionresult");
        return mv;
    }

    @RequestMapping(value = "referdate={ssn}", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView referdate(@RequestParam(value = "yourprofile") String yourprofile,
            @RequestParam(value = "profilea") String profilea,
            @RequestParam(value = "profileb") String profileb,
            @PathVariable("ssn") String ssn,
            ModelAndView mv) {

        String result = "Successfully refered profile";
        datesHandler.referdate(yourprofile, profilea, profileb);

        mv.addObject("result", result);
        mv.setViewName("actionresult");
        return mv;
    }

    @RequestMapping(value = "deleterefdate={ssn}", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView deleterefdate(@RequestParam(value = "yourprofile") String yourprofile,
            @RequestParam(value = "profilea") String profilea,
            @RequestParam(value = "profileb") String profileb,
            @PathVariable("ssn") String ssn,
            ModelAndView mv) {

        String result = "";
        int i = datesHandler.deleterefdate(yourprofile, profilea, profileb);
        if (i == 0) {
            result = "error input";
        } else {
            result = "Sucessfully Deleted date";
        }
        mv.addObject("result", result);
        mv.setViewName("actionresult");
        return mv;
    }

    @RequestMapping(value = "createaccount={ssn}", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView createaccount(@RequestParam(value = "cardnumber") String cardnumber,
            @RequestParam(value = "accountnumber") String accountnumber,
            @PathVariable("ssn") String ssn,
            ModelAndView mv) {

        String result = "";
        result = personHandler.createaccount(ssn, cardnumber, accountnumber);

        mv.addObject("result", result);
        mv.setViewName("actionresult");
        return mv;
    }

    @RequestMapping(value = "deleteaccount={ssn}", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView createaccount(@RequestParam(value = "cardnumber") String cardnumber,
            @PathVariable("ssn") String ssn,
            ModelAndView mv) {

        String result = "";
        result = personHandler.deleteaccount(ssn, cardnumber);

        mv.addObject("result", result);
        mv.setViewName("actionresult");
        return mv;
    }

    @RequestMapping(value = "upgradeaccount={ssn}", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView upgradeaccount(@PathVariable("ssn") String ssn,
            ModelAndView mv) {

        String result = "";
        result = personHandler.upgradeaccount(ssn);

        mv.addObject("result", result);
        mv.setViewName("actionresult");
        return mv;
    }
}
