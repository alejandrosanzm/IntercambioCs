package model;

public class Player {
	private int id;
	private String playerName;
	private int playerNumber;
	private int idTeamFk;

	public Player(int id, String playerName, int playerNumber, int idTeamFk) {
		this.id = id;
		this.playerName = playerName;
		this.playerNumber = playerNumber;
		this.idTeamFk = idTeamFk;
	}

	public int getId() {
		return id;
	}

	public String getPlayerName() {
		return playerName;
	}

	public int getPlayerNumber() {
		return playerNumber;
	}

	public int getIdTeamFk() {
		return idTeamFk;
	}
}
