<!DOCTYPE html>

<html>

    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/skeleton.css">
        
        <title>Ajouter un nouveau produit</title>
    </head>

    <body>
    
        <div class="container">
            <div class="row">
                <div class="two-thirds column">
                    <br/><h3>TP1<br/>Clients et Produits </h3>
                </div>

                <div class="one-third column">
                    <br/><h5><a href="a_propos.html">À propos</a></h5>
                </div>
            </div>
            <div class="row">
            <div class="twelve columns">
        <?php

        // Connexion à la base de données

            try
            {
                $bdd = new PDO('mysql:host=localhost;dbname=Clients et Produits;charset=utf8', 'root', 'mysql');
            } catch(Exception $e) {
                    die('Erreur : '.$e->getMessage());
            }

            // Récupération des 10 derniers produits
            $reponse = $bdd->query('SELECT produit_id, produit_nom, produit_prix, produit_type_code, produit_autre_details, produit_disponible, type_produit_description
                                    FROM Produit, Ref_Produit_Type WHERE type_produit_code = produit_type_code
                                    ORDER BY produit_id DESC LIMIT 0, 10');


            // Affichage de chaque produit (toutes les données sont protégées par htmlspecialchars)

            echo '<table style="width:100%">   
                    <tr>
                        <th>Produit</th>
                        <th>Prix</th>
                        <th>Type</th>
                        <th>Description</th>
                        <th>Disponible</th>
                        <th>Actions</th>
                    </tr>';

            while ($donnees = $reponse->fetch())
            {
                $dispo = "Non";
                if ($donnees['produit_disponible'] == 1){
                    $dispo = "Oui";
                }

                echo '
                <td>'. htmlspecialchars($donnees['produit_nom']) . '</td>
                <td>'. htmlspecialchars($donnees['produit_prix']) . '$ </td> 
                <td>'. htmlspecialchars($donnees['type_produit_description']) . '</td>
                <td>'. htmlspecialchars($donnees['produit_autre_details']) . '</td>
                <td>'. $dispo . '</td>
                <td><a href="produit_modifier.php?id='. $donnees['produit_id'] .'">[Modifier]</a> <a href="produit_supprimer.php?id='. $donnees['produit_id'] .'">[Supprimer]</a></td></tr>';
            }    
            
            echo '<tr><td><a href=produit_ajouter.php>Ajouter</a></td></tr></table>';

            $reponse->closeCursor();

            ?>
            </div>
        </div>
        </div>
    </body>
</html>