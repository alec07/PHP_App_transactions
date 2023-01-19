<?php
include('dbconnect.php');

$username = $_POST['username'];
$password = $_POST['password'];

$query = "SELECT * FROM utilizatori WHERE nume='$username' AND parola='$password'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) == 1) {
  // datele de conectare sunt valide, permite conectarea utilizatorului
  // poți să setezi o variabila de sesiune pentru a ține minte că utilizatorul a făcut login
  $_SESSION['logged_in'] = true;
  header('location:main.php');
} else {
  // datele de conectare sunt incorecte, afiseaza un mesaj de eroare
  echo "Nume de utilizator sau parola incorecte. Incearca din nou.";
}


?>