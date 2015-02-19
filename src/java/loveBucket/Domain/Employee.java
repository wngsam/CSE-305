package loveBucket.Domain;

public class Employee {
    private String SSN;
    private String role;
    private String startDate;
    private String hourlyRate;
    
    Employee(){}
    public String getSSN() {
        return SSN;
    }
    public void setSSN(String SSN) {
        this.SSN = SSN;
    }
    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }
    public String getStartDate() {
        return startDate;
    }
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }
    public String getHourlyRate() {
        return hourlyRate;
    }
    public void setHourlyRate(String hourlyRate) {
        this.hourlyRate = hourlyRate;
    }
    @Override
    public String toString(){return SSN;}
}
