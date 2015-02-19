package loveBucket.Controllers;

import java.util.List;
import loveBucket.Domain.Date;
import loveBucket.Domain.Profile;
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
    
    @RequestMapping(value = "mainPage", method= RequestMethod.GET)
    public ModelAndView MainPage(ModelAndView mv) {
        mv.setViewName("mainPage");
        
        List<Date> dates = profileHandler.getLocationRanked();
        for(int i=0;i<dates.size();i++){
            mv.addObject("loc"+i, dates.get(i).getLocation());
            if(i==3){
                i=dates.size();
            }
        }
        List<Profile> pop = profileHandler.getMostPopularProfiles();
        for(int i=0;i<pop.size();i++){
            mv.addObject("prof"+i,pop.get(i).getProfileID());
            if(i==2){
                i=pop.size();
            }
        }
        List<Profile> high = profileHandler.getHighestRated();
        for(int i=0;i<high.size();i++){
            mv.addObject("prof"+(i+3),high.get(i).getProfileID());
            if(i==5){
                i=high.size();
            }
        }
        List<Profile> act = profileHandler.getMostActive();
        for(int i=0;i<act.size();i++){
            mv.addObject("prof"+(i+9),act.get(i).getProfileID());
            if(i==5){
            i=act.size();
            }
        }
        return mv;
    }
    
    @RequestMapping(value="/")
    public ModelAndView redirectToMain(){
        ModelAndView mv = new ModelAndView("mainPage");
        MainPage(mv);
        return mv;
    }  
}