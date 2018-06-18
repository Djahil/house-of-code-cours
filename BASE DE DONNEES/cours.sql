BASE DE DONNEES
(BDD2/ 8 juin 2018)

•	Rappel BDD1/ 30 avril 2018

•	Exercice :
Faire un MSD et MLD d’un catalogue de données/produits & quelques DF.

J’ai un catalogue de produits.
Un produit a :
-	Un nom
-	Un prix HT
-	Un visuel
-	Appartient à 1 ou plusieurs catégories
Une catégorie de produits a :
-	Un nom,
-	On peut avoir plusieurs produits
-	On veut garder une trace de la date d’ajout d’un produit à une catégorie
On veut un système de produits similaires, qui permettront d’associer des produits entre eux pour les proposer sur la page d’un produit.
On stockera un degré de similarité entre deux produits.

Que veut dire SQL ?
(Structure Query Language)
C’est un langage unique avec une syntaxe propre.
Query = langage de requêtes – gestion de BDD. Dit autrement, avec MySQL on va utiliser les requêtes.

Serveur Web avec un Serveur de BDD sur la machine
= ensemble situé sur un localhost ou adresse IP 127.0.0.1.


SERVEUR WEB
Apache
NgniX
IIS
pour réception des requêtes sur le port 80 ou SSL 443

phpMyAdmin : est une application Web = une interface qui va envoyer des requêtes

requête
réponse

SERVEUR BDD
MySQL (port 3306)
SQL Server
= serveur de requêtes


MySQL
•	Utilisateurs
•	BDD
o	Tables (listées +/- structure)
o	Colonnes/Champs (= attributs avec un type de données)
= conteneur
o	Lignes
o	Valeurs
o	…

Exemple de TABLE :
-	Etudiant
-	id_etudiant
-	nom
-	prénom
-	tel
-	mail


en MySQL on a plusieurs types de commandes :

DCL (Data Control Language) : regroupe des instructions SQL qui permettent d’agir sur les actions privilèges d’un utilisateur :
	GRANT
	REVOKE

DDL (Data Definition Language) : permet de définir à quoi vont ressembler nos structures de données
	CREATE
	ALTER

DML (Data Manipulation Language) requêter dans nos tables existantes (nos structures) pour récupérer nos données
	INSERT
	SELECT
	UPDATE
	DELETE


1 user = 1 BDD
Le seul PWD à retenir est celui de ROOT (celui qui a les mains sur le toute l’architecture).

Deux manières de créer une BDD :

I/ passer par l’interface « comptes utilisateurs »
-> Sur la page d’accueil
-> Onglet « comptes utilisateurs »
-> Ajouter un compte d’utilisateur
Exemple :
-	Nom de l’utilisateur : TotoHOC_2018
-	Nom d’hôte (à partir d’où l’utilisateur peut se connecter)
	[Local] : localhost
(Si Serveur interne => IP de l’entreprise).
-	PWD généré : v…

> Cocher la case
> Exécuter >>> la BDD est créée


II/ passer par DDL
1)	Créer un utilisateur avec la syntaxe suivante
CREATE USER ‘[nomUser]@’[context]’ IDENTIFIED BY ‘[pwd]’;
ou
‘TotoBisHOC_2018@%’ (%support % si on lui donne plus de droits)

2)	Exécuter une ou des enquêtes SQL sur le serveur « MySQL » :
CREATE DATABASE house_of_code ;

3)	Pour lui donner des droits :
DCL => donner des privilèges d’utilisation à un utilisateur
GRANT ALL PRIVILEGES ON house_of_code.* TO ‘TotoBisHOC_2018@localhost’ ;


NOTE SUR LA TERMINOLOGIE :
INT = champs entier / une valeur entière
VARCHAR = chaine de caractères
Null : j’autorise qu’il n’y ait pas d’élement
Index : c’est quelque chose qui vient structuré un ensemble
Primary (cette valeur sera unique, qu’elle ne pourra pas être retrouvée dans la table, mySql va devoir indexer pour une recherche plus fine) = on définit
A_I : faire une indirection vers le nom qui ensuite pourra être changé en toute sécrurité




