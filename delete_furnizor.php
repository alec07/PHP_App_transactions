<?php
include('dbconnect.php');

$id = $_POST['id'];

$sql = "DELETE FROM furnizori WHERE id = '$id'";

if ($conn->query($sql) === TRUE) {
    header('location:furnizori.php');
} else {
    echo "Error deleting record: " . $conn->error;
}

$conn->close();
?>
