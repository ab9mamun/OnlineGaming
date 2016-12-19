package muman.models;

/**
 * Created by numan947 on 12/19/16.
 **/
public class Tournament {
    private int id;
    private String name;
    private  String startDate;
    private String endDate;
    private String winner;

    public Tournament(int id,String name, String startDate, String endDate, String winner) {
        this.id=id;
        this.name = name;
        this.startDate = startDate;
        this.endDate = endDate;
        setWinner(winner);
       
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public void setWinner(String winner) {
        if(winner==null) this.winner="NOBODY";
        else
        this.winner = winner;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public String getWinner() {
        return winner;
    }
}
