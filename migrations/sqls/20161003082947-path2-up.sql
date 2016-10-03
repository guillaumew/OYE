/* Replace with your SQL commands */

INSERT INTO Paths
SET
	name = "Cambriolage au musée",
	thumb = "img/2/mhn.jpg",
	init_content = "Il y a eu un cambriolage au muséum d\'histoire naturelle.",
	win_content = "Youpi !",
	give_objects = "7",
	open_places = "7",
	latitude = 47.214901,
	longitude = -1.553836,
	type = "Enquête"
;

INSERT INTO Places
SET
	name = "Muséum d\'histoire naturelle",
	latitude = 47.213188,
	longitude = -1.565203,
	path_id = 2,
	places_on_open = "8",
	content = "To be definied"
;

INSERT INTO Objects
SET
	name = "Animaux cherchés",
	thumb = "img/2/animals.png",
	media = "path_content/2/animals.html",
	content_type = "iframe",
	path_id =2,
	content = "Il faut trouver ces animaux."
;
