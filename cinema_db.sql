CREATE DATABASE cinema_db;

SHOW DATABASES;

USE cinema_db;

CREATE TABLE cinema(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
adresse TEXT NOT NULL
) engine=InnoDB;


CREATE TABLE salle(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
nb_places INT NOT NULL,
cinema_id INT NOT NULL,
FOREIGN KEY (cinema_id) REFERENCES cinema(id)
) engine=InnoDB;


CREATE TABLE film(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
titre VARCHAR(100) NOT NULL,
duree INT NOT NULL
) engine=InnoDB;

CREATE TABLE seance(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
film_id INT,
salle_id INT,
FOREIGN KEY(film_id) REFERENCES film(id),
FOREIGN KEY(salle_id) REFERENCES salle(id),
date_heure DATETIME NOT NULL
) engine=InnoDB;

CREATE TABLE tarif(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
prix FLOAT NOT NULL
) engine=InnoDB;

CREATE TABLE utilisateur(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
prenom VARCHAR(100) NOT NULL,
date_de_naissance DATE NOT NULL,
email VARCHAR(50) NOT NULL,
identifiant VARCHAR(15) NOT NULL,
mot_de_passe VARCHAR(255) NOT NULL
) engine=InnoDB;


CREATE TABLE admin(
utilisateur_id INT NOT NULL,
FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id)
) engine=InnoDB;

CREATE TABLE reservation(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
tarif_id INT NOT NULL,
seance_id INT NOT NULL,
utilisateur_id INT NOT NULL,
FOREIGN KEY (tarif_id) REFERENCES tarif(id),
FOREIGN KEY (seance_id) REFERENCES seance(id),
FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id)
) engine=InnoDB;

SHOW TABLES;

INSERT INTO utilisateur(nom, prenom, date_de_naissance, email, identifiant, mot_de_passe) VALUES("Dubois", "Camille", "2000-06-15", "camille@dd.fr ", "camille435","$2y$10$xy963HsmcWBbeDZe.M7A.Ox6si9pk.V/Bea7k8JawxfFQd6tOpaqG"
);

ALTER TABLE film ADD COLUMN genre VARCHAR(100);

SELECT * FROM film;

INSERT INTO cinema(id, nom, adresse) VALUES(1, "Summer Cinema", "45 rue Blanche Lyon");

INSERT INTO salle(nom, nb_places, cinema_id) VALUES("Verte", 437, 1);

INSERT INTO film(titre, duree, genre) VALUES("Inception", "148", "thriller");

INSERT INTO seance(film_id, salle_id, date_heure) VALUES(1, 1, "2023-04-15 15:00:00");

INSERT INTO tarif(nom, prix) VALUES("Plein-tarif", 9.2);


INSERT INTO seance(film_id, salle_id, date_heure) VALUES(1, 1, "2023-04-15 15:00:00");

INSERT INTO utilisateur(nom, prenom, date_de_naissance, email, identifiant, mot_de_passe) VALUES("Marc", "Dupont", "1970-01-11", "marc@dd.fr ", "marc_admin","$2y$10$NvZ0RKJwZeP1SujVQfzxae7O4yjxKjoAax2OzEaiqYgcvpV8sIaqS");

INSERT INTO admin(utilisateur_id) VALUES(2);

INSERT INTO reservation(tarif_id, seance_id, utilisateur_id) VALUES(1, 1, 1);

INSERT INTO utilisateur(nom, prenom, date_de_naissance, email, identifiant, mot_de_passe) VALUES("Dubois", "Jean", "1980-02-07", "jean@dd.fr ", "jean435","$2y$10$zaBlQIL1Ftod0SauxlbOue/.keL061la9cVtBNsS7C43hBYMF7/QW"), ("Dubois", "Madeleine ", "2006-08-07", "madl@dd.fr ", "madl_dub435","$2y$10$qablj0y4zXUfEFMxaJRgMuQZgeP0NBMECEO5JROpc1WDDF4N67YR6"), ("Dubois", "Max", "2015-07-27", "max@dd.fr ", "max_dub435","$2y$10$eBt2KTWHlDIEZAXc7SIOYOdpf1IIiA6zEKzGOGE9v8Tu9Nro3oOWq")
;

INSERT INTO utilisateur(nom, prenom, date_de_naissance, email, identifiant, mot_de_passe) VALUES("Durant", "Jeanne", "1998-02-07", "jcccean@dd.fr ", "jeanne435","HjhHD64gd6");

ALTER TABLE utilisateur ADD UNIQUE(email);

INSERT INTO salle(nom, nb_places, cinema_id) VALUES("Bleu", 300, 1), ("Grise", 350, 1), ("Orange", 280, 1)
;

INSERT INTO film(titre, duree, genre) VALUES("Le Fabuleux Destin d'Amélie Poulain", "122", "comédie-romantique"), ("Don't Look Up : Déni cosmique", "145", "comédie");

INSERT INTO seance(film_id, salle_id, date_heure) 
VALUES(1, 2, "2023-04-15 15:00:00"),  (2, 3, "2023-04-15 15:00:00"),  (2, 1, "2023-04-15 18:00:00");

INSERT INTO tarif(nom, prix) VALUES("Etudiant", 7.6), ("Moins de 14 ans", 5.9);

INSERT INTO cinema(id, nom, adresse) VALUES(2, "Family Cinema", "5 rue du Pont Paris");




