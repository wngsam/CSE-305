package loveBucket.Handlers;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import loveBucket.Domain.Account;
import loveBucket.Domain.Person;
import loveBucket.Domain.User;
import loveBucket.Repos.PersonRepo;

public class PersonHandler {
    private PersonRepo personRepo;
    
    public PersonHandler(){}

    public List<Person> getAllPersons() {
        return personRepo.getAllPersons();
    }

    
    public int addPerson(Person person) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        return personRepo.addPerson(person);
    } 
 
    public List<Person> searchPerson(Person person){
        return personRepo.searchPerson(person);
    }
    public Person getPersonByEmail(String email){
        return personRepo.getPersonByEmail(email);    
    }
    public Person getPersonBySSN(String SSN){
        return personRepo.getPersonBySSN(SSN);    
    }
    public Person login(String email,String password)
    {
        return personRepo.login(email,password);
    }    
    public String deletePersonByEmail(String email) 
    {
        String message = personRepo.deletePersonByEmail(email);
        return message;
    }
    public String deletePersonBySSN( String SSN )
    {
        String message = personRepo.deletePersonBySSN(SSN);
        return message;
    }
    public PersonRepo getPersonRepo() { return personRepo; }
    public void setPersonRepo(PersonRepo personRepo) { this.personRepo = personRepo; }   
    public String createaccount(String ssn,String cardnumber,String accountnumber){
        return personRepo.createaccount(ssn,cardnumber,accountnumber);
    }
    public List<Account> getaccountbyssn(Person person){
        return personRepo.getaccountbyssn(person);
    }
    public String deleteaccount(String ssn,String cardnumber){
        return personRepo.deleteaccount(ssn,cardnumber);
    }
    public List<User> getuserbyssn(Person person){
        return personRepo.getuserbyssn(person);
    }
    public String upgradeaccount(String ssn){
        return personRepo.upgradeaccount(ssn);
    }
}