<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nieuwe Bestelling</title>
    <style>
        body {
            margin: 0;
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }
        .table-container {
            margin-top: 20px;
            padding: 0;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .done {
            color: green;
            font-size: 18px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <form name="reactie_formulier" method="post" action="">
        <table width="300" border="0">
            <tr>
                <td>Bestelnummer (17 t/m 32):</td>
                <td><input type="number" name="bestelnummer" /></td>
                <td><input type="submit" value="Zoeken" /></td>
            </tr>
        </table>
    </form>

<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['bestelnummer'])) {
    $bestelnummer = filter_var($_POST['bestelnummer'], FILTER_SANITIZE_STRING);

    try {
        $db = new PDO('mysql:host=localhost;dbname=chef', 'root', '');
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "SELECT gerecht.omschrijving AS gerecht_omschrijving, categorie.omschrijving AS categorie_omschrijving, 
                         gerecht.allergie, gerecht.prijs, gerecht.id AS gerecht_id,
						                  CASE 
                     WHEN gerecht.allergie = 1 THEN 'ja'
                     WHEN gerecht.allergie = 0 THEN 'nee'
                     ELSE 'onbekend'
                 END AS allergie_omschrijving,
                 gerecht.prijs, 
                 gerecht.id AS gerecht_id
                  FROM bestelling
                  JOIN bestelregel ON bestelling.id = bestelregel.bestelling_id
                  JOIN gerecht ON gerecht.id = bestelregel.gerecht_id
                  JOIN categorie ON categorie.id = gerecht.categorie_id
                  WHERE bestelling.id = :bestelnummer";
                  
        $stmt = $db->prepare($query);
        $stmt->execute([':bestelnummer' => $bestelnummer]);

        // Haal de resultaten op
        $resultaten = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($resultaten) {
            echo "<div class='table-container' id='tableContainer'>";
            echo "<table>";
            echo "<tr><th>Gerecht</th><th>Categorie</th><th>Allergie</th><th>Prijs</th><th>Klaar</th></tr>";
			foreach ($resultaten as $rij) {
				$gerechtId = $rij['gerecht_id'];
				echo "<tr>
					<td>{$rij['gerecht_omschrijving']}</td>
					<td>{$rij['categorie_omschrijving']}</td>
					<td>{$rij['allergie_omschrijving']}</td>
					<td>{$rij['prijs']}</td>
					<td><button class='klaar-button'>Klaar</button><span class='done' style='display:none;'>✔</span></td>
				</tr>";
            }
            echo "</table>";
            echo "</div>";
        } else {
            echo "Geen resultaten gevonden.";
        }
    } catch (PDOException $e) {
        echo "Fout: " . $e->getMessage();
    }
}
?>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Selecteer alle knoppen met de klasse 'klaar-button'
            const buttons = document.querySelectorAll('.klaar-button');
            const tableContainer = document.getElementById('tableContainer');

            buttons.forEach(button => {
                button.addEventListener('click', function (event) {
                    event.preventDefault(); // Voorkom standaardformulieractie
                    
                    const row = button.parentElement; // Vind de cel waarin de knop zich bevindt
                    const doneMark = row.querySelector('.done'); // Selecteer het vinkje

                    // Toon het vinkje en deactiveer de knop
                    doneMark.style.display = 'inline';
                    button.disabled = true;

                    // Controleer of alle knoppen zijn gedeactiveerd
                    checkIfAllDone();
                });
            });

            function checkIfAllDone() {
                const allDone = Array.from(buttons).every(btn => btn.disabled);
                if (allDone) {
                    // Verberg de tabelcontainer
                    tableContainer.style.display = 'none';
                    // Laat een bericht zien
                    const message = document.createElement('p');
                    message.textContent = "Bestelling is afgerond!";
                    message.style.textAlign = 'center';
                    message.style.fontSize = '20px';
                    message.style.color = 'green';
                    document.body.appendChild(message);
                }
            }
        });
    </script>
</body>
</html>
