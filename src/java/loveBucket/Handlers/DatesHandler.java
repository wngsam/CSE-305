/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loveBucket.Handlers;

import java.util.List;
import loveBucket.Domain.BlindDate;
import loveBucket.Domain.Date;
import loveBucket.Domain.Person;
import loveBucket.Domain.Profile;
import loveBucket.Domain.pendingdate;
import loveBucket.Repos.DateRepo;
import loveBucket.Repos.ProfileRepo;

/**
 *
 * @author lun
 */
public class DatesHandler {

    private DateRepo dateRepo;

    public DateRepo getDateRepo() {
        return dateRepo;
    }

    public void setDateRepo(DateRepo dateRepo) {
        this.dateRepo = dateRepo;
    }

    public List<Date> getDatesByID(String ID) {

        return dateRepo.getDatesByID(ID);
    }

    public DatesHandler() {

    }

    public void insertPendingDates(String profile1, String profile2) {

        dateRepo.insertPendingDates(profile1, profile2);
    }

    public List<pendingdate> getpendingdate(Person person) {
        return dateRepo.getpendingdate(person);
    }

    public void deletependingdate(String id) {

        dateRepo.deletependingdate(id);
    }

    public pendingdate checkpendingdate(String ssn,String id) {
        return dateRepo.checkpendingdate(ssn,id);
    }
   public void referdate(String yourprofile,String profilea, String profileb){
       dateRepo.referdate(yourprofile,profilea,profileb);
   }
   public List<BlindDate> getblinddate(Person person){
      return dateRepo.getblinddate(person);
   }
   public int deleterefdate(String yourprofile,String profilea, String profileb){
       return dateRepo.deletereferdate(yourprofile,profilea,profileb);
   }
   public String commentdate(String profile1, String profile2,String datetime,String comment){
       
       return dateRepo.commentdate(profile1,profile2,datetime,comment);
   }
  
}
