DROP TABLE IF EXISTS `Tags`;

CREATE TABLE Paths (
	id int unsigned NOT NULL AUTO_INCREMENT,
	name varchar(40) NOT NULL,
	thumb varchar(60) DEFAULT NULL,
	init_content text DEFAULT NULL,
	win_content text DEFAULT NULL,
	give_objects varchar(20) DEFAULT NULL,
	open_places varchar(20) DEFAULT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE Places (
	id int unsigned NOT NULL AUTO_INCREMENT,
	name varchar(40) NOT NULL,
	thumb varchar(60) DEFAULT NULL,
	latitude DECIMAL(10,8) NOT NULL,
	longitude DECIMAL(10,8) NOT NULL,
	objects_on_open varchar(20) DEFAULT NULL,
	places_on_open varchar(20) DEFAULT NULL,
	places_on_success varchar(20) DEFAULT NULL,
	objects_on_success varchar(20) DEFAULT NULL,
	content text DEFAULT NULL,
	content_type varchar(10) DEFAULT "text",
	media varchar(60) DEFAULT NULL,
	path_id int unsigned,
	PRIMARY KEY (id),
	CONSTRAINT place_path 
		FOREIGN KEY (path_id)
		REFERENCES Paths(id) 
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE Objects (
	id int unsigned NOT NULL AUTO_INCREMENT,
	name varchar(40) NOT NULL,
	thumb varchar(60) DEFAULT NULL,
	objects_on_open varchar(20) DEFAULT NULL,
	places_on_open varchar(20) DEFAULT NULL,
	places_on_success varchar(20) DEFAULT NULL,
	objects_on_success varchar(20) DEFAULT NULL,
	content text DEFAULT NULL,
	content_type varchar(10) DEFAULT "text",
	media varchar(60) DEFAULT NULL,
	path_id int unsigned,
	PRIMARY KEY (id),
	CONSTRAINT object_path 
		FOREIGN KEY (path_id)
		REFERENCES Paths(id) 
) ENGINE=InnoDB CHARSET=utf8;

INSERT INTO Paths (name, init_content, win_content, give_objects) VALUES
("Le trésor de Jules Verne", 
"<p>Tu achèves tranquillement, la lecture de 'Le tour du monde en 80 jours' de Jules Vernes. Arrivé(e) à la dernière page, une feuille pliée en quatre s'échappe et tombe à tes pieds.</p>",
"<p>Le barman sourit, et pointe du doigt un client qui lit tranquillement accoudé au bar.</p><p>'Je pense que vous cherchez Elie', vous répond-il au lieu de vous servir un verre.</p><p> Le client bondit vers vous, hilare.</p><p>'Vous avez trouvé le trésor de Jules Vernes', hurle-t-il.'Vous êtes devenus riches d'imagination ! Vous avez arpentez les rues de Nantes et vous y avez découvert de nouveaux visages. Peut-être même que vous avez eu le temps d'apprendre quelques choses sur cette merveilleuse ville. Avez-vous pris le temps de visiter les ateliers des machines ? Avez-vous goûté les meringues chez Au Merveilleux ?'</p><p> Le trésor de Jules Verne semble plus consister en une philosophie de vie qu'en amas d'or. J'espère que tu te sens tout de même enrichi de cette expérience.</p>",
"1");

INSERT INTO Objects (name, thumb, media, objects_on_open, places_on_open, content, content_type, path_id) VALUES 
("Lettre de Elie à Romain", "img/1/lettreElieRomain_thumb.jpg", "img/1/lettreElieRomain.jpg", NULL, "1,2", "Cela ressemble à une correspondance entre deux amis.", "img", 1),
("Clé du garage d'Elie", "img/1/cleElie_thumb.jpg","img/1/cleElie.jpg", NULL, NULL, "Romain t'a remis cette clé qui ouvre le garage d'Elie.", "img", 1);

INSERT INTO Places 
SET name='Appartement de Romain', latitude=47.2124513, longitude=-1.5640725000000657, objects_on_open='2,3', 
content="<p>Tu sonnes à l'appartement de Romain. Ce dernier t\'ouvres la porte d'un air étonné.</p><p> \"Que voulez-vous ?\"</p><p>Tu lui expliques que tu as trouvé la lettre de Elie et que tu aimerais poursuivre la chasse au trésor.</p><p> \"Cette chasse a rendu mon ami Elie complètement fou. Heureusement qu'il a réussi à s'arrêter à temps pour se reposer et partir en vacaces. Si vous y tenez, je vous laisse la clé qui permet d'ouvrir son garage afin d'obtenir le coffre, mais honnêtement, je pense que vous devriez mieux vous abstenir.\"</p><p> Vous insistez un peu. Il vous donne une clé, ainsi que de morceaux de papier.<p><p> \"Dans un dernier geste de rage avant de renoncer définitivement, Elie a déchiré cet indice. Afin d\'être sûr de ne plus s\'impliquer dans ce mystère, il me l\'a confié. Je ne sais pas pourquoi je l\'ai conservé... Je pense qu\'il peut vous être utile.\"</p>";

INSERT INTO Places
SET name="Appartement d\'Elie",
latitude=47.2102543,
longitude=-1.566128899999967,
objects_on_success="4",
places_on_success="3",
content="<p>Tu te trouves au pied de l\'immeuble de ce fameux Elie qui cherchait le trésor de Jules Verne. Malheureusement, la porte est fermée. Tu essaies de sonner chez les voisins, mais personne ne te répond.</p><p>Il vaut peut-être mieux rendre visite à son ami Romain.</p>";