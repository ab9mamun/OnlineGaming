package muman.models;

import java.sql.Date;

/**
 * Created by numan947 on 12/18/16.
 **/
public class MatchDetails {
    private int score1;
    private int score2;
    private String player1;
    private String player2;
    private Date date;


    public MatchDetails(int score1, int score2, String player1, String player2, Date date) {
        this.score1 = score1;
        this.score2 = score2;
        this.player1 = player1;
        this.player2 = player2;
        this.date = date;
    }

    public int getScore1() {
        return score1;
    }

    public int getScore2() {
        return score2;
    }

    public String getPlayer1() {
        return player1;
    }

    public String getPlayer2() {
        return player2;
    }

    public Date getDate() {
        return date;
    }
}
