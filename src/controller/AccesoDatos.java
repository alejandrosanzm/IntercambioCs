package controller;

import java.util.HashMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import h3ku.ApiRequests;
import model.Player;

public class AccesoDatos {
	private ApiRequests apiRequest;
	private String SERVER;
	private String READ;
	private String DELETE;;
	private String ADD;

	public AccesoDatos() {
		apiRequest = new ApiRequests();
		SERVER = "http://127.0.0.1/IntercambioCs/";
		READ = "leer_jugador.php";
		DELETE = "delete_player.php";
		ADD = "add_jugador.php";
	}

	public HashMap<Integer, Player> leer() {
		HashMap<Integer, Player> res = new HashMap<Integer, Player>();
		try {
			String response = apiRequest.getRequest(SERVER + READ);
			JSONObject json = (JSONObject) JSONValue.parse(response);
			Player player;
			String nombre;
			int equipo;
			int numero;
			int id;
			JSONArray array = (JSONArray) json.get("players");
			for (int i = 0; i < array.size(); i++) {
				JSONObject row = (JSONObject) array.get(i);
				nombre = row.get("playerName").toString();
				numero = Integer.parseInt(row.get("playerNumber").toString());
				id = Integer.parseInt(row.get("id").toString());
				equipo = Integer.parseInt(row.get("idTeamFK").toString());

				player = new Player(id, nombre, numero, equipo);
				res.put(id, player);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	public void eliminar(int id) {
		try {
			JSONObject obj = new JSONObject();
			obj.put("id", id);
			String json = obj.toJSONString();
			String response = apiRequest.postRequest(SERVER + DELETE, json);
			System.out.println(response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void add(String name, int number, int team) {
		try {
			JSONObject obj = new JSONObject();
			obj.put("playerName", name);
			obj.put("playerNumber", team);
			obj.put("idTeamFk", number);
			String json = obj.toJSONString();
			String response = apiRequest.postRequest(SERVER + ADD, json);
			System.out.println(response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
