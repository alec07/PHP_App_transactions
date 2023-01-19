<?php
include('dbconnect.php');
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$nume = $_POST['nume'];
$contBancar = $_POST['contBancar'];

$sql = "INSERT INTO furnizori (nume, contBancar)
VALUES ('$nume', '$contBancar')";

if ($conn->query($sql) === TRUE) {
  header('location:furnizori.php');
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();

?>
