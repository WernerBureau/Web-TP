<?php
// Connexion à la base de données
try {
    $bdd = new PDO('mysql:host=localhost;dbname=Clients et Produits;charset=utf8', 'root', 'mysql');
} catch(Exception $e) {
        die('Erreur : '.$e->getMessage());
}

$disponible = (isset($_POST['produit_disponible'])) ? 1 : 0;

// Insertion du produit à l'aide d'une requête préparée
$req = $bdd->prepare('INSERT INTO Produit (produit_id, produit_type_code, produit_nom, produit_prix, produit_autre_details, produit_disponible) VALUES(?, ?, ?, ?, ?, ?)');
$req->execute(array($_POST['produit_id'], $_POST['produit_type_code'], $_POST['produit_nom'], $_POST['produit_prix'], $_POST['produit_autre_details'], $disponible));


// Redirection vers l'index
header('Location: index.php');
?>