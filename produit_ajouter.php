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
        <br />
        <div class="row">
            <div class="two-thirds column">
                <h3> Ajouter un nouveau produit </h3>
            </div>
            <div class="one-third column">
                <h5><a href="index.php"> Retour </a></h5>
            </div>
        </div>

            <form action="produit_envoyer.php" method="post">
            <p>
            <div class="row">
                <div class="four columns">
                    <label for="produit_nom">Nom du produit:</label> <input type="text" name="produit_nom" id="produit_nom" />
                    <label for="produit_type_code">Type de produit:</label> 
                    <select name = "produit_type_code"> 
                        <option value = 3>Chandail</option>
                        <option value = 4>Pantalon</option>
                    </select>
                </div>
                    
                <div class="four columns">
                    <label for="produit_prix">Prix du produit:</label>  <input type="text" name="produit_prix" id="produit_prix" />
                    <label for="produit_autre_details">Details:</label>  <input type="text" name="produit_autre_details" id="produit_autre_details" />
                    <label for="produit_disponible">Produit disponible:</label>  <label><input type="checkbox" name="produit_disponible" id="produit_disponible" /> Le produit est disponible</label>
                </div>
                
            </div>

            <div class="row">
                <div class="eight columns">
                    <input type="hidden" name="produit_id" value="" /><br />
                    <input type="submit" value="Envoyer" />
                    </form>
                </div>
            </div>
            </p>
         
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
            
            echo '</table>';

            $reponse->closeCursor();

            ?>
            </div>
        </div>
    </body>
</html>