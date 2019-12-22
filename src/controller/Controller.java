package controller;

import java.util.HashMap;
import java.util.Scanner;
import model.Player;

public class Controller {
	private boolean converse;

	public Controller() {
		converse = true;
		startConsole();
	}

	private void startConsole() {
		String menu = "1.Leer\n2.Eliminar\n3.Añadir\nStop";
		Scanner in = new Scanner(System.in);
		System.out.println(menu);
		while (converse) {
			System.out.print("\n# ");
			option(in.nextLine());
		}
		in.close();
	}

	private void option(String option) {
		switch (option.toUpperCase()) {
		case "LEER":
			HashMap<Integer, Player> players = new AccesoDatos().leer();
			for (Player p : players.values()) {
				System.out.println(p.getId() + " --------------------");
				System.out.println("Name: " + p.getPlayerName());
				System.out.println("Number: " + p.getPlayerNumber());
				System.out.println("Team FK: " + p.getIdTeamFk() + "\n");
			}
			break;
		case "1":
			option("LEER");
			break;
		case "ELIMINAR":
			System.out.print("ID del jugador a eliminar: ");
			new AccesoDatos().eliminar(new Scanner(System.in).nextInt());
			break;
		case "2":
			option("ELIMINAR");
			break;
		case "AÑADIR":
			System.out.print("name,number,team: ");
			String[] line = new Scanner(System.in).nextLine().split(",");
			new AccesoDatos().add(line[0], Integer.valueOf(line[1]), Integer.valueOf(line[2]));
			break;
		case "3":
			option("AÑADIR");
			break;
		case "STOP":
			stop();
			break;
		default:
			System.out.println("Opción desconocida");
			break;
		}
	}

	private void stop() {
		converse = false;
	}
}
