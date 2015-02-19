package loveBucket.Handlers;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import loveBucket.Domain.Person;
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
    public Person login(String email,String password)
    {
        return personRepo.login(email,password);
    }    
    
    public PersonRepo getPersonRepo() { return personRepo; }
    public void setPersonRepo(PersonRepo personRepo) { this.personRepo = personRepo; }   
}