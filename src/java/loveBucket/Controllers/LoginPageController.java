package loveBucket.Controllers;

import javax.servlet.http.HttpSession;
import loveBucket.Domain.Person;
import loveBucket.Handlers.EmployeeHandler;
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
    private EmployeeHandler employeeHandler;
    
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
            String authPersonSSN = authenticatedPerson.getSSN();
            String role = employeeHandler.getRole(authPersonSSN);
            //person is a customer if they do not have a employee role
            if (role == null)
            {
                role = "customer";
                authenticatedPerson.setRole(role); 
            }
            else
            {
                authenticatedPerson.setRole(role);
            }
            session.setAttribute("currentPerson" , authenticatedPerson);
            ModelAndView mv = new ModelAndView();
            //Send managers,employees and customers to their respective start pages
            if (role.equals("customer")) {

                String personEmail = authenticatedPerson.getEmail();
                mv.setViewName("redirect:viewperson="+personEmail);
            }
            else if (role.equals("Manager") ){
                mv.setViewName("redirect:manager");
            }
            else if (role.equals("CustRep"))
            {
                mv.setViewName("redirect:custrep.html");
            }
            return mv;
        }
        else
        {
            ModelAndView mv = new ModelAndView("login");
            mv.addObject("error", "The credentials you supplied were invalid");
            return mv;
        }
    } 
    @RequestMapping(value="/logout",method = RequestMethod.GET)
    public ModelAndView logout(HttpSession session)
    {
        session.removeAttribute("currentPerson");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:../mainPage");
        return mv;
    }
    

    public PersonHandler getPersonHandler() {return personHandler;}
    public void setPersonHandler(PersonHandler personHandler) { this.personHandler = personHandler;}
    public EmployeeHandler getEmployeeHandler() { return employeeHandler; }
    public void setEmployeeHandler (EmployeeHandler employeeHandler){this.employeeHandler = employeeHandler; }
}
