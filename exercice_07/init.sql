SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS kennelDB CHARACTER SET utf8mb4;
USE kennelDB;

CREATE TABLE clients (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         nom VARCHAR(50) NOT NULL,
                         prenom VARCHAR(50) NOT NULL,
                         date_naissance DATE NOT NULL,
                         pseudonyme VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE adresses (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          numero VARCHAR(10) NOT NULL,
                          rue VARCHAR(100) NOT NULL,
                          code_postal CHAR(5) NOT NULL,
                          commune VARCHAR(80) NOT NULL
);

CREATE TABLE clients_adresses (
                                  client_id INT NOT NULL,
                                  adresse_id INT NOT NULL,
                                  PRIMARY KEY (client_id, adresse_id),
                                  FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE,
                                  FOREIGN KEY (adresse_id) REFERENCES adresses(id) ON DELETE CASCADE
);

CREATE TABLE chiens (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        nom VARCHAR(50) NOT NULL,
                        date_naissance DATE NOT NULL,
                        race VARCHAR(50) NOT NULL,
                        sterilise BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE chats (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       nom VARCHAR(50) NOT NULL,
                       date_naissance DATE NOT NULL,
                       race VARCHAR(50) NOT NULL,
                       sterilise BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO clients (nom, prenom, date_naissance, pseudonyme) VALUES
                                                                  ('Dupont', 'Marie', '1990-04-12', 'marie59'),
                                                                  ('Martin', 'Lucas', '1985-09-30', 'lucasM'),
                                                                  ('Bernard', 'Sophie', '1998-01-22', 'sobe');

INSERT INTO adresses (numero, rue, code_postal, commune) VALUES
                                                             ('12', 'Rue de la Gare', '59000', 'Lille'),
                                                             ('5', 'Avenue du Peuple Belge', '59800', 'Lille'),
                                                             ('27', 'Rue Nationale', '59150', 'Wattrelos');

INSERT INTO clients_adresses (client_id, adresse_id) VALUES
                                                         (1, 1), (1, 2), (2, 2), (3, 3);

INSERT INTO chiens (nom, date_naissance, race, sterilise) VALUES
                                                              ('Rex', '2019-06-15', 'Berger allemand', TRUE),
                                                              ('Milo', '2021-03-02', 'Labrador', FALSE),
                                                              ('Luna', '2020-11-08', 'Border Collie', TRUE);

INSERT INTO chats (nom, date_naissance, race, sterilise) VALUES
                                                             ('Félix', '2018-05-20', 'Européen', TRUE),
                                                             ('Nala', '2022-02-14', 'Maine Coon', FALSE),
                                                             ('Tigrou', '2020-08-01', 'Siamois', TRUE);