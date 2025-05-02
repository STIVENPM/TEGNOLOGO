package PRIMERO;

public class Primero {
    private int identification;
    private String name;
    private String lastName;
    private String birthday;

    public Primero(int identification, String name, String lastName, String birthday) {
        this.identification = identification;
        this.name = name;
        this.lastName = lastName;
        this.birthday = birthday;
    }

    public int getIdentification() {
        return identification;
    }

    public void setIdentification(int identification) {
        this.identification = identification;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
}

