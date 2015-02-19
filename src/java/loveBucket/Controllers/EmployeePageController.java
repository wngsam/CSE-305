package loveBucket.Controllers;

import javax.servlet.http.HttpSession;
import loveBucket.Domain.Person;
import loveBucket.Handlers.EmployeeHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public class EmployeePageController {
    
    private EmployeeHandler employeeHandler;
    
    public EmployeePageController(){}

    public EmployeeHandler getEmployeeHandler() {
        return employeeHandler;
    }
    public void setEmployeeHandler(EmployeeHandler employeeHandler) {
        this.employeeHandler = employeeHandler;
    }
    
    @RequestMapping(value = "/employee")
    public ModelAndView Employee( HttpSession session)
    {
        Person currentPerson = (Person) session.getAttribute("currentPerson" );
        ModelAndView mv = new ModelAndView();
        //person doesn't have permissions to use employee page
        if( currentPerson.getRole().equals("employee") ){
            mv.setViewName("employee"); 
        }
        else
        {
            mv.setViewName("redirect:mainpage");        
        }
        return mv;
    }
    
    @RequestMapping(value = "custrep", method = RequestMethod.GET)
    public ModelAndView custRep( HttpSession session, ModelAndView mv){
        
        Person currentPerson = (Person) session.getAttribute("currentPerson" );
        //ModelAndView mv = new ModelAndView();
        //person doesn't have permissions to use employee page
        if( currentPerson.getRole().equals("CustRep") ){
            mv.setViewName("custrep.html"); 
        }
        else
        {
            mv.setViewName("redirect:mainpage");        
        }
        return mv;
    }
    
    @RequestMapping(value = "custrepSugg",method=RequestMethod.GET)
    public @ResponseBody ModelAndView deleteEmployee(
            @RequestParam(value = "PID") String PID, HttpSession session)
    {   System.out.println(PID+" ID");
        //Person currentPerson = (Person) session.getAttribute("currentPerson" );
        ModelAndView mv = new ModelAndView();
        //boolean auth = hasManagerPermissions(currentPerson);
        //if( auth ){
            mv.addObject("dateSuggest", employeeHandler.dateSuggest(PID));
            //custRep(session, mv);
            mv.setViewName("redirect:custrep.html");  
        //}
        //else
        //{
            //mv.setViewName("redirect:mainpage");        
        //}
        return mv;
    }
}
