/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loveBucket.Controllers;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import loveBucket.Domain.Person;
import loveBucket.Domain.Profile;
import loveBucket.Handlers.PersonHandler;
import loveBucket.Handlers.ProfileHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author lun
 */
@Controller
public class SearchPageController {

    ProfileHandler profileHandler;
    PersonHandler personHandler;

    public PersonHandler getPersonHandler() {
        return personHandler;
    }

    public void setPersonHandler(PersonHandler personHandler) {
        this.personHandler = personHandler;
    }
    public ProfileHandler getProfileHandler() {
        return profileHandler;
    }

    public void setProfileHandler(ProfileHandler profileHandler) {
        this.profileHandler = profileHandler;
    }

    public SearchPageController() {
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public ModelAndView onSearch() {
        ModelAndView mv = new ModelAndView("search");
        return mv;
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public ModelAndView Search(@RequestParam("profilename") String profilename, @RequestParam("age") String age,
            @RequestParam("gender") String gender, @RequestParam("city") String city,
            @RequestParam("state") String state, @RequestParam("zipcode") String zipcode,
            @RequestParam("height") String height, @RequestParam("weight") String weight,
            @RequestParam("hobbies") String hobbies, @RequestParam("haircolor") String haircolor, ModelAndView mv)
            throws NoSuchAlgorithmException, UnsupportedEncodingException {
        mv.setViewName("searchresults");
        List<Profile> results;
        List<Profile> persons;
        Profile profile = new Profile();
        profile.setProfileID(profilename);
        profile.setAge(age);
        profile.setGender(gender);
        profile.setHeight(height);
        profile.setWeight(weight);
        profile.setHobbies(hobbies);
        profile.setHairColor(haircolor);
        Person person = new Person();
        person.setCity(city);
        person.setState(state);
        person.setZipcode(zipcode);
        results = profileHandler.searchProfile(profile);
        persons = profileHandler.searchPerson(person);
        results.addAll(persons);
        if (results != null) {
            mv.addObject("results", results);
            
        }
       
        return mv;
    }
}
