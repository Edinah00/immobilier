
CREATE TABLE clients_immobilier (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    date_naissance DATE,
    genre CHAR(1)
);

CREATE TABLE proprietes_immobilier (
    id_propriete INT AUTO_INCREMENT PRIMARY KEY,
    adresse VARCHAR(100),
    ville VARCHAR(50),
    prix DECIMAL(10, 2),
    type_maison VARCHAR(50)
);

CREATE TABLE transactions_immobilier (
    id_transaction INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT,
    id_propriete INT,
    date_transaction DATE,
    prix_final DECIMAL(10, 2),
    FOREIGN KEY (id_client) REFERENCES clients_immobilier(id_client),
    FOREIGN KEY (id_propriete) REFERENCES proprietes_immobilier(id_propriete)
);

CREATE TABLE agents_immobilier (
    id_agent INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    region VARCHAR(50)
);

CREATE TABLE listings_immobilier (
    id_listing INT AUTO_INCREMENT PRIMARY KEY,
    id_agent INT,
    id_propriete INT,
    date_debut DATE,
    date_fin DATE,
    FOREIGN KEY (id_agent) REFERENCES agents_immobilier(id_agent),
    FOREIGN KEY (id_propriete) REFERENCES proprietes_immobilier(id_propriete)
);


-- Table clients
INSERT INTO clients_immobilier (nom, prenom, date_naissance, genre) VALUES 
('Martin', 'Jean', '1980-05-15', 'M'),
('Dupont', 'Marie', '1990-06-24', 'F'),
('Durand', 'Paul', '1975-02-12', 'M'),
('Morel', 'Sophie', '1988-11-19', 'F'),
('Legrand', 'Luc', '1995-08-30', 'M'),
('Bernard', 'Nathalie', '1982-01-22', 'F'),
('Lemoine', 'Vincent', '1978-09-17', 'M'),
('Fontaine', 'Chloe', '1992-12-05', 'F'),
('Lefevre', 'Julie', '1991-04-08', 'F'),
('Roy', 'Laurent', '1986-07-13', 'M'),
('Giraud', 'Emma', '1993-03-21', 'F'),
('Perrin', 'Antoine', '1985-10-14', 'M'),
('Renaud', 'Caroline', '1994-09-29', 'F'),
('Marchand', 'Pierre', '1987-05-25', 'M'),
('Duval', 'Alice', '1989-11-03', 'F'),
('Vidal', 'Jacques', '1983-06-10', 'M'),
('Aubert', 'Lucie', '1990-02-28', 'F'),
('Girard', 'Henri', '1979-08-11', 'M'),
('Moulin', 'Celine', '1992-03-17', 'F'),
('Dupuis', 'Louis', '1984-07-26', 'M');

-- Table proprietes
INSERT INTO proprietes_immobilier (adresse, ville, prix, type_maison) VALUES
('12 Rue de la Paix', 'Paris', 750000, 'Appartement'),
('15 Avenue de la Republique', 'Lyon', 300000, 'Maison'),
('23 Boulevard Saint-Michel', 'Marseille', 450000, 'Appartement'),
('7 Place Bellecour', 'Lyon', 550000, 'Maison'),
('9 Rue de Rivoli', 'Paris', 950000, 'Appartement'),
('18 Rue Victor Hugo', 'Lille', 250000, 'Maison'),
('25 Rue Saint-Honoré', 'Paris', 1100000, 'Appartement'),
('3 Rue de la République', 'Lyon', 450000, 'Maison'),
('14 Rue des Petits Champs', 'Paris', 800000, 'Appartement'),
('5 Rue de la Bourse', 'Marseille', 500000, 'Maison'),
('11 Rue Paradis', 'Marseille', 750000, 'Appartement'),
('19 Rue Massena', 'Lille', 350000, 'Maison'),
('22 Rue Faidherbe', 'Lille', 400000, 'Appartement'),
('30 Rue Nationale', 'Bordeaux', 600000, 'Maison'),
('2 Rue de l\'Intendance', 'Bordeaux', 650000, 'Appartement'),
('16 Rue Sainte-Catherine', 'Bordeaux', 700000, 'Maison'),
('28 Rue Gambetta', 'Nice', 480000, 'Appartement'),
('6 Avenue Jean Medecin', 'Nice', 520000, 'Maison'),
('10 Promenade des Anglais', 'Nice', 1000000, 'Appartement'),
('12 Rue de la Paix', 'Paris', 1200000, 'Maison');

