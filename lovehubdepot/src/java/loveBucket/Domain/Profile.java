package loveBucket.Domain;

public class Profile {
    private String profileID;
    private String ownerSSN;
    private String age;
    private String datingAgeRangeStart;
    private String datingAgeRangeEnd;
    private String datinGeoRange;
    private String gender;
    private String hobbies;
    private String height;
    private String weight;
    private String hairColor;
    private String creationDate;
    private String lastModDate;

    public Profile(){};
    
    public String getProfileID() { return profileID; }
    public void setProfileID(String profileID) {this.profileID = profileID;}
    public String getOwnerSSN() { return ownerSSN; }
    public void setOwnerSSN(String ownerSSN) {this.ownerSSN = ownerSSN;}  
    public String getAge() { return age; }
    public void setAge(String age) { this.age = age; }
    public String getDatingAgeRangeStart() { return datingAgeRangeStart; }
    public void setDatingAgeRangeStart(String datingAgeRangeStart) { this.datingAgeRangeStart = datingAgeRangeStart; }
    public String getDatingAgeRangeEnd() { return datingAgeRangeEnd; }
    public void setDatingAgeRangeEnd(String datingAgeRangeEnd) { this.datingAgeRangeEnd = datingAgeRangeEnd;}
    public String getDatinGeoRange() { return datinGeoRange; }
    public void setDatinGeoRange(String datinGeoRange) { this.datinGeoRange = datinGeoRange; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getHobbies() { return hobbies; }
    public void setHobbies(String hobbies) { this.hobbies = hobbies; }
    public String getHeight() { return height; }
    public void setHeight(String height) { this.height = height; }
    public String getWeight() {return weight; }
    public void setWeight(String weight) { this.weight = weight;}
    public String getHairColor() { return hairColor; }
    public void setHairColor(String hairColor) { this.hairColor = hairColor;}
    public String getCreationDate() { return creationDate; }
    public void setCreationDate(String creationDate) {this.creationDate = creationDate;}
    public String getLastModDate() {return lastModDate; }
    public void setLastModDate(String lastModDate) { this.lastModDate = lastModDate;}    
    
    @Override
    public String toString() { return profileID;}
}
