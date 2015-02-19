package loveBucket.Controllers;

import javax.servlet.http.HttpSession;
import loveBucket.Domain.Person;
import loveBucket.Handlers.PersonHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/login")
public class LoginPageController {
    private PersonHandler personHandler;
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView getLoginPage()
    {
        ModelAndView mv = new ModelAndView("login");
        return mv;
    }     
    
    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView login(@RequestParam(value = "email") String email,
                    @RequestParam(value = "password") String password,
                    HttpSession session
                    )
    {
        Person authenticatedPerson = personHandler.login(email,password);
        if (authenticatedPerson != null)
        {
            session.setAttribute("currentPerson" , authenticatedPerson);
            ModelAndView mv = new ModelAndView();
            String personEmail = authenticatedPerson.getEmail();
            mv.setViewName("redirect:viewperson="+personEmail);
            return mv;
        }
        else
        {
            ModelAndView mv = new ModelAndView("login");
            mv.addObject("error", "The credentials you supplied were invalid");
            return mv;
        }
    } 

    public PersonHandler getPersonHandler() {return personHandler;}
    public void setPersonHandler(PersonHandler personHandler) { this.personHandler = personHandler;}
}
