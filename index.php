<?php

$database = new mysqli("192.168.56.56", "homestead", "secret", "bibliotheque");
mysqli_set_charset($database, "utf8mb4");

$listeGenres = $database->execute_query("SELECT * FROM genres");
$listeAuteurs = $database->execute_query("SELECT * FROM auteur");

// requête par défaut 
$requete = "SELECT livres.*, a.nom as auteur, g.nom as genre 
FROM livres 
INNER JOIN auteur a ON a.id = livres.id_auteur 
INNER JOIN genres g ON g.id = livres.id_genre  
WHERE ?";
$array_params = array(1);
// Evolution de la requête si on a des paramètres en GET
if(!empty($_GET)) {
    // Si on a autre chose que chaîne vide dans le paramète motscles
    if($_GET['motscles'] != "") {
        // Alors on rajoute un filtre dans la requête
        $requete .= ' AND (titre LIKE ? OR resume LIKE ?)';
        array_push($array_params, '%' . $_GET['motscles'] . '%');
        array_push($array_params, '%' . $_GET['motscles'] . '%');
    }
    // Si on a autre chose que chaîne vide dans le paramètre id_genre
    if($_GET['id_genre'] != "") {
        // Alors on teste le champ id_genre
        $requete .= " AND id_genre = ? ";
        array_push($array_params, $_GET['id_genre']);
    }
    // Si on a autre chose que chaîne vide dans le paramètre id_auteur
    if($_GET['id_auteur'] != "") {
        // Alors on rajoute un filtre sur le champ id_auteur
        $requete .= " AND id_auteur = ? ";
        array_push($array_params, $_GET['id_auteur']);
    }
}

$listeLivres = $database->execute_query($requete, $array_params)->fetch_all(MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bibliothèque</title>
    <!-- Inclusion de Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body style="background-color:cadetblue;">
    <div class="container my-4">
        <h1 class="text-center text-white my-4">Ma bibliothèque</h1>
        <div class="row">
            <!-- Formulaire -->
            <div class="col-12 col-md-4">
                <form action="/" method="GET" class="mx-3">

                    <label for="motscles">Mots-clés</label>
                    <input type="text" id="motscles" name="motscles" class="form-control"/>
                    
                    <label for="id_genre">Genre</label>
                    <select name="id_genre" id="id_genre" class="form-control my-2">
                        <option value="">Choisissez un genre</option>
                        <?php
                        foreach($listeGenres as $genre) {
                            ?>
                            <option value="<?= $genre['id'] ?>"><?= $genre['nom'] ?></option>
                            <?php
                        }
                        ?>
                    </select>
                    <label for="id_auteur">Auteur</label>
                    <select name="id_auteur" id="id_auteur" class="form-control my-2">
                        <option value="">Choisissez un auteur</option>
                        <?php
                        foreach($listeAuteurs as $auteur) {
                            ?>
                            <option value="<?= $auteur['id'] ?>"><?= $auteur['nom'] ?></option>
                            <?php
                        }
                        ?>
                    </select>
                    <button type="submit" class="btn btn-sm btn-primary">Rechercher</button>
                </form>
            </div>
            <!-- Liste des livres -->
            <div class="col-12 col-md-8">
                <div class="row">
                    <?php
                    foreach($listeLivres as $livre) {
                        ?>
                        <div class="col-12 col-md-6 col-lg-4 my-2">
                            <a href="detail_livre.php?id_livre=<?= $livre['id'] ?>" class="card p-3 text-decoration-none">
                                <?php
                                if(is_file($livre['couverture']) && is_readable($livre['couverture'])) {
                                    $path = $livre['couverture'];
                                } else {
                                    $path = "images/placeholder.jpg";
                                }
                                ?>
                                <img src="<?= $path ?>" class="img-fluid"/>
                                <h4><?= $livre['titre'] ?></h4>
                                <h6><?= $livre['auteur'] ?> - <?= $livre['genre'] ?></h6>
                                <p><?= substr($livre['resume'], 0, 100) ?>...</p>
                            </a>
                        </div>
                        <?php
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
    <!-- Inclusion de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>