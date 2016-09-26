DROP TABLE IF EXISTS `Tags`;

CREATE TABLE Paths (
	id int unsigned NOT NULL AUTO_INCREMENT,
	name varchar(40) NOT NULL,
	thumb varchar(60) DEFAULT NULL,
	init_content text DEFAULT NULL,
	win_content text DEFAULT NULL,
	give_objects varchar(20) DEFAULT NULL,
	open_places varchar(20) DEFAULT NULL,
	latitude DECIMAL(10,8) NOT NULL,
	longitude DECIMAL(10,8) NOT NULL,
	type varchar(15) DEFAULT "Enquête",
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
	success_condition varchar(20) DEFAULT NULL,
	success_key varchar(20) DEFAULT NULL,
	success_content text DEFAULT NULL,
	success_content_type varchar(10) DEFAULT "text",
	success_media varchar(60) DEFAULT NULL,
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
	success_condition varchar(20) DEFAULT NULL,
	success_key varchar(20) DEFAULT NULL,
	success_content text DEFAULT NULL,
	success_content_type varchar(10) DEFAULT "text",
	success_media varchar(60) DEFAULT NULL,
	path_id int unsigned,
	PRIMARY KEY (id),
	CONSTRAINT object_path 
		FOREIGN KEY (path_id)
		REFERENCES Paths(id) 
) ENGINE=InnoDB CHARSET=utf8;

INSERT INTO Paths (thumb, name, init_content, win_content, give_objects, latitude, longitude) VALUES
("img/1/verne.png",
	"Le trésor de Jules Verne", 
"<p>Tu achèves tranquillement, la lecture de 'Le tour du monde en 80 jours' de Jules Vernes. Arrivé(e) à la dernière page, une feuille pliée en quatre s'échappe et tombe à tes pieds.</p>",
"<p>Le barman sourit, et pointe du doigt un client qui lit tranquillement accoudé au bar.</p><p>'Je pense que vous cherchez Elie', vous répond-il au lieu de vous servir un verre.</p><p> Le client bondit vers vous, hilare.</p><p>'Vous avez trouvé le trésor de Jules Vernes', hurle-t-il.'Vous êtes devenus riche d'imagination ! Vous avez arpenté les rues de Nantes et vous y avez découvert de nouveaux visages. Peut-être même que vous avez eu le temps d'apprendre quelques choses sur cette merveilleuse ville. Avez-vous pris le temps de visiter les ateliers des machines ? Avez-vous goûté les meringues chez Au Merveilleux ?'</p><p> Le trésor de Jules Verne semble plus consister en une philosophie de vie qu'en amas d'or. J'espère que tu te sens tout de même enrichi de cette expérience.</p>",
"1",
47.21016909999999,
-1.5641405000000077
);

INSERT INTO Objects (name, thumb, media, objects_on_open, places_on_open, content, content_type, path_id) VALUES 
("Lettre de Elie à Romain", "img/1/lettreElieRomain_thumb.jpg", "img/1/lettreElieRomain.jpg", NULL, "1,2", "Cela ressemble à une correspondance entre deux amis.", "img", 1),
("Clé du garage d\'Elie", "img/1/cleElie_thumb.jpg","img/1/cleElie.jpg", NULL, NULL, "Romain t\'a remis cette clé qui ouvre le garage d\'Elie.", "img", 1);

INSERT INTO Objects (name, thumb, media, objects_on_open, places_on_open, content, content_type, path_id, success_condition, success_key, success_content,objects_on_success) VALUES 
("Coffre à combinaison", "img/1/coffre_thumb.jpg","img/1/coffre.jpg",NULL,"3","C'est un vieux coffre avec une combinsaison à 4 chiffres. Un éléphant est gravé près de la serrure.","img",1, "password", "8352", "Tu ouvres le coffre. A l'intérieur se trouve une bouteille d'absinthe.","4");

INSERT INTO Objects (name, thumb, media, objects_on_open, places_on_open, content, content_type, path_id) VALUES 
("Bouteille d'absinthe \'Sauvage\'", "img/1/absinthe_thumb.jpg", "img/1/absinthe.jpg",NULL,NULL,"La bouteille est vide. Elle a l\'air d\'avoir traversé quelques siècles.","img",1),
("Note de Jules Verne", "img/1/note_verne_thumb.jpg", "img/1/note_verne.jpg", NULL, NULL,"Une note griffonnée que tu as reçu de la concierge de l'immeuble.","img",1),
("Lettre du propriétaire", "img/1/lettre_proprio_thumb.jpg", "img/1/lettre_proprio.jpg", NULL, "5,7","C\'est la lettre que vous a donné la concierge de l\'appartement rue Noue Bras de Fer.","img",1);

INSERT INTO Places 
SET name='Appartement de Romain', latitude=47.2124513, longitude=-1.5640725000000657, objects_on_open='2', 
content="<p>Tu sonnes à l'appartement de Romain. Ce dernier t\'ouvres la porte d'un air étonné.</p><p> \"Que voulez-vous ?\"</p><p>Tu lui expliques que tu as trouvé la lettre de Elie et que tu aimerais poursuivre la chasse au trésor.</p><p> \"Cette chasse a rendu mon ami Elie complètement fou. Heureusement qu'il a réussi à s'arrêter à temps pour se reposer et partir en vacaces. Si vous y tenez, je vous laisse la clé qui permet d'ouvrir son garage afin d'obtenir le coffre, mais honnêtement, je pense que vous devriez mieux vous abstenir.\"</p><p> Vous insistez un peu. Il vous donne une clé, ainsi que de morceaux de papier.<p><p> \"Dans un dernier geste de rage avant de renoncer définitivement, Elie a déchiré cet indice. Afin d\'être sûr de ne plus s\'impliquer dans ce mystère, il me l\'a confié. Je ne sais pas pourquoi je l\'ai conservé... Je pense qu\'il peut vous être utile.\"</p>";

