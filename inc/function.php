<?php 
ini_set('display_errors', 1);             // Active l'affichage des erreurs à l'écran
ini_set('display_startup_errors', 1);    // Active l'affichage des erreurs de démarrage de PHP
error_reporting(E_ALL);                  
function connexion()
{
    static $connect = null;
    if ($connect === null) {
        $connect = mysqli_connect('localhost', 'root', '', 'db_s2_ETU004280');
        if (!$connect) {
            // Arrête le script et affiche une erreur si la connexion échoue
            die('Erreur de connexion à la base de données : ' . mysqli_connect_error());
        }
        // Optionnel : définir l'encodage des caractères pour gérer les accents (UTF-8 recommandé)
        mysqli_set_charset($connect, 'utf8mb4');
    }
    return $connect;
}

function get_all_from_propriete(){
    $query = "SELECT id_propriete, adresse, ville, prix, type_maison FROM proprietes_immobilier";
$result = mysqli_query(connexion(), $query); 
return $result;
}

function get_propriete_agent($id_agent){
    $query =sprintf ("SELECT * FROM v_agent_propriete WHERE id_agent = %d;",$id_agent);
$result = mysqli_query(connexion(), $query); 
return $result;     
}
function get_Statut($adresse){
    $req='SELECT adresse FROM proprietes_immobilier WHERE id_propriete NOT IN (SELECT id_propriete FROM transactions_immobilier);';
    $result = mysqli_query(connexion(),$req);
    $resultat =array();
    if($result != null){

    while($r = mysqli_fetch_assoc($result)){
        $resultat[]=$r['adresse'];
    }
        if (in_array($adresse,$resultat)){
            return true;
        }else{
            return false;
        }
    }
}
function get_Propriete($id){
    $req="SELECT * FROM proprietes_immobilier WHERE id_propriete=$id";
    $result=mysqli_query(connexion(),$req);
    $resultat = mysqli_fetch_assoc($result);
    return $resultat;
}
function get_Agent($id_propriete){
    $req = "SELECT * FROM agents_immobilier WHERE id_agent= (SELECT id_agent FROM listings_immobilier WHERE id_propriete= $id_propriete);";
    $result = mysqli_query(connexion(),$req);
    $resultat = mysqli_fetch_assoc($result);
    return $resultat;
}
?>