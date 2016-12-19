/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package muman.models;

/**
 *
 * @author ab9ma
 */
public class PendingMatch {
    private int id;
    private String player1;
    private String player2;
    private String date;

    public PendingMatch(int id, String player1, String player2) {
        this.id = id;
        this.player1 = player1;
        this.player2 = player2;
        date = null;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public PendingMatch(int id, String player1, String player2, String date) {
        this.id = id;
        this.player1 = player1;
        this.player2 = player2;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlayer1() {
        return player1;
    }

    public void setPlayer1(String player1) {
        this.player1 = player1;
    }

    public String getPlayer2() {
        return player2;
    }

    public void setPlayer2(String player2) {
        this.player2 = player2;
    }

   
}