<?php
include('dbconnect.php');
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$nume = $_POST['nume'];
$contBancar = $_POST['contBancar'];
$suma = $_POST['suma'];
$sql = "SELECT contBancar FROM furnizori WHERE nume = '$nume'";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
$contBancar = $row['contBancar'];
$sql = "INSERT INTO transferuri (nume, contBancar, suma)
VALUES ('$nume', '$contBancar', '$suma')";

if ($conn->query($sql) === TRUE) {
  header('location:transferuri.php');
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();

?>
