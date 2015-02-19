package loveBucket.Controllers;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import loveBucket.Domain.Person;
import loveBucket.Domain.Profile;
import loveBucket.Handlers.EmployeeHandler;
import loveBucket.Handlers.PersonHandler;
import loveBucket.Handlers.ProfileHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerPageController {
    private PersonHandler personHandler;
    private EmployeeHandler employeeHandler;
    private ProfileHandler profileHandler;
    
    public ManagerPageController(){}
    @RequestMapping(value = "/manager")
    public ModelAndView Manager( HttpSession session)
    {
        Person currentPerson = (Person) session.getAttribute("currentPerson" );
        ModelAndView mv = new ModelAndView();
        boolean auth = hasManagerPermissions(currentPerson);
        //person doesn't have permissions to use manager page
        if( auth ){
            mv.setViewName("manager"); 
            List<Person> allPersons = personHandler.getAllPersons();
            
            List<Profile> highProfile = profileHandler.getHighestRated();
            List<Person> highPerson = new ArrayList<Person>();
            List<Profile> activeProfile = profileHandler.getMostActive();
            List<Person> activePerson = new ArrayList<Person>();
            
            for(int i=0;i<activeProfile.size();i++){
                String ssn = activeProfile.get(i).getOwnerSSN();
                activePerson.add(personHandler.getPersonBySSN(ssn));
            }
            for(int i=0;i<highProfile.size();i++){
                String ssn = highProfile.get(i).getOwnerSSN();
                highPerson.add(personHandler.getPersonBySSN(ssn));
            }
            
            mv.addObject("allPersons", allPersons);
            mv.addObject("highPerson", highPerson);
            mv.addObject("activePerson", activePerson);
        }
        else
        {
            mv.setViewName("redirect:mainpage");        
        }
        return mv;
    }    

    @RequestMapping(value = "/managerAddEmployee",method=RequestMethod.GET)
    public ModelAndView addEmployee( @RequestParam(value = "SSN") String SSN,
            @RequestParam(value = "role") String role, @RequestParam(value = "startDate") String startDate,
            @RequestParam(value = "hourlyRate") String hourlyRate,
            HttpSession session)
    {
        Person currentPerson = (Person) session.getAttribute("currentPerson" );
        ModelAndView mv = new ModelAndView();
        boolean auth = hasManagerPermissions(currentPerson);
        if( auth ){
            employeeHandler.addEmployee(SSN, role, startDate, hourlyRate);
            mv.setViewName("redirect:manager");
        }
        else
        {
            mv.setViewName("redirect:mainpage");        
        }
        return mv;
    }  

    @RequestMapping(value = "/managerEditEmployee",method=RequestMethod.GET)
    public @ResponseBody ModelAndView editEmployee( @RequestParam(value = "SSN") String SSN,
            @RequestParam(value = "role") String role, @RequestParam(value = "startDate") String startDate,
            @RequestParam(value = "hourlyRate") String hourlyRate,
            HttpSession session)
    {
        Person currentPerson = (Person) session.getAttribute("currentPerson" );
        ModelAndView mv = new ModelAndView();
        boolean auth = hasManagerPermissions(currentPerson);
        if( auth ){
            employeeHandler.editEmployee(SSN, role, startDate, hourlyRate);
            mv.setViewName("redirect:manager");  
        }
        else
        {
            mv.setViewName("redirect:mainpage");        
        }
        return mv;
    }      
    
    @RequestMapping(value = "/managerDeleteEmployee",method=RequestMethod.GET)
    public @ResponseBody ModelAndView deleteEmployee(
            @RequestParam(value = "SSN") String SSN,HttpSession session)
    {
        Person currentPerson = (Person) session.getAttribute("currentPerson" );
        ModelAndView mv = new ModelAndView();
        boolean auth = hasManagerPermissions(currentPerson);
        if( auth ){
            employeeHandler.deleteEmployeeBySSN(SSN);
            mv.setViewName("redirect:manager");  
        }
        else
        {
            mv.setViewName("redirect:mainpage");        
        }
        return mv;
    }  
    
    public boolean hasManagerPermissions(Person currentPerson)
    {
        if (currentPerson == null)
            return false;
        if (currentPerson.getRole().equals("Manager") )
            return true;
        else
            return false;
    }
    
    public PersonHandler getPersonHandler() { return personHandler; }
    public void setPersonHandler(PersonHandler personHandler) { this.personHandler = personHandler;}
    public EmployeeHandler getEmployeeHandler() { return employeeHandler;}
    public void setEmployeeHandler(EmployeeHandler employeeHandler) { this.employeeHandler = employeeHandler; }
    public ProfileHandler getProfileHandler() {
        return profileHandler;
    }
    public void setProfileHandler(ProfileHandler profileHandler) {
        this.profileHandler = profileHandler;
    }
}