INSERT INTO Places
SET name="Appartement d\'Elie",
latitude=47.2102543,
longitude=-1.566128899999967,
objects_on_success="3",
places_on_success=NULL,
content="<p>Tu te trouves au pied de l\'immeuble de ce fameux Elie qui cherchait le trésor de Jules Verne. Malheureusement, la porte est fermée. Tu essaies de sonner chez les voisins, mais personne ne te répond.</p><p>Il vaut peut-être mieux rendre visite à son ami Romain.</p>",
success_condition="object",
success_key="2",
success_content="<p>Tu trouves facilement le garage dont t\'avais parlé Romain. Tu ouvres le garage... qui est presque totalement vide !</p><p>Tu vois un petit coffre dans un coin. C\'est sûrement celui dont parlait Elie dans sa lettre. A coté de ce coffre, des morceaux de feuille déchirée.</p>";


INSERT INTO Places 
SET name='Les Machines de l\'Île', latitude=47.205581, longitude=-1.5640409999999747,  
content="<p>Tu te rends aux machines de l\'Ile pour voir le fameux éléphant. Au guichet, tu te renseignes sur le rôle de Jules Verne dans la création des machines.</p><p> \"Jules Verne est mort bien avant la création des machines, mon ami.\", te lances le guichetier. \"Si l\'univers ici est inspiré de la bibliographie de Jules Verne, ce dernier n\'a jamais collaboré pour les fabriquer.\"</p><p>\"Par contre,\" lance-t-il fièrement, \"Jules Verne avait dessiné un plan pour faire un éléphant méchanique. C\'était très sommaire et complètement irréaliste ! Imagninez vous, une trompe de 8m, des pattes avant de 3 mètres seulement quand les pattes arîères devaient mesurer 5 m. Et une petite queue de 2m. Honnêtement qui aurait voulu voir une monstuosité pareille ?\"</p><p> \"Je crois que l\'absinthe était monté à la tête de ce pauvre Jules vers la fin de sa vie. On dit qu\'il avait une marque préférée illégale... D\'ailleurs saviez-vous qu\'il a habité à deux pas d\'ici ? Au 38 Rue La Noue Bras de Fer ! Allez donc y faire un tour !\"</p>",
places_on_open="4";

INSERT INTO Places 
SET name='Appartement Jules Vernes',
latitude=47.2068425, longitude=-1.5638241000000335,  
content="<p>Rien ne semble indiquer que Jules Verne ait vécu dans cet immeuble. Vous allez voir la concierge :</p><p>\"Jules Verne aurait habité ici ?\", vous lance-t-elle étonnée. \"Je pense qu\'on me l\'aurait dit quand même. Il y avait bien ce locataire qui était complètement obniulé par l\'écrivain... Comme s\'appelait-il déjà ?\"</p><p> Elle vous fait signe d\'entrer de son appartement et commence à chercher dans un classeur.</p><p>\"Lecuyer !!!\", hurle-t-elle soudain. \"Elie Lecuyer ! Vous le connaissez peut-être ?\"</p><p> Vous bredouiller quelques paroles, signe que vous avez vaguement entendu parlé de l\'individu en question. Toute heureuse, la concierge vous confie des affaires que cet ex-colocataire a oublié.</p>",
objects_on_open="5,6";


INSERT INTO Places 
SET name='Appartement propriétaire',
latitude=47.212764, longitude=-1.562137000000007,  
content="<p>La propriétaire vous reçoit : </p><p>\"Jules Vernes dans l\'immeuble de l\'Île de Nantes ? Balivernes ! Il est né sur le cours Olivier de Clisson. Ce n\'était qu\'au début de sa vie. Ensuite il a quitté Nantes.\"</p><p>\"Par contre,\" continue le propriétaire, \" il est vrai que j\'ai souvent eu des problèmes avec mon locataire sur l\'Île de Nantes. Mais généralement, il s\'excusait en m\'offrant mes patisseries préférées de chez Aux Merveilleux.\"</p>",
places_on_open="6";

INSERT INTO Places 
SET name='Aux Merveilleux',
latitude=47.214199, longitude=-1.5618130000000292,  
content="<p>Le serveur du bar vous accueille chaleureusement. Il est beaucoup moins souriant quand il comprend que vous n\'êtes pas client :</p><p>\"Ecoutez, moi je ne connais rien du trésor de Jules Verne. Je ne sais pas pourquoi les gens me demandent ça. On a une enseigne à son éffigie au dessus de notre boutique c\'est tout. Il avait un surnom singulier en ce lieu apparemment.\"</p>";

INSERT INTO Places 
SET name='Bar Melocotton',
latitude=47.211993, longitude=-1.5633279999999559,  
content="Tu entres dans le bar. Que fais-tu ?",
content_type="iframe",
media="path_content/1/melocotton.html";