--CREATION D'UNE TABLE (classe):--

CREATE TABLE CLASSE (
classe_id INT (=valeur entier) PRIMARY KEY (=clé primaire) AUTO_INCREMENT (pour que les données s’auto incrémentent),
nom_classe VARCHAR(100) NOT NULL (= c’est comme si la case « null » n’était pas cochée => on veut que le champs soit rempli = rend la valeur obligatoire),
nombre_de_places INT NOT NULL DEFAULT 30,
niveau VARCHAR(50) NULL (on peut avoir la valeur Null dans notre table),
nom_du_prof_principal, VARCHAR(150) NOT NULL ( !!! pas de virgule )
) ;
--Pour changer le type (ici ENGINE en INNODB de la classe) :--
ALTER TABLE classe ENGINE=INNODB;

--pour ajouter une colonne dans une table (ici étudiant):--
ALTER TABLE etudiant
ADD COLUMN class_id INT NOT NULL;

--supprimer les lignes dune table (ici etudiant): --
DELETE FROM etudiant;
--on suprrime les deux etudiants qui avaient été crée.


--Ajout d'une contrainte (création d'une clé étrangère) --:
ALTER TABLE etudiant
ADD CONSTRAINT fk_etudiant_classe FOREIGN KEY (class_id) REFERENCES classe (classe_id);

--Insérer  une entité etudiant dans la table étudiant ou la table classe (ici dans la table etudiant)--
 INSERT INTO etudiant (nom_etudiant, telephone, email, prenom, class_id )
 VALUES ('Valérie','0265894981', 'marie@love.com', 'Laura', 1),
 		('SAM','06355460321', 'marie@love.com', 'Latuf',1);


--CREATION DUNE TABLE PROFESSEUR--

CREATE TABLE PROFESSEUR (
id_prof INT PRIMARY KEY  AUTO_INCREMENT,
nom VARCHAR(150) NOT NULL,
prenom  VARCHAR(150) NOT NULL ,
civilité VARCHAR(15) NOT NULL,
matiere VARCHAR (50) NOT NULL,
classe_id NULL ,

);

--POUR CHANGER LE TYPE--
ALTER TABLE professeur ENGINE=INNODB;

--Création de la clé étrangère qui fait référence a la classe (ici classe_id) :--
ALTER TABLE professeur
ADD CONSTRAINT fk_professeur_classe FOREIGN KEY (classe_id) REFERENCES classe (classe_id);

--INSERTION DE PROFESSEUR :--
INSERT TABLE professeur (nom, prenom, civilité,classe_id)
VALUES ('marie', 'Antoine', 'Madame', '1'),
		('Paul', 'Pierre', 'Monsieur', '2'),
		('Laura', 'Villette', 'Madame', '');

--Préparation nouveau champ id_prof_principal dans la classe:--
ALTER TABLE classe
ADD COLUMN id_prof_principal INT NOT NULL;

--Suppresseion nom_prof_principal:
ne pas confondre avec DELETE (qui concerne les valeur)--
ALTER TABLE classe
DROP COLUMN nom_prof_principal;

--Préparation clé étrangeres--
UPDATE classe
SET id_prof_principal=1;

ALTER TABLE classe
ADD CONSTRAINT fk_classe_prof_principal FOREIGN KEY (id_prof_principal) REFERENCES professeur(classe_id);

--Syntax de base de la requet SELECT qui nous permet de récuperer de infos exple: - une colonne dans une table, un nom ,un prénom.
																																							
SELECT champ1, champ2 [AS aliasChamp]
FROM table 
WHERE champ1=val1 --
AND champ2=val2
ORDER BY champ1 DESC

--exemple sur le professeur--
SELECT nom; prenom
FROM `professeur`
--cette commende va nous récuperer par exemple:--
nom
prenom
Pierre
Lamain
PAUL
Latin
Jacque
Miche
--requetes dze selection
SELECT CONCAT( nom,"",prenom) AS 'nom_prenom'
from professeur,ou
SELECT * FROM 'professeur' WHERE classe_id IS NULL;

