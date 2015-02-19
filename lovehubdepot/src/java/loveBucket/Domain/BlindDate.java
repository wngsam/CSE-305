package loveBucket.Domain;

public class BlindDate {
private String profileA;
private String profileB;
private String profileC;
private String dateTime;
    
BlindDate(){}
    public String getProfileA() {
        return profileA;
    }
    public void setProfileA(String profileA) {
        this.profileA = profileA;
    }
    public String getProfileB() {
        return profileB;
    }
    public void setProfileB(String profileB) {
        this.profileB = profileB;
    }
    public String getProfileC() {
        return profileC;
    }
    public void setProfileC(String profileC) {
        this.profileC = profileC;
    }
    public String getDateTime() {
        return dateTime;
    }
    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }
@Override
public String toString(){return "";}

}
