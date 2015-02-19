package loveBucket.Domain;

public class Likes {
    private String liker;
    private String likee;
    private String date_Time;
    
    Likes(){}
    public String getLiker() {
        return liker;
    }
    public void setLiker(String liker) {
        this.liker = liker;
    }
    public String getLikee() {
        return likee;
    }
    public void setLikee(String likee) {
        this.likee = likee;
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
