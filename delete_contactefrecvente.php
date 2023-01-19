<?php
include('dbconnect.php');

$id = $_POST['id'];

$sql = "DELETE FROM contactefrecvente WHERE id = '$id'";

if ($conn->query($sql) === TRUE) {
    header('location:contactefrecvente.php');
} else {
    echo "Error deleting record: " . $conn->error;
}

$conn->close();
?>
