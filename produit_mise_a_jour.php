<?php
// Connexion à la base de données
try {
    $bdd = new PDO('mysql:host=localhost;dbname=Clients et Produits;charset=utf8', 'root', 'mysql');
} catch(Exception $e) {
        die('Erreur : '.$e->getMessage());
}

$disponible = (isset($_POST['produit_disponible'])) ? 1 : 0;

// Modification du produit à l'aide d'une requête préparée
$req = $bdd->prepare('UPDATE Produit SET produit_type_code = ?, produit_nom = ?, produit_prix = ?, produit_autre_details = ?, produit_disponible = ? WHERE produit_id = ?');
$req->execute(array($_POST['produit_type_code'], $_POST['produit_nom'], $_POST['produit_prix'], $_POST['produit_autre_details'], $disponible, $_POST['produit_id']));


// Redirection du visiteur vers l'index
header('Location: index.php');
?>