package loveBucket.Domain;

public class Customer {
    private String SSN;
    private String PPP;
    private String rating;
    private String dateOfLastAct;
    
Customer(){}

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
        return rating;
    }
    public void setRating(String rating) {
        this.rating = rating;
    }
    public String getDateOfLastAct() {
        return dateOfLastAct;
    }
    public void setDateOfLastAct(String dateOfLastAct) {
        this.dateOfLastAct = dateOfLastAct;
    }
    @Override
    public String toString(){return SSN;}
}