-- Table transactions
INSERT INTO transactions_immobilier (id_client, id_propriete, date_transaction, prix_final) VALUES
(1, 1, '2023-01-15', 740000),
(2, 2, '2023-02-20', 290000),
(3, 3, '2023-03-18', 440000),
(4, 4, '2023-04-25', 530000),
(5, 5, '2023-05-10', 930000),
(6, 6, '2023-06-15', 240000),
(7, 7, '2023-07-20', 1080000),
(8, 8, '2023-08-25', 430000),
(9, 9, '2023-09-30', 780000),
(10, 10, '2023-10-05', 490000),
(11, 11, '2023-11-10', 740000),
(12, 12, '2023-12-15', 340000),
(13, 13, '2024-01-20', 390000),
(14, 14, '2024-02-25', 580000),
(15, 15, '2024-03-30', 630000),
(16, 16, '2024-04-05', 680000),
(17, 17, '2024-05-10', 460000),
(18, 18, '2024-06-15', 500000),
(19, 19, '2024-07-20', 960000),
(20, 20, '2024-08-25', 1180000);

-- Table agents
INSERT INTO agents_immobilier (nom, prenom, region) VALUES
('Leblanc', 'Sophie', 'Ile-de-France'),
('Rousseau', 'Pierre', 'Auvergne-Rhône-Alpes'),
('Moreau', 'Luc', 'Provence-Alpes-Côte d\'Azur'),
('Durand', 'Paul', 'Nouvelle-Aquitaine'),
('Dumont', 'Jean', 'Hauts-de-France'),
('Fournier', 'Julie', 'Occitanie'),
('Gauthier', 'Marie', 'Grand Est'),
('Lambert', 'Lucie', 'Bretagne'),
('Henry', 'Alex', 'Normandie'),
('Renaud', 'David', 'Pays de la Loire'),
('Dufour', 'Emma', 'Centre-Val de Loire'),
('Perrin', 'Antoine', 'Bourgogne-Franche-Comté'),
('Marchand', 'Elise', 'Corse'),
('Berger', 'Pauline', 'Provence-Alpes-Côte d\'Azur'),
('Leroy', 'Nicolas', 'Nouvelle-Aquitaine'),
('Morel', 'Sylvie', 'Ile-de-France'),
('Girard', 'Hugo', 'Occitanie'),
('André', 'Cécile', 'Bretagne'),
('Lemoine', 'Claire', 'Grand Est'),
('Garnier', 'Louis', 'Pays de la Loire');

-- Table listings
INSERT INTO listings_immobilier (id_agent, id_propriete, date_debut, date_fin) VALUES
(1, 1, '2023-01-01', '2023-12-31'),
(2, 2, '2023-02-01', '2023-11-30'),
(3, 3, '2023-03-01', '2023-10-31'),
(4, 4, '2023-04-01', '2023-09-30'),
(5, 5, '2023-05-01', '2023-08-31'),
(6, 6, '2023-06-01', '2023-07-31'),
(7, 7, '2023-07-01', '2023-12-31'),
(8, 8, '2023-08-01', '2023-11-30'),
(9, 9, '2023-09-01', '2023-10-31'),
(10, 10, '2023-10-01', '2023-12-31'),
(11, 11, '2023-11-01', '2024-01-31'),
(12, 12, '2023-12-01', '2024-02-28'),
(13, 13, '2024-01-01', '2024-03-31'),
(14, 14, '2024-02-01', '2024-04-30'),
(15, 15, '2024-03-01', '2024-05-31'),
(16, 16, '2024-04-01', '2024-06-30'),
(17, 17, '2024-05-01', '2024-07-31'),
(18, 18, '2024-06-01', '2024-08-31'),
(19, 19, '2024-07-01', '2024-09-30'),
(20, 20, '2024-08-01', '2024-10-31');
--1Lister,les clients nés après le 1er janvier 1990. 
SELECT * FROM clients_immobilier WHERE date_naissance > '1900-01-01';

