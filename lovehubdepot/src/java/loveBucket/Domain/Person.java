package loveBucket.Domain;

import java.io.Serializable;

public class Person implements Serializable {
    private String SSN;
    private String password;
    private String firstName;
    private String lastName;
    private String street;
    private String city;
    private String state;
    private String zipcode;
    private String email;
    private String telephone;
    
    public Person(){}
    
    public String getSSN() { return SSN; }
    public void setSSN(String SSN) { this.SSN = SSN; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) {this.lastName = lastName;}
    public String getStreet() { return street;}
    public void setStreet(String street) { this.street = street;}
    public String getCity() { return city;}
    public void setCity(String city) { this.city = city;}
    public String getState() { return state;}
    public void setState(String state) {this.state = state;}
    public String getZipcode() { return zipcode;}
    public void setZipcode(String zipcode) {this.zipcode = zipcode;}
    public String getEmail() {return email;}
    public void setEmail(String email) { this.email = email;}
    public String getTelephone() { return telephone; }
    public void setTelephone(String telephone) { this.telephone = telephone;} 
}