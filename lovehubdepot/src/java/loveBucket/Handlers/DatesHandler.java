/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loveBucket.Handlers;

import java.util.List;
import loveBucket.Domain.Date;
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
    public List<Date> getDatesByID(String ID){
        
        return dateRepo.getDatesByID(ID);
    }
    public DatesHandler() {

    }

}
