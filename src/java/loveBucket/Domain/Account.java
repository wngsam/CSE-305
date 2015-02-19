package loveBucket.Domain;

public class Account {

    private String ownerSSN;
    private String cardNumber;
    private String acctNum;
    private String acctCreationDate;

    public String getOwnerSSN() {
        return ownerSSN;
    }

    public void setOwnerSSN(String ownerSSN) {
        this.ownerSSN = ownerSSN;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getAcctNum() {
        return acctNum;
    }

    public void setAcctNum(String acctNum) {
        this.acctNum = acctNum;
    }

    public String getAcctCreationDate() {
        return acctCreationDate;
    }

    public void setAcctCreationDate(String acctCreationDate) {
        this.acctCreationDate = acctCreationDate;
    }

    public Account() {
    }

   
}
