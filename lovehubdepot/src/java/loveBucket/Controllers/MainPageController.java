package loveBucket.Controllers;

import java.util.List;
import loveBucket.Handlers.ProfileHandler;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainPageController {
    private SessionFactory sessionFactory;
    private ProfileHandler profileHandler;

    public SessionFactory getSessionFactory() { return sessionFactory; }
    public void setSessionFactory(SessionFactory sessionFactory) { this.sessionFactory = sessionFactory; }
    public ProfileHandler getProfileHandler() { return profileHandler; }
    public void setProfileHandler(ProfileHandler profileHandler) { this.profileHandler = profileHandler; }
    
    @RequestMapping(value = "/mainpage", method= RequestMethod.GET)
    public ModelAndView MainPage(ModelAndView mv) {
        mv.setViewName("mainPage");
        return mv;
    }
    
    @RequestMapping(value="/")
    public ModelAndView redirectToMain(){
        ModelAndView mv = new ModelAndView("mainPage");
        return mv;
    }  
}