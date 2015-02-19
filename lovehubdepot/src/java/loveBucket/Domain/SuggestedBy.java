package loveBucket.Domain;

public class SuggestedBy {
    private String custRep;
    private String profile1;
    private String profile2;
    private String date_Time;
    
    SuggestedBy(){}
    public String getCustRep() {
        return custRep;
    }
    public void setCustRep(String custRep) {
        this.custRep = custRep;
    }
    public String getProfile1() {
        return profile1;
    }
    public void setProfile1(String profile1) {
        this.profile1 = profile1;
    }
    public String getProfile2() {
        return profile2;
    }
    public void setProfile2(String profile2) {
        this.profile2 = profile2;
    }
    public String getDate_Time() {
        return date_Time;
    }
    public void setDate_Time(String date_Time) {
        this.date_Time = date_Time;
    }
    @Override
    public String toString(){return "";}
}
