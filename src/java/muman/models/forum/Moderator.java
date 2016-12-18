package muman.models.forum;

/**
 * Created by numan947 on 12/18/16.
 **/
public class Moderator {

    private String userName;
    private String fullName;
    private String sectionName;

    public Moderator( String userName, String fullName, String sectionName) {
        this.userName = userName;
        this.fullName = fullName;
        this.sectionName = sectionName;
    }

    public String getSectionName() {
        return sectionName;
    }

    public void setSectionName(String sectionName) {
        this.sectionName = sectionName;
    }



    public String getUserName() {
        return userName;
    }

    public String getFullName() {
        return fullName;
    }
}
