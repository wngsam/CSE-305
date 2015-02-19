package loveBucket.Handlers;

import java.util.List;
import loveBucket.Domain.Profile;
import loveBucket.Repos.EmployeeRepo;

public class EmployeeHandler {
    private EmployeeRepo employeeRepo;
    
    public String getRole(String SSN) 
    { return employeeRepo.getRole(SSN);}

    public void addEmployee(String SSN,String role,String startDate, String hourlyRate)
    {
        employeeRepo.add(SSN,role,startDate,hourlyRate);
    }
    public void editEmployee(String SSN,String role,String startDate, String hourlyRate)
    {
        employeeRepo.edit(SSN, role, startDate, hourlyRate);
    }
    public String deleteEmployeeBySSN(String SSN)
    {
        return employeeRepo.delete(SSN);
    }
    
    
    public List<Profile> dateSuggest(String profileID){
        return employeeRepo.dateSuggest(profileID);
    }
    
    public EmployeeRepo getEmployeeRepo() { return employeeRepo; }
    public void  setEmployeeRepo( EmployeeRepo newEmployeeRepo ){ employeeRepo = newEmployeeRepo; }
}
