CREATE DATABASE cinema_db;

SHOW DATABASES;

USE cinema_db;

CREATE TABLE cinema(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
address TEXT NOT NULL
) engine=InnoDB;


CREATE TABLE room(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
nb_places INT NOT NULL,
cinema_id INT NOT NULL,
FOREIGN KEY (cinema_id) REFERENCES cinema(id)
) engine=InnoDB;


CREATE TABLE movie(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
duration INT NOT NULL
) engine=InnoDB;

CREATE TABLE session(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
movie_id INT,
room_id INT,
FOREIGN KEY(movie_id) REFERENCES movie(id),
FOREIGN KEY(room_id) REFERENCES room(id),
date_time DATETIME NOT NULL
) engine=InnoDB;

CREATE TABLE rate(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
price FLOAT NOT NULL
) engine=InnoDB;

CREATE TABLE user(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
lastname VARCHAR(100) NOT NULL,
firstname VARCHAR(100) NOT NULL,
birthdate DATE NOT NULL,
email VARCHAR(50) NOT NULL,
username VARCHAR(15) NOT NULL,
password VARCHAR(255) NOT NULL
) engine=InnoDB;


CREATE TABLE admin(
user_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES user(id)
) engine=InnoDB;

CREATE TABLE reservation(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
rate_id INT NOT NULL,
session_id INT NOT NULL,
user_id INT NOT NULL,
FOREIGN KEY (rate_id) REFERENCES rate(id),
FOREIGN KEY (session_id) REFERENCES session(id),
FOREIGN KEY (user_id) REFERENCES user(id)
) engine=InnoDB;

SHOW TABLES;

INSERT INTO user(lastname, firstname, birthdate, email, username, password) VALUES("Dubois", "Camille", "2000-06-15", "camille@dd.fr ", "camille435","$2y$10$xy963HsmcWBbeDZe.M7A.Ox6si9pk.V/Bea7k8JawxfFQd6tOpaqG"
);

ALTER TABLE movie ADD COLUMN genre VARCHAR(100);

SELECT * FROM movie;

INSERT INTO cinema(id, name, address) VALUES(1, "Summer Cinema", "45 rue Blanche Lyon");

INSERT INTO room(name, nb_places, cinema_id) VALUES("Verte", 437, 1);

INSERT INTO movie(title, duration, genre) VALUES("Inception", "148", "thriller");

INSERT INTO session(movie_id, room_id, date_time) VALUES(1, 1, "2023-04-15 15:00:00");

INSERT INTO rate(name, price) VALUES("Plein-tarif", 9.2);


INSERT INTO session(movie_id, room_id, date_time) VALUES(1, 1, "2023-04-15 15:00:00");

INSERT INTO user(lastname, firstname, birthdate, email, username, password) VALUES("Marc", "Dupont", "1970-01-11", "marc@dd.fr ", "marc_admin","$2y$10$NvZ0RKJwZeP1SujVQfzxae7O4yjxKjoAax2OzEaiqYgcvpV8sIaqS");

INSERT INTO admin(user_id) VALUES(2);

INSERT INTO reservation(rate_id, session_id, user_id) VALUES(1, 1, 1);

INSERT INTO user(lastname, firstname, birthdate, email, username, password) VALUES("Dubois", "Jean", "1980-02-07", "jean@dd.fr ", "jean435","$2y$10$zaBlQIL1Ftod0SauxlbOue/.keL061la9cVtBNsS7C43hBYMF7/QW"), ("Dubois", "Madeleine ", "2006-08-07", "madl@dd.fr ", "madl_dub435","$2y$10$qablj0y4zXUfEFMxaJRgMuQZgeP0NBMECEO5JROpc1WDDF4N67YR6"), ("Dubois", "Max", "2015-07-27", "max@dd.fr ", "max_dub435","$2y$10$eBt2KTWHlDIEZAXc7SIOYOdpf1IIiA6zEKzGOGE9v8Tu9Nro3oOWq")
;

INSERT INTO user(lastname, firstname, birthdate, email, username, password) VALUES("Durant", "Jeanne", "1998-02-07", "jcccean@dd.fr ", "jeanne435","HjhHD64gd6");

ALTER TABLE user ADD UNIQUE(email);

INSERT INTO room(name, nb_places, cinema_id) VALUES("Bleu", 300, 1), ("Grise", 350, 1), ("Orange", 280, 1)
;

INSERT INTO movie(title, duration, genre) VALUES("Le Fabuleux Destin d'Amélie Poulain", "122", "comédie-romantique"), ("Don't Look Up : Déni cosmique", "145", "comédie");

INSERT INTO session(movie_id, room_id, date_time) 
VALUES(1, 2, "2023-04-15 15:00:00"),  (2, 3, "2023-04-15 15:00:00"),  (2, 1, "2023-04-15 18:00:00");

INSERT INTO rate(name, price) VALUES("Etudiant", 7.6), ("Moins de 14 ans", 5.9);

INSERT INTO cinema(id, name, address) VALUES(2, "Family Cinema", "5 rue du Pont Paris");

INSERT INTO cinema(id, name, address) VALUES(3, "Mood booster", "53 rue de Moulin Marseille");

INSERT INTO reservation(rate_id, session_id, user_id) VALUES(1, 1, 3);

INSERT INTO reservation(rate_id, session_id, user_id) VALUES(1, 2, 3);
