<?php
// $db = new PDO('mysqli:host=localhost;dbname=cinema_db;charset=utf8', 'cinema_swa', 'DF65gj54DG');
$mysqli = new mysqli("localhost", "cinema_swa","DF65gj54DG","cinema_db");

 //On vérifie la connexion
 if($mysqli->connect_error){
  die('Erreur : ' .$mysqli->connect_error);
}
echo 'Connexion réussie';

//  $mot_de_passe = "A2d0e9z3E";
 
// $mdp_crypte = sha1(sha1($mdp)); // Donne un mot de passe crypté
 
// mysql_query("INSERT INTO utilisateur(mot_de_passe) VALUES('$mdp_crypte')");
$query = 'INSERT INTO utilisateur(nom, prenom, date_de_naissance, email, identifiant, mot_de_passe) VALUES("$nom", "$prenom", "$date_de_naissance", "$email", "$identifiant", $mdp_crypte';

mysqli_query($mysqli,$query);