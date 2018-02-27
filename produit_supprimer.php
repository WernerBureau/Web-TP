<!DOCTYPE html>

<html>

    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/skeleton.css">
        
        <title>Supprimer un produit</title>
    </head>

    <?php
        // Connexion à la base de données
        try
        {
            $bdd = new PDO('mysql:host=localhost;dbname=Clients et Produits;charset=utf8', 'root', 'mysql');
        }

        catch(Exception $e)
        {
            die('Erreur : '.$e->getMessage());
        }

        // Récupération du produit à supprimer
        $reponse = $bdd->query('SELECT * FROM Produit
                                LEFT JOIN Ref_Produit_Type ON type_produit_code = produit_type_code
                                WHERE produit_id = ' . $_GET['id']);

        // Affichage du produit à supprimer (toutes les données externes sont protégées par htmlspecialchars)
        $donnees = $reponse->fetch();
        $reponse->closeCursor();
    ?>

    <body>
        <form action="produit_confirmer.php" method="post">
            <div class="container">
                <br />
                <div class="row">
                    <div class="two-thirds column">
                        <h3> Supprimer un produit </h3>
                        <h5>Voulez-vous vraiment supprimer ce produit?</h5>
                    </div>

                    <div class="one-third column">
                        <h5><a href="index.php"> Annuler </a></h5>
                    </div>
                </div>
                <div class="row">
                    <div class="eight columns">
                        <table style="width:100%">   
                            <tr>
                                <th>Produit</th>
                                <th>Prix</th>
                                <th>Type</th>
                                <th>Description</th>
                            </tr>
                            <td><?php echo htmlspecialchars($donnees['produit_nom']); ?></td>
                            <td><?php echo htmlspecialchars($donnees['produit_prix']); ?></td>
                            <td><?php echo htmlspecialchars($donnees['type_produit_description']); ?></td>
                            <td><?php echo htmlspecialchars($donnees['produit_autre_details']); ?></td>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="four columns">
                        <input type="hidden" name="produit_id" value="<?php echo $donnees['produit_id']; ?>" /><br />
                        <input type="submit" value="Supprimer" /> 
                    </div>
                </div>
            </div>
        </form>
    </body>


</html>