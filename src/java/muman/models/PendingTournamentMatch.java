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
public class PendingTournamentMatch extends PendingMatch{
    int tournament_id;
    int match_level;


    public PendingTournamentMatch(int tournament_id, int match_level, int id, String player1, String player2, String date) {
        super(id, player1, player2, date);
        this.tournament_id = tournament_id;
        this.match_level = match_level;
    }

    public int getTournament_id() {
        return tournament_id;
    }

    public void setTournament_id(int tournament_id) {
        this.tournament_id = tournament_id;
    }

    public int getMatch_level() {
        return match_level;
    }

    public void setMatch_level(int match_level) {
        this.match_level = match_level;
    }
    
    
    
}
