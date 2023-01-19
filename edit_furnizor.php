<?php
include('dbconnect.php');

$id = $_POST['id'];
$nume = $_POST['nume'];
$contBancar = $_POST['contBancar'];

$query = "UPDATE furnizori SET nume = '$nume', contBancar = '$contBancar' WHERE id = $id";

if (mysqli_query($conn, $query)) {
  header('location:furnizori.php');
} else {
  echo "Error updating record: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
