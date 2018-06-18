-- REQUETE DML INSERT
INSERT INTO classe (niveau, nombre_places, nom_classe, nom_prof_principal)
VALUES ('3ème', 25, 'hoc_2018', 'M. Dupont Jean-François');

INSERT INTO etudiant (nom, prenom, email, telephone)
VALUES ('Laforge', 'Julien', 'julien.laforge@gmail.com', NULL);

ALTER TABLE etudiant ADD COLUMN id_classe INT NOT NULL;

ALTER TABLE etudiant
ADD CONSTRAINT fk_etudiant_classe FOREIGN KEY (id_classe) REFERENCES classe(id_classe);

-- Suppression de toutes les lignes d'une table (ici etudiant)
DELETE FROM etudiant;

INSERT INTO etudiant (nom, prenom, telephone, email, id_classe)
VALUES
('Assim', 'Yassin', '0606060606', 'yassin.assim@gmail.com', 1),
('Ballet', 'Clément', '0707070707', 'clement.ballet@gmail.com', 1);

-- CREATION TABLE PROFESSEUR
CREATE TABLE professeur (
    id_professeur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(150) NOT NULL,
    prenom VARCHAR(150) NOT NULL,
    civilite VARCHAR(15) NOT NULL,
    matiere VARCHAR(50) NOT NULL,
    id_classe INT NULL,
    CONSTRAINT fk_professeur_classe FOREIGN KEY (id_classe) REFERENCES classe(id_classe)
) ENGINE=INNODB;

ALTER TABLE professeur ENGINE=INNODB;

-- INSERTION PROFESSEURS
INSERT INTO professeur (civilite, id_classe, matiere, nom, prenom)
VALUES
('Monsieur', 1, 'Mathématiques', 'Dupont', 'Paul'),
('Madame', 2, 'Physique', 'Wallace', 'Sophie'),
('Madame', 3, 'Histoire', 'Martin', 'Candice');

-- Préparation nouveau champ id_prof_principal dans classe
ALTER TABLE classe
ADD COLUMN id_prof_principal INT NOT NULL;

-- Suppression nom_prof_principal
-- Ne pas confondre avec DELETE (qui concerne les valeurs)
ALTER TABLE classe
DROP COLUMN nom_prof_principal;

-- Préparation clés étrangères
UPDATE classe
SET id_prof_principal=1;

ALTER TABLE classe
ADD CONSTRAINT fk_classe_prof_principal
FOREIGN KEY (id_prof_principal)
REFERENCES professeur(id_professeur);

-- Requêtes de sélection
SELECT CONCAT(nom, ' ', prenom) AS 'nom_prenom'
from professeur;

SELECT * FROM `professeur` WHERE id_classe IS NULL;
SELECT * FROM `professeur` WHERE id_classe=1;
-- Différent de
SELECT * FROM `professeur` WHERE matiere <> 'Sport';
-- Liste de valeurs
SELECT * FROM `professeur` WHERE matiere IN ('Sport', 'Physique');
-- Liste de valeurs : exclusion NOT IN
SELECT * FROM `professeur` WHERE id_classe NOT IN (1, 3);
-- Cumul de critères avec 'AND'
SELECT * FROM `professeur` WHERE matiere = 'Sport' AND civilite = 'Monsieur';
-- Cumul de critères avec 'OR'
SELECT * FROM `professeur` WHERE matiere = 'Sport' OR matiere = 'Physique';
-- Caractères passe-partout : '%'
-- Ici : 'tous les professeurs dont les matières commencent par "S"'
SELECT * FROM `professeur` WHERE matiere LIKE 'S%';
-- Valeurs distinctes
SELECT DISTINCT civilite FROM professeur;
-- Tri sur une ou plusieurs colonnes
SELECT * FROM `professeur` ORDER BY nom, prenom DESC;
-- Compter le nombre d'enregistrements
SELECT COUNT(*) AS 'nombre_professeurs' FROM `professeur`;
-- Compter avec critère(s)
SELECT COUNT(*) AS 'nombre_professeurs_sport'
FROM `professeur`
WHERE matiere = 'Sport';
-- Faire une somme
SELECT SUM(nombre_places) AS 'Nombre total de places' FROM `classe`;
-- Faire une moyenne
SELECT AVG(nombre_places) AS 'Nombre total de places' FROM `classe`;

