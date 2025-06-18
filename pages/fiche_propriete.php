<?php
require("../inc/function.php"); 

$id_propriete = intval($_GET['id']);
$propriete = get_Propriete($id_propriete);
if (!$propriete) {
    die("Propriété introuvable.");
}
$agent = get_Agent($id_propriete);
$sale = get_Statut($propriete['adresse']);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Fiche Propriété - <?php echo $row['adresse']; ?></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 800px;
        }
        .card {
            border: none;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .btn-agent {
            background-color:rgb(167, 38, 38);
            color: white;
            border-radius: 5px;
            padding: 10px;
            display: block;
            text-align: center;
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
<?php include ("../inc/nav.php");?>

<!--<div class="container mt-5">
    <div class="card">
        <img src="f15077568.png" class="card-img-top" alt="Image de la propriété">
        <div class="card-body">
            <h2 class="card-title"><?php echo $row['type_maison']; ?></h2>
            <p class="card-text"><strong>Adresse :</strong> <?php echo $row['adresse']; ?></p>
            <p class="card-text"><strong>Ville :</strong> <?php echo $row['ville']; ?></p>
            <p class="card-text"><strong>Prix :</strong> 
                <span class="badge bg-success"><?php echo number_format($row['prix'], 2, ',', ' '); ?> €</span>
            </p>

            <div class="bg-light p-3 rounded">
                <p class="card-text"><strong>Agent :</strong> 
                    <a href="liste_proprietes_agent.php?id_agent=<?php echo $row['id_agent']; ?>" class="btn-agent">
                        <?php echo $row['agent_nom'] . " " . $row['agent_prenom']; ?>
                    </a>
                </p>
                <p class="text-muted"><?php echo $row['region']; ?></p>
            </div>

        </div>
    </div>
</div>-->

<div class="container mt-5">
        <div class="row">
            
            <div class="col-lg-8">
                <h1 class="mb-3">
                    <?php echo htmlspecialchars($propriete['type_maison']); ?>
                    <?php if ($sale) { ?>
                        <span class="badge bg-danger">For Sale</span>
                    <?php } else { ?>
                        <span class="badge bg-secondary">Sold</span>
                    <?php } ?>
                </h1>
                <p class="text-muted">
                    <i class="bi bi-geo-alt"></i>
                    <?php echo htmlspecialchars($propriete['adresse']); ?>, <?php echo htmlspecialchars($propriete['ville']); ?>
                </p>
                <h3 class="text-danger mb-4">
                    <?php echo number_format($propriete['prix'], 0, ',', ' '); ?> $
                </h3>

                <h4>Gallery</h4>
                <div id="propertyGallery" class="carousel slide mb-4" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="../asset/f15077568.png" class="d-block w-100" alt="Property Image">
                        </div>
                        <div class="carousel-item">
                            <img src="../asset/f14883456.png" class="d-block w-100" alt="Property Image">
                        </div>
                        <div class="carousel-item">
                            <img src="../asset/f15073984.png" class="d-block w-100" alt="Property Image">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#propertyGallery" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#propertyGallery" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

                <h4>Description</h4>
                <p>
                    <?php echo !empty($propriete['description']) ? htmlspecialchars($propriete['description']) : "Aucune description disponible."; ?>
                </p>
            </div>

            <!-- Section droite -->
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Schedule a Tour</h5>
                        <form >
                            <div class="mb-3">
                                <label for="tourDate" class="form-label">Date</label>
                                <input type="date" class="form-control" id="tourDate">
                            </div>
                            <div class="mb-3">
                                <label for="tourTime" class="form-label">Time</label>
                                <input type="time" class="form-control" id="tourTime">
                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <label class="form-label">Adult</label>
                                    <input type="number" class="form-control" value="0" min="0">
                                </div>
                                <div>
                                    <label class="form-label">Children</label>
                                    <input type="number" class="form-control" value="0" min="0">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-danger w-100">Submit Request</button>
                        </form>
                    </div>
                </div>
                <!-- Informations sur l'agent -->
                <?php if ($agent) { ?>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Agent Information</h5>
                            <div class="d-flex align-items-center mb-3">
                                <img src="../asset/f15073984.png" alt="Agent" class="rounded-circle me-3" width="50" height="50">
                                <div>
                                    <h6 class="mb-0"><?php echo htmlspecialchars($agent['nom']); ?></h6>
                                    <small class="text-muted"><?php echo htmlspecialchars($agent['prenom']); ?></small>
                                </div>
                            </div>
                            <p><i class="bi bi-geo-alt"></i> <?php echo htmlspecialchars($agent['region']); ?></p>
                            <a href="liste_proprietes_agent.php?id_agent=<?php echo $id_propriete; ?>" class="btn btn-primary w-100">View Propety 's Agent Details</a>
                        </div>
                    </div>
                <?php } else { ?>
                    <p>Aucun agent associé à cette propriété.</p>
                <?php } ?>
            </div>
        </div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
