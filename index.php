<?php
require("inc/function.php"); // Connexion à la base
$result=get_all_from_propriete();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Liste des Propriétés</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: scale(1.03);
        }
        .navbar {
            background-color:rgb(167, 38, 38);
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
    </style>
</head>
<body>

<?php include ("inc/nav.php");?>

<main class="container mt-4">
    <header>
        <h1 class="text-center mb-4">Properties for sales</h1>
    </header>
    <section class="row">
        <?php while ($row = mysqli_fetch_assoc($result)) { ?>
            <article class="col-md-6 col-lg-4 mb-4">
                <div class="card shadow-sm">
                    <img src="asset/f15077568.png" class="card-img-top" alt="Image de la propriété">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo htmlspecialchars($row['type_maison']); ?></h5>
                        <p class="card-text"><strong>Adresse :</strong> <?php echo htmlspecialchars($row['adresse']); ?></p>
                        <p class="card-text"><strong>Ville :</strong> <?php echo htmlspecialchars($row['ville']); ?></p>
                        <p class="card-text"><strong>Prix :</strong>
                            <span class="badge bg-success"><?php echo number_format($row['prix'], 2, ',', ' '); ?> €</span>
                        </p>
                        <a href="pages/fiche_propriete.php?id=<?php echo htmlspecialchars($row['id_propriete']);?>" class="btn btn-danger w-100">Voir Détails</a>
                    </div>
                </div>
            </article>
        <?php } ?>
    </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>