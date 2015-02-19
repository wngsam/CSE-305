/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loveBucket.Controllers;

import java.util.List;
import javax.servlet.http.HttpSession;
import loveBucket.Domain.Person;
import loveBucket.Domain.Profile;
import loveBucket.Handlers.DatesHandler;
import loveBucket.Handlers.PersonHandler;
import loveBucket.Handlers.ProfileHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
@RequestMapping(value="/viewperson={email:.+}", method=RequestMethod.GET)
public ModelAndView Person(@PathVariable("email") String email, ModelAndView mv,
        HttpSession session)
{
    Person person;
    List<Profile> profiles;
    person = personHandler.getPersonByEmail(email);
    profiles = profileHandler.getProfileBySSN(person);
    Person authPerson = (Person) session.getAttribute("currentPerson" );
    if(person==null || authPerson == null){
        mv.setViewName("redirect:/mainpage");
    }
    if (authPerson.getEmail().equals(person.getEmail()))
    {
        mv.addObject("profiles",profiles);
        mv.addObject("person",person);
        mv.setViewName("person");
    }
    else{
        mv.setViewName("redirect:/mainpage");
    }
    return mv;
}
   
}