--la commende qui permet de recupéré  lesprofesseur qui ont une "class_id":--
SELECT * 
FROM `professeur` 
WHERE classe_id;
--la commende qui permet de renvoyer le profésseur qui a une "class_id=1"--
SELECT * 
FROM `professeur` 
WHERE classe_id=1;

--Si je veux reecupérer le professeur qui engeigne le sport--
SELECT * FROM `professeur` WHERE matiere <> 'EPS';
--Si je veux reecupérer le professeur qui engeigne le français et EPS--
SELECT * FROM `professeur` WHERE matiere IN ('EPS','Français');
--.............................--
SELECT * FROM `professeur` WHERE classe_id NOT IN  (1,3);
--............................--
SELECT * FROM `professeur` WHERE matiere ='EPS' or matiere = 'Français';
--Si je veux reecupérer  la civilité du professeur qui engeigne --
SELECT * FROM `professeur` WHERE matiere ='EPS' AND civilité = 'homme';
--caractere passe-partout :'%'
---selection d'un matiere dont la premiere lettre commence par F:
SELECT * FROM `professeur` WHERE matiere  lick'F%';
--........--
SELECT DISTINCT civilité FROM `professeur`;
--........--
SELECT * FROM `professeur` ORDER BY nom;
--.......--
SELECT * FROM `professeur` ORDER BY nom, prenom DESC;
--compter le nombre de professeur et lui donne un nom"nombre de professeur"--
SELECT COUNT(*) AS 'nombre_de_professeur' FROM `professeur`;

SELECT COUNT(*) AS 'nombre_de_professeur' FROM `professeur` WHERE matiere = 'EPS';

SELECT SUM(nombre de place) AS 'nombre de places' FROM 'classe'; /*CALCULE LA SOMME */
SELECT AVG(nombre de palce) AS 'nombre de places ' FRom' classe';/*CALCULE LA MOYENNE*/

EXCERCICES
séléctionner tous les etudiant de la classe 1
SELECT * FROM `etudiant` WHERE etudiant_id;
selectionnner tous les étudiants dont le nom commence par D
SELECT * FROM `etudiant` WHERE nom_etudiant LIKE 'd%';

SELECT nom_etudiant ,prenom, email FROM `etudiant` WHERE etudiant_id=2;

SELECT nom_etudiant FROM etudiant WHERE class_id <> 1;

SELECT email FROM etudiant WHERE class_id IN (1,2);

SELECT nom_etudiant FROM `etudiant` WHERE class_id=2;

SELECT COUNT(*) AS 'nombre_de_etudiant' FROM `etudiant` WHERE class_id=1;

SELECT COUNT(*) AS 'nombre_de_etudiant' FROM `etudiant` WHERE class_id IN (1,2);



--jointure :INNER JOIN--

SELECT * 
FROM classe 
INNER JOIN professeur 
ON classe.id_prof_principal =professeur.id_prof;

--jointure :alias--
SELECT * 
FROM classe cls
INNER JOIN professeur prof 
ON cls.id_prof_principal = prof.id_prof;

jointure incluant 2 tables
SELECT CONCAT(e.nom,'',e.prenom) AS 'ETUDIANT', nom_classe AS 'classe',CONCAT(p.prenom) AS'prefesseur principal'
FROM etudiant e
INNER JOIN classe ON e.classe_id = classe.classe_id;
INNER JOIN professeur p ON p.id_Prof_principal = 

SELECT nom_classe ,COUNT(etudiant_id) FROM classe INNER JOIN etudiant ON classe.classe_id = etudiant.class_id



LEFT JOIN 


SELECT nom_classe 'nombre d\'etudiant'
COUNT(etudiant_id)
FROM classe 
LEFT JOIN etudiant 
ON classe.classe_id = etudiant.class_id
GROUP BY classe.classe_id

  