-- Jointures : INNER JOIN
SELECT * FROM classe INNER JOIN professeur ON classe.id_prof_principal = professeur.id_professeur;
-- Jointures : alias
SELECT *
FROM classe cls
INNER JOIN professeur prof
ON cls.id_prof_principal = prof.id_professeur;
-- Jointure : alias de tables + alias de colonnes, concaténation depuis table jointe
SELECT cls.id_classe AS 'Id Classe', nom_classe, CONCAT(nom, ' ', prenom) AS 'Professeur Principal', prof.id_classe AS 'Id de la classe du prof principal'
FROM classe cls
INNER JOIN professeur prof
ON cls.id_prof_principal = prof.id_professeur;
-- Jointure incluant 2 tables
-- Bien préciser la table classe dans un premier temps
-- Pour pouvoir faire la jointure sur professeur
SELECT CONCAT(e.nom_etudiant, ' ', e.prenom) AS 'Etudiant', nom_classe AS 'Classe', CONCAT(p.nom, ' ', p.prenom) AS 'Professeur principal'
FROM etudiant e
INNER JOIN classe c ON e.class_id = c.classe_id
INNER JOIN professeur p ON c.id_prof_principal = p.id_prof;

-- INNER JOIN AVEC COUNT
SELECT nom_classe, COUNT(id_etudiant) 'Nombre d\'étudiants''
FROM classe
INNER JOIN etudiant
ON classe.id_classe = etudiant.id_classe;

-- LEFT JOIN AVEC GROUP BY
-- LEFT JOIN : prend en compte les enregistrements de la table de gauche qui n'auraient aucun enregistrement correspondant dans la table de droite--
-- GROUP BY : permet d'agréger le résultat attendu sur une colonne précise--
SELECT nom_classe, COUNT(id_etudiant) 'Nombre d\'étudiants''
FROM classe
LEFT JOIN etudiant
ON classe.id_classe = etudiant.id_classe
GROUP BY classe.id_classe;

/*la requet qui est exécuté dans le cas d'une MISE A JOUR */
UPDATE professeur
SET nom ="Wallace"
WHERE id_prof = 2;
/*quand on fait une séléction l'action de base s'applique a toute la table
le WHERE ici permet de préciser la cible sur laquel l'action va s'appliquer*/


/*POUR JOINDRE DUEX TABLE PAR UNE JOINTURE */
SELECT CONCAT( etudiant.nom_etudiant,'',etudiant.prenom) AS 'etudiant', nom_classe AS'classe'
FROM etudiant
INNER JOIN classe 
ON etudiant.class_id = classe.classe_id;

/*on peut remplacer l'etudiant par une lettre (ici e) et la classe aussi (ici c) ça donne le meme resultat qu'au dessus*/
SELECT CONCAT( e.nom_etudiant,'',e.prenom) AS 'etudiant', nom_classe AS'classe' 
FROM etudiant e 
INNER JOIN classe c 
ON e.class_id = c.classe_id;

/*Pour regrouper la classe, le nombre de place, et les professeur principale on fait*/
SELECT c.nom_classe AS "Classe ", c.nombre_places AS 'Nombre de places', concat(p.nom, ' ', p.prenom) AS 'Professeur principal' 
FROM classe c 
INNER JOIN professeur p 
ON c.id_prof_principal = p.id_prof 
GROUP BY c.classe_id;

/*Equivalvent d'un INNER JOIN on peut mettre plusieur table dans un FORM et ça donnera le meme resultat */
SELECT CONCAT (nom_etudiant,' ', prenom) AS 'etudiant', nom_classe AS 'classe'
FROM etudiant,classe
WHERE etudiant.class_id = classe.classe_id;

/*EXERCICES*/
/*afficher le nombre de produit similiare pour chaque produit */

    Afficher le nombre de produits similaires pour chaque produit.
SELECT produit_source.nom AS ‘Nom produit ‘, COUNT(produit_cible.id_produit) AS ‘Nombre de produits similaires’
FROM produit produit_source
LEFT JOIN produit_similaire ps 
ON produit_source.id_produit = ps.id_produit_source
LEFT JOIN produit produit_cible
ON ps.id_produit_cible = produit_cible.id_produit
GROUP BY produit_source.id_produit ;

    Afficher le nom et le prix des produits similaires au produit « PC protable HP » par ordre décroissant de degré.
SELECT produit_cible.nom AS ‘Produit’, produit_cible.prix_HT AS ‘Prix’, produit_similaire.degre AS ‘Degré’
FROM produit produit_source
INNER JOIN produit_similaire
ON produit_source.id_produit = produit_similaire.id_produit_source
INNER JOIN produit produit_cible
ON produit_similaire.id_produit_cible = produit_cible.id_produit
WHERE produit_source.nom = ‘PC Portable HP’
ORDER BY produit_similaire.degre DESC ;

    Afficher le nom et le prix des produits visibles dont le prix est strictement supérieur à 700 €.
SELECT non, prix_HT, visible
FROM produit
WHERE visible = 1
AND prix_HT > 700 ;