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