--2 -Trouvez toutes les propriétés situées à Paris qui coûtent plus de 800,000
SELECT * FROM proprietes_immobilier WHERE ville = 'Paris' AND prix >800000;

--3 Listez les noms des agents et les propriétés qu'ils ont listées.

SELECT agents_immobilier.* , proprietes_immobilier.* FROM listings_immobilier 
JOIN agents_immobilier on agents_immobilier.id_agent = listings_immobilier.id_agent 
JOIN proprietes_immobilier ON proprietes_immobilier.id_propriete = listings_immobilier.id_propriete;


Create or REPLACE view v_agent_propriete 
as SELECT agents_immobilier.* , proprietes_immobilier.* FROM listings_immobilier 
JOIN agents_immobilier on agents_immobilier.id_agent = listings_immobilier.id_agent 
JOIN proprietes_immobilier ON proprietes_immobilier.id_propriete = listings_immobilier.id_propriete;


-- Créer une table type_maison, remplir la table avec les données existantes (
--insert from select).  
--Ajouter une colonne id_type_maison dans la table proprietes, et mettre à jour
-- la colonne avec l'id de la table

CREATE TABLE type_maison(
    id_type_maison INT PRIMARY KEY AUTO_INCREMENT,
    types_maison VARCHAR(500) 
);

INSERT INTO type_maison (types_maison)
SELECT DISTINCT type_maison FROM proprietes_immobilier WHERE type_maison IS NOT NULL;

ALTER TABLE proprietes_immobilier ADD COLUMN id_type_maison INT;
UPDATE proprietes_immobilier p
JOIN type_maison t ON p.type_maison = t.types_maison
SET p.id_type_maison = t.id_type_maison;
--5- Trouvez le nombre de propriétés listées par chaque agent. 

SELECT COUNT(id_propriete) ,nom FROM v_agent_propriete GROUP BY nom ;

-- 6- Trouvez les propriétés qui n'ont été vendues dans aucune transaction. 
SELECT * FROM proprietes_immobilier WHERE id_propriete not in (SELECT transactions_immobilier.id_propriete from transactions_immobilier);

--7- Listez les noms des clients, les propriétés qu'ils ont achetées, et les noms des agents qui ont listé ces
--propriétés.


SELECT clients_immobilier.nom as clients_immobilier, proprietes.* ,v_agent_propriete.nom as agent FROM transactions_immobilier 
JOIN clients_immobilier on clients_immobilier.id_client = transactions_immobilier.id_client
join proprietes_immobilier on proprietes_immobilier.id_propriete = transactions_immobilier.id_propriete 
join  v_agent_propriete on v_agent_propriete.id_propriete=transactions_immobilier.id_propriete;

--8- Trouvez toutes les propriétés et indiquez si elles ont été vendues ou non.
SELECT p.id_propriete,p.adresse,p.ville, p.prix,
    CASE 
        WHEN t.id_propriete IS NOT NULL THEN 'VENDUE'
        ELSE 'NON VENDUE'
    END AS statut_vente
FROM proprietes_immobilier p
LEFT JOIN transactions_immobilier t ON p.id_propriete = t.id_propriete;




CREATE or replace view v_client_transaction
as select c.date_naissance ,c.id_client as id , c.nom , t.* from transactions_immobilier t
join clients_immobilier c on c.id_client=t.id_client;

--9- Supprimez les trans
DELETE FROM transactions_immobilier 
WHERE id_client IN (
    SELECT id_client FROM clients_immobilier WHERE date_naissance < '1980-01-01'
);
--10- Affichez les agents ayant listé plus de 3 propriétés

SELECT a.nom, a.prenom, COUNT(l.id_propriete) AS nombre_de_listings
FROM agents_immobilier a
JOIN listings l ON a.id_agent = l.id_agent
GROUP BY a.id_agent
HAVING COUNT(l.id_propriete) > 3;