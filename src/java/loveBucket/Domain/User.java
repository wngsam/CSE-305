/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loveBucket.Domain;

/**
 *
 * @author lun
 */
public class User {
    private String SSN;
    private String PPP;
    private String Rating;
    private String DateOfLastAct;

    public String getSSN() {
        return SSN;
    }

    public void setSSN(String SSN) {
        this.SSN = SSN;
    }

    public String getPPP() {
        return PPP;
    }

    public void setPPP(String PPP) {
        this.PPP = PPP;
    }

    public String getRating() {
        return Rating;
    }

    public void setRating(String Rating) {
        this.Rating = Rating;
    }

    public String getDateOfLastAct() {
        return DateOfLastAct;
    }

    public void setDateOfLastAct(String DateOfLastAct) {
        this.DateOfLastAct = DateOfLastAct;
    }
    public User(){
        
    }
}
