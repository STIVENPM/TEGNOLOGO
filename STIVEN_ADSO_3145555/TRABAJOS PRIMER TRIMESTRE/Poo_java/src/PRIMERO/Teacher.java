package PRIMERO;


public class Teacher extends Primero {
    private String programName;
    private long telephoneContact;

    public Teacher(int identification, String name, String lastName, String birthday, String programName, long telephoneContact) {
        super(identification, name, lastName, birthday);
        this.programName = programName;
        this.telephoneContact = telephoneContact;
    }

    public String getProgramName() {
        return programName;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }

    public long getTelephoneContact() {
        return telephoneContact;
    }

    public void setTelephoneContact(long telephoneContact) {
        this.telephoneContact = telephoneContact;
    }
}
