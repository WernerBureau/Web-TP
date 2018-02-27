<!DOCTYPE html>

<html>

    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/skeleton.css">
        
        <title>Modifier un produit</title>
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

        // Récupération du produit à modifier
        $reponse = $bdd->query('SELECT * FROM Produit WHERE produit_id = ' . $_GET['id']);

        // Affichage du produit à modifer (toutes les données externes sont protégées par htmlspecialchars)
        $donnees = $reponse->fetch();
        $reponse->closeCursor();
    ?>

    <body>
        
            <div class="container">
            <br />
            <div class="row">
                <div class="two-thirds column">
                    <h3> Modifier un produit </h3>
                </div>
                <div class="one-third column">
                    <h5><a href="index.php"> Annuler </a></h5>
                </div>
            </div>
            <form action="produit_mise_a_jour.php" method="post">
            <p>
            <div class="row">
                <div class="four columns">
                    <label for="produit_nom">Nom du produit:</label> <input type="text" name="produit_nom" id="produit_nom" value="<?php echo htmlspecialchars($donnees['produit_nom']); ?>"/>

                    <label for="produit_type_code">Type de produit:</label> 
                    <select name = "produit_type_code">

                        <option <?php if ($donnees['produit_type_code'] == "3" ) echo 'selected="selected"' ; ?> value = 3>Chandail</option>
                        <option <?php if ($donnees['produit_type_code'] == "4" ) echo 'selected="selected"' ; ?> value = 4>Pantalon</option>
                    </select>
                </div>
                    
                <div class="four columns">
                    <label for="produit_prix">Prix du produit:</label>  <input type="text" name="produit_prix" id="produit_prix"  value="<?php echo htmlspecialchars($donnees['produit_prix']); ?>"/>
                    <label for="produit_autre_details">Details:</label>  <input type="text" name="produit_autre_details" id="produit_autre_details"  value="<?php echo htmlspecialchars($donnees['produit_autre_details']); ?>"/>
                    <label for="produit_disponible">Produit disponible:</label>  <label><input type="checkbox" name="produit_disponible" id="produit_disponible" <?php echo $donnees['produit_disponible'] == '1' ? 'checked="checked"' : '' ; ?> /> Le produit est disponible</label>
                </div>
                
            </div>

            <div class="row">
                <div class="eight columns">
                    <input type="hidden" name="produit_id" value="<?php echo $donnees['produit_id']; ?>" /><br />
                    <input type="submit" value="Modifier" /> 
                </div>
            </div>
            </p>
                
            </div>
        </form>
    </body>
</html>