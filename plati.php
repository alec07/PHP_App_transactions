
<?php
  //conectare la baza de date
include('dbconnect.php');
include('main.php');

  //selectarea datelor din tabel
  $query = "SELECT * FROM plati";
  $result = mysqli_query($conn, $query);

  //construirea tabelului
  echo "<div class='text-center text-white bg-primary p-3'> ";
  echo "Tabel Plăți";
  echo "</div>";
  echo "<div class='table-responsive'>";
  echo "<table class='table'>";
  echo "<thead>";
    echo "<tr>";
      echo "<th>ID</th>";
      echo "<th>Nume</th>";
      echo "<th>ContBancar</th>";
      echo "<th>Suma</th>";
    echo "</tr>";
  echo "</thead>";
  echo "<tbody>";
  while($row = mysqli_fetch_assoc($result)) {
    echo "<tr>";
      echo "<td>" . $row['id'] . "</td>";
      echo "<td>" . $row['nume'] . "</td>";
      echo "<td>" . $row['contBancar'] . "</td>";
      echo "<td>" . $row['suma'] . "</td>";
    echo "</tr>";
  }
  echo "</tbody>";
  echo "</table>";
echo "</div>";

  //inchiderea conexiunii la baza de date
  mysqli_close($conn);
?>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addPlataModal">
  Adauga plată
</button>

<div class="modal fade" id="addPlataModal" tabindex="-1" role="dialog" aria-labelledby="addPlataModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addPlataModalLabel">Adaugă Plată</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="add_plata.php" method="post">
          <div class="form-group">
            <label for="furnizor">Nume:</label>
            <input type="text" class="form-control" id="nume" name="nume" required>
          </div>
          <div class="form-group">
            <label for="contBancar">Cont bancar:</label>
            <input type="text" class="form-control" id="contBancar" name="contBancar">
          </div>
          <div class="form-group">
            <label for="suma">Suma:</label>
            <input type="text" class="form-control" id="suma" name="suma">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Inchide</button>
            <button type="submit" class="btn btn-primary">Salveaza</button>
          </div>
        </form>
      </div>
    </div>

  </div>
</div>

