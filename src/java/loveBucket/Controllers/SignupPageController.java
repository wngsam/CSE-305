package loveBucket.Controllers;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import loveBucket.Domain.Person;
import loveBucket.Handlers.PersonHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

	

    @Controller
    public class SignupPageController {
       
        private PersonHandler personHandler;
       
        public SignupPageController(){}
       
        public PersonHandler getPersonHandler(){ return personHandler; }
        public void setPersonHandler(PersonHandler personHandler) { this.personHandler = personHandler; }
       
        @RequestMapping(value = "/signup", method= RequestMethod.GET)
        public ModelAndView Signup() {
            ModelAndView mv = new ModelAndView("signup");
            return mv;
        }
       
        @RequestMapping(value = "/signup", method = RequestMethod.POST)
        public ModelAndView doSignup(@RequestParam("fname") String fname, @RequestParam("lname") String lname,
                @RequestParam("email") String email, @RequestParam("password") String pass,
                @RequestParam("ssn") String ssn, @RequestParam("state") String state,
                @RequestParam("city") String city, @RequestParam("zip") String zip,
                @RequestParam("telephone") String telephone, @RequestParam("street") String street
        ) throws NoSuchAlgorithmException, UnsupportedEncodingException{
            Person person = new Person();
            person.setFirstName(fname);
            person.setLastName(lname);
            person.setEmail(email);
            person.setPassword(pass);
            person.setSSN(ssn);
            person.setState(state);
            person.setCity(city);
            person.setStreet(street);
            person.setZipcode(zip);
            person.setTelephone(telephone);
            personHandler.addPerson(person);
            ModelAndView mv = new ModelAndView("login");
            mv = new ModelAndView("signup");
            mv.addObject("good","You may now login with your credentials.");
            mv.addObject("newPerson",true);
            return mv;
        }
    }


