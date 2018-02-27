<?php
// Connexion à la base de données
try {
    $bdd = new PDO('mysql:host=localhost;dbname=Clients et Produits;charset=utf8', 'root', 'mysql');
} catch(Exception $e) {
        die('Erreur : '.$e->getMessage());
}

// Suppression du produit à l'aide d'une requête préparée
$req = $bdd->prepare('DELETE FROM Produit WHERE produit_id = ?');
$req->execute(array($_POST['produit_id']));


// Redirection du visiteur vers l'index
header('Location: index.php');
?>