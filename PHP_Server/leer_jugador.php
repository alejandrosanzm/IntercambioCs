<?php
  require 'connection.php';

  $query = $conn->query('SELECT * FROM player');
  if ($query->num_rows > 0) {
    $jugadores = array();
    while ($row = $query->fetch_assoc()) {
      $jugador= array();
      $jugador["id"] = $row["playerId"];
      $jugador["playerName"] = $row["playerName"];
      $jugador["playerNumber"] = $row["playerNumber"];
      $jugador["idTeamFK"] = $row["idTeamFK"];
      $jugadores[] = $jugador;
    }
    $msg = array();
    $msg["players"] = $jugadores;
    echo json_encode($msg, JSON_PRETTY_PRINT);
  }
  $conn->close ();
?>
