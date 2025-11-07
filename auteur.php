<?php

$database = new mysqli("192.168.56.56", "homestead", "secret", "bibliotheque");
mysqli_set_charset($database, "utf8mb4");

// Je demande à ma BDD l'auteur dont j'ai l'id dans $_GET
// Et j'utilise fetch_assoc() pour récupérer le premier (et seul) résultat
// Dans un tableau associatif
$monAuteur = $database->execute_query("SELECT * FROM auteur WHERE id = ?", array($_GET['id_auteur']))->fetch_assoc();


// Cette fois je ne fais pas de fetch_assoc() car je vais avoir une LISTE de livres
// Donc plusieurs. Et $listeLivres peut déjà être donné à un foreach pour extraire chaque ligne
$listeLivres = $database->execute_query("SELECT livres.*, a.nom as auteur, g.nom as genre  
FROM livres 
INNER JOIN auteur a ON a.id = livres.id_auteur 
INNER JOIN genres g ON g.id = livres.id_genre  
WHERE id_auteur = ?", array($monAuteur['id']));

function convertDate(string $dateAConvertir) :string {
    return date('d/m/Y', strtotime($dateAConvertir));
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bibliothèque - <?= $monAuteur['nom'] ?></title>
    <!-- Inclusion de Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <!-- Inclusion du CSS de Slick -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <style>
        img {
            max-height: 380px;
        }
    </style>
</head>
<body style="background-color:cadetblue;">
    <div class="container">
        <h1 class="text-white"><?= $monAuteur['nom'] ?></h1>
        <h4><?= $monAuteur['nationalite'] ?> - <?= convertDate($monAuteur['date_naissance']) ?></h4>
        <p><?= $monAuteur['biographie'] ?></p>

        <h2 class="text-white">Livres de cet auteur</h2>
        <div class="slider-livres">
            <?php
            foreach($listeLivres as $livre) {
                ?>
                <a href="detail_livre.php?id_livre=<?= $livre['id'] ?>" class="p-3 text-decoration-none text-dark text-center">
                    <?php
                    // Si j'ai bien un fichier et qu'il est lisible, alors je prends l'image de la BDD
                    if(is_file($livre['couverture']) && is_readable($livre['couverture'])) {
                        $path = $livre['couverture'];
                    } else {
                        $path = "images/placeholder.jpg";
                    }
                    ?>
                    <img src="<?= $path ?>" class="img-fluid mx-auto my-2"/>
                    <h4><?= $livre['titre'] ?></h4>
                    <h6><?= $livre['auteur'] ?> - <?= $livre['genre'] ?></h6>
                    <p><?= substr($livre['resume'], 0, 100) ?>...</p>
                </a>
                <?php
            }
            ?>
        </div>
    </div>
    <!-- Inclusion de jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- Inclusion du JS de Slick -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- Inclusion de Boostrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <script type="text/javascript">
        $(function() {
            $('.slider-livres').slick({
                mobileFirst: true,
                slidesToShow: 1,
                slidesToScroll: 1,
                infinite: true,
                responsive: [
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 3
                        }
                    }
                ]
            });
        });
    </script>
</body>
</html>