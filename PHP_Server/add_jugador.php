<?php
  require 'connection.php';

  $parameters = file_get_contents("php://input");
  if(isset($parameters)) {
    $json = json_decode($parameters, true);
    $name = $json["playerName"];
    $number = $json["playerNumber"];
    $team = $json["idTeamFk"];

    $query  = "INSERT INTO player(playerName, playerNumber, idTeamFK)";
		$query .= "VALUES('$name', $number, '$team')";
		$result = $conn->query($query);
  }
  $conn->close ();
?>
