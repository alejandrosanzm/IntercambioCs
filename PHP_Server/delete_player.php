<?php
  require 'connection.php';

  $parameters = file_get_contents("php://input");
  if(isset($parameters)) {
    $json = json_decode($parameters, true);
    $id = $json["id"];

    $query  = "DELETE FROM player WHERE playerId = ".$id;
	$result = $conn->query($query);
    echo $id;
  }
  $conn->close ();
?>
