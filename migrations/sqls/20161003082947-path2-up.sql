/* Replace with your SQL commands */

INSERT INTO Paths
SET
	id=2,
	name = "Cambriolage au musée",
	thumb = "img/2/mhn.jpg",
	init_content = "A tous les detectives en herbes : il y a eu un cambriolage au muséum d\'histoire naturelle. La police ne dispose pas de suffisemment de ressources pour mener à bien cette enquête. Si le dossier vous intéresse, rendez-vous sur la place de la monnaie.",
	win_content = "Youpi !",
	give_objects = "7",
	open_places = "8",
	latitude = 47.214901,
	longitude = -1.553836,
	type = "Enquête"
;

INSERT INTO Places
SET
	id=8,
	name = "Muséum d\'histoire naturelle",
	latitude = 47.213188,
	longitude = -1.565203,
	path_id = 2,
	places_on_open = "9",
	content = '<p>\"C\'est affreux\", soupire le directeur du musée.\"Les scélérats ont volé de nombreux spécimens exposés. Je ne sais pas si nous pourrons les retrouver. Vous devez nous aider ! \"</p>
	<p>Le directeur te fournit la liste des espèces à retrouver. Il va falloir bien ouvrir les yeux afin de les trouver tout au long du parcours.</p>
	<p>Il te remet également un appareil permettant d\'appeler la centrale de police afin de communiquer votre avancée dans l\'enquête.</p>',
	content_type = 'youtube',
	media = "O-Qw7DMzZdw"
;

INSERT INTO Places
SET
	id=9,
	name = "Place Paul Emile Ladmirault",
	latitude = 47.213638,
	longitude = -1.564707,
	path_id = 2,
	places_on_open = "10",
	content = '<p>Tu repères des caméras de sécurité devant le Crédit Agricole. Tu entres dans la banque et exige de voir les images.</p><p> Ces dernières permettent d\'apercevoir en groupe de trois suspects déplaçant une remorque bien chargée. En plus des animaux de la liste du directeur du musée, il semble y avoir un animal supplémentaire. Mais la qualité des images ne permet de déterminer lequel.</p><p> Le groupe se dirige vers la Géothèque juste à côté et l\'un des individus monte sur la cariole pour déterriorer l\'enseigne de la librairie. Puis le groupe s\'éloigne par la rue Scribe hors du champs de vision des caméras.</p>'
;

INSERT INTO Places
SET
	id=10,
	name = "La Géothèque",
	latitude = 47.213979,
	longitude = -1.563978,
	path_id = 2,
	places_on_open = "11",
	content = '<p>Tu regardes la mappemonde corrigée par le vendale. L\'auteur en a profité pour ajouter un grafiti.</p><p>\"Les Hommes ont divisé le monde pour mieux le gouverner... Nous le rendons aux animaux !\"</p><p>\"Notre prochaine cible sera un homme illustre né dans cette ville.\"</p>'
;

INSERT INTO Places
SET
	id=11,
	name = 'L\'amiral Verne',
	latitude = 47.214009,
	longitude = -1.563055,
	path_id = 2,
	places_on_open = "12",
	content = "To be definied"
;

INSERT INTO Places
SET
	id=12,
	name = "Le montreur d'ours",
	latitude = 47.213592,
	longitude = -1.562903,
	path_id = 2,
	places_on_open = "13",
	content = "To be definied"
;

INSERT INTO Places
SET
	id=13,
	name = "Le montreur d'ours",
	latitude = 47.213108,
	longitude = -1.562229,
	path_id = 2,
	places_on_open = "14",
	content = "To be definied"
;



INSERT INTO Objects
SET
	id=7,
	name = "Animaux cherchés",
	thumb = "img/2/animals.png",
	media = "path_content/2/animals.html",
	content_type = "iframe",
	path_id =2,
	content = "Il faut trouver ces animaux."
;

INSERT INTO Objects 
(
	id,
	name, 
	thumb,
	content,
	success_condition,
	success_key,
	success_content,
	success_content_type,
	success_media,
	path_id,
	content_type,
	media
)
VALUES 
(
	8,
	"Canard",
	"img/2/animals.png",
	"Sur quel type de magasin est positionné ce canard géant ?",
	"password",
	"sex",
	"Bravo",
	"img",
	"img/2/animals.png",
	2,
	"img",
	"img/2/animals.png"
),
(
	9,
	"Chat",
	"img/2/animals.png",
	"A quel groupe de rock fait référence le costume de ce chat ?",
	"password",
	"indochine",
	"Bravo",
	"img",
	"img/2/animals.png",
	2,
	"img",
	"img/2/animals.png"
),
(
	10,
	"Cheval",
	"img/2/animals.png",
	"En quoi est déguisé ce cheval amateur de glaces ?",
	"password",
	"licorne",
	"Bravo",
	"img",
	"img/2/animals.png",
	2,
	"img",
	"img/2/animals.png"
),
(
	11,
	"Elephant",
	"img/2/animals.png",
	"Cet éléphant, symbole de Nantes, fait référence à l'univers de quel auteur nantais ?",
	"password",
	"verne",
	"Bravo",
	"img",
	"img/2/animals.png",
	2,
	"img",
	"img/2/animals.png"
),
(
	12,
	"Héron",
	"img/2/animals.png",
	"Où peut-on admirer le héron des machines de l'Île ?",
	"password",
	"galerie",
	"Bravo",
	"img",
	"img/2/animals.png",
	2,
	"img",
	"img/2/animals.png"
),
(
	13,
	"Oie",
	"img/2/animals.png",
	"Par quoi a été remplacée la tête de ce volatile ?",
	"password",
	"fourchette",
	"Bravo",
	"img",
	"img/2/oursoie_soluce.jpg",
	2,
	"img",
	"img/2/oie_hint.jpg"
),
(
	14,
	"Ours",
	"img/2/animals.png",
	"A côté de quel autre animal ce trouve l'ours en peluche ?",
	"password",
	"oie",
	"Bravo",
	"img",
	"img/2/oursoie_soluce.jpg",
	2,
	"img",
	"img/2/ours_hint.jpg"
),
(
	15,
	"Perroquet",
	"img/2/animals.png",
	"Combien de caméras surveillent la sortie de cet animal ?",
	"password",
	"4",
	"Bravo",
	"img",
	"img/2/perroquet_soluce.jpg",
	2,
	"img",
	"img/2/perroquet_hint.jpg"
),
(
	16,
	"Yack",
	"img/2/animals.png",
	"Cet animal a permis de décorer les enseignes voisines. Par quel moyen ?",
	"password",
	"perruque",
	"Bravo",
	"img",
	"img/2/animals.png",
	2,
	"img",
	"img/2/animals.png"
),
(
	17,
	"Cigale",
	"img/2/animals.png",
	"Sur quel type de restaurant se trouve la cigale ?",
	"password",
	"bistro",
	"Bravo",
	"img",
	"img/2/cigale_soluce.jpg",
	2,
	"img",
	"img/2/cigale_hint.jpg"
),
(
	18,
	"Girafe",
	"img/2/animals.png",
	"De quelle couleur est le pied avant droit de cet animal ?",
	"password",
	"bleu",
	"Bravo",
	"img",
	"img/2/girafe.jpg",
	2,
	"img",
	"img/2/girafe.jpg"
),
(
	19,
	"Cochon",
	"img/2/animals.png",
	"Quelle est la température au Sénégal d'après le termomètre à côté du chef-cochon ?",
	"password",
	"47",
	"Bravo",
	"img",
	"img/2/cochon.jpg",
	2,
	"img",
	"img/2/cochon.jpg"
);