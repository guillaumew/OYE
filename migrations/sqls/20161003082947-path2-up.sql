/* Replace with your SQL commands */

ALTER TABLE Paths
ADD COLUMN total_steps SMALLINT UNSIGNED DEFAULT NULL;

UPDATE Paths
SET total_steps = 7 
WHERE id=1;

INSERT INTO Paths
SET
	id=2,
	name = "Cambriolage au musée",
	thumb = "img/2/mhn.jpg",
	init_content = "A tous les detectives en herbes : il y a eu un cambriolage au muséum d\'histoire naturelle. La police ne dispose pas de suffisemment de ressources pour mener à bien cette enquête. Si le dossier vous intéresse, rendez-vous sur la place de la monnaie.",
	win_content = "Vous avez retrouvé le dragon. Bravo ! C\'est gagné :)",
	open_places = "8",
	latitude = 47.214901,
	longitude = -1.553836,
	type = "Enquête",
	total_steps = 44
;

INSERT INTO Places
SET
	id=8,
	name = "Muséum d\'histoire naturelle",
	latitude = 47.213188,
	longitude = -1.565203,
	path_id = 2,
	objects_on_open = "7",
	places_on_open = "9",
	content = '<p class=\"quote\">\"C\'est affreux\", soupire le directeur du musée.\"Les scélérats ont volé de nombreux spécimens exposés. Je ne sais pas si nous pourrons les retrouver. Vous devez nous aider ! \"</p>
	<p>Le directeur te fournit la liste des animaux empaillés à retrouver. Il va falloir bien ouvrir les yeux afin de les trouver tout au long du parcours.</p>
	<p class=\"quote\">\"Le voleur a également volé un coffre. Je ne peux pas vous révéler le contenu, mais il faut absolument le retrouver !\"</p>
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
	content = '<p>Tu repères des caméras de sécurité devant une banque. Tu entres et exige de voir les images.</p><p> Ces dernières permettent d\'apercevoir en groupe de deux suspects déplaçant une remorque bien chargée.</p><p> Le groupe se dirige vers la Géothèque juste à côté et l\'un des individus monte sur la cariole pour déterriorer l\'enseigne de la librairie. Puis le groupe s\'éloigne par la rue Scribe hors du champs de vision des caméras.</p>'
;

INSERT INTO Places
SET
	id=10,
	name = "La Géothèque",
	latitude = 47.213979,
	longitude = -1.563978,
	path_id = 2,
	places_on_open = "11",
	content = '<p>Tu regardes la mappemonde corrigée par le vendale. L\'auteur en a profité pour ajouter un grafiti.</p><p>\"Les Hommes ont divisé le monde pour mieux le gouverner... Nous rendons la Pangée aux animaux !\"</p><p>\"Notre prochaine cible sera un homme illustre né dans cette ville.\"</p>',
	content_type = 'img',
	media = 'img/2/worldmap.jpg'
;

INSERT INTO Places
SET
	id=11,
	name = 'L\'amiral Verne',
	latitude = 47.214009,
	longitude = -1.563055,
	path_id = 2,
	places_on_open = "12,13",
	content = '<p>Dans quel état se trouve notre cher Jules ! Ce dernier semble toutefois pointer du doigt vers la direction qu\'ont pris ses aggresseurs.</p><p>Les voleurs sont partis vers la place Graslin.</p>',
	content_type = 'img',
	media = 'img/2/verne.jpg'
;

INSERT INTO Places
SET
	id=12,
	name = "Le montreur d'ours",
	latitude = 47.213592,
	longitude = -1.562903,
	path_id = 2,
	content = "Tu lèves la tête et là ce sont 2 animaux du musée que tu vois. A propos, as-tu vu le perroquet ?"
;

INSERT INTO Places
SET
	id=13,
	name = "La place Graslin",
	latitude = 47.213108,
	longitude = -1.562229,
	path_id = 2,
	places_on_open = "14",
	content = "<p>Il semble que la charette des voleurs ait renversé un pot de peinture. Ce sera un jeu d\'enfant de suivre leur trace à partir de là.</p><p>Tu commences a t'avancer dans la rue Jean-Jacques Rousseau, quand tu reçois un appel du central de police.</p>",
	content_type = "youtube",
	media = "ee47QFwm6S8"
;
INSERT INTO Places
SET
	id=14,
	name = "Rue Jean Jacques Rousseau",
	latitude = 47.212894,
	longitude = -1.561543,
	path_id = 2,
	places_on_open = "15",
	content = "<p>Les traces tournent vers la gauche dans la rue Suffren puis se dirigent vers le passage Pommeraye.</p>"
;
INSERT INTO Places
SET
	id=15,
	name = "Passage Pommeraye (haut)",
	latitude = 47.213622,
	longitude = -1.560198,
	path_id = 2,
	places_on_open = "16",
	content = "<p>Incroyable ! Les voleurs ont forcé la grille du passage pour le traverser. La descente des escaliers a dû être cahotique.</p>",
	content_type = 'img',
	media = 'img/2/pommeraye.jpg'
;
INSERT INTO Places
SET
	id=16,
	name = "Passage Pommeraye (bas)",
	latitude = 47.213294,
	longitude = -1.558996,
	path_id = 2,
	places_on_open = "17",
	content = "<p>Les traces de peinture sont toujours évidentes. La charette a tourné à gauche vers la place Royale.</p>"
;
INSERT INTO Places
SET
	id=17,
	name = "Place Royale",
	latitude = 47.214507,
	longitude = -1.558323,
	path_id = 2,
	places_on_open = "18",
	content = "<p>Les traces traversent la place en direction de la basilique.</p>
	<p>Mais il reste un mystère à percer au niveau de la fontaine centrale.</p>",
	success_condition = "password",
	success_key = "sèvre",
	content_type = "youtube",
	media = "NoHqoEkqJas",
	success_content = '<p>L\'animal mytique que tu cherches est un dragon.</p>'
;
INSERT INTO Places
SET
	id=18,
	name = "Basilique Saint-Nicolas",
	latitude = 47.215041,
	longitude = -1.557486,
	path_id = 2,
	places_on_open = "19",
	content = "<p>Les traces suivent la rue qui porte le même nom que la basilique.</p>",
	content_type = 'img',
	media = 'img/2/basilique.jpg'
;
INSERT INTO Places
SET
	id=19,
	name = 'Trompe l\'oeil',
	latitude = 47.215185,
	longitude = -1.55684,
	path_id = 2,
	places_on_open = "20",
	content = "<p>L'accumulation de peinture à cet endroit semble indiquer que le voleur y a fait un arrêt.</p>
	<p>Les traces continuent ensuite en passant par la rue basse casserie, traversant le cours des 50 otages, puis se dirigeant vers la rue des Halles.</p>",
	content_type = 'img',
	media = 'img/2/oeil.jpg'
;
INSERT INTO Places
SET
	id=20,
	name = "Entrée rue des Halles",
	latitude = 47.215768,
	longitude = -1.556196,
	path_id = 2,
	places_on_open = "21",
	objects_on_open = "26",
	content = '<p>A l\'entrée de la rue, tu rammasses une carte à jouer. La peinture sur la carte ne laisse aucun doute : elle est tombée du chariot.</p>
	<p>Les traces continuent sur la rue de Halles.</p>'
;

INSERT INTO Objects
SET
	id=26,
	name = "Carte à jouer",
	path_id = 2,
	content_type = "img",
	thumb = "img/2/2pique_thumb.jpg",
	media = "img/2/2pique.jpg",
	content = '<p>Il s\'agit de la carte trouvée à l\'entrée de la rue des Halles.</p>'
;
INSERT INTO Places
SET
	id=21,
	name = "Maison de Numerobis",
	latitude = 47.215786,
	longitude = -1.554946,
	path_id = 2,
	places_on_open = "22",
	content = '<p class=\"tourisme\">Ode à la ligne droite, cette maison comporte 5 statues directement taillées dans les poutres.</p>
	<p>Les traces continuent vers l\'église Sainte Croix.</p>',
	content_type = "img",
	media = "img/2/numerobis.jpg"
;
INSERT INTO Places
SET
	id=22,
	name = "Eglise Sainte Croix",
	latitude = 47.21536,
	longitude = -1.554152,
	path_id = 2,
	places_on_open = "23",
	content = '<p>Les traces continuent vers la rue du même nom que l\'église, puis vers la rue de la juiverie.</p>',
	content_type = 'img',
	media = 'img/2/croix.jpg'
;
INSERT INTO Places
SET
	id=23,
	name = "Maison à colombage",
	latitude = 47.215662,
	longitude = -1.552875,
	path_id = 2,
	places_on_open = "24",
	content = '<p class="tourisme">Une maison à pans de bois datant du XVe siècle est classée. C\'est une construction assez typique qui permet d\'optimiser la surface totale de l\'habitation par rapport à la surface au sol (qui était taxée).</p>
	<p>Les traces continuent vers la place du Pilori.</p>',
	content_type = "img",
	media = 'img/2/colombage.jpg'
;
INSERT INTO Places
SET
	id=24,
	name = "Place du Pilori",
	latitude = 47.216167,
	longitude = -1.552953,
	path_id = 2,
	places_on_open = "25",
	content = '<p>Les traces de peintures deviennent difficiles à suivre... Elles semblent s\'engouffrer dans la rue du château.</p>',
	content_type = 'img',
	media = 'img/2/pilori.jpg'
;
INSERT INTO Places
SET
	id=25,
	name = "Rue du château",
	latitude = 47.2162,
	longitude = -1.552286,
	path_id = 2,
	places_on_open = "26",
	content = '<p>Les traces sont maintenant totalement effacées. Tu te demandes comment faire pour continuer à pister le voleur, quand ton regard croise l\'enseigne d\'un bar.</p>
	<p>Cela ne peut pas être une coïncidence. Cette enseigne, c\'est exactement la carte que tu as trouvée.</p>
	<p>Tu entres dans le bar et commences à interroger le patron.</p>
	<p>Feignant le naïf au début de l\'entretien, tu arrivers à le faire parler.</p>
	<p class=\"quote\">\" J\'ai entendu un client tenter de convaincre, Nathan, un de mes serveurs qu\'il avait trouvé une bête mytique, je n\'ai pas saisi laquelle."</p>
	<p>Appaté à l\'idée de mettre la main sur l\'animal, Nathan a suivi le voleur. Avant de partir, le serveur n\'était pas totalement confiant. Ainsi, il souffla à son patron que s\'il n\'était pas revenu le lendemain, il faudrait alerter les autorités. Il laissera des indices sur son chemin pour le trouver.</p>
	<p class=\"quote\">\"Ils sont partis dans la direction du château. Il m\'a dit qu\'il laisserait son premier indice dans la cours du château.\"</p>',
	content_type = "img",
	media = 'img/2/bar_2pique.jpg'
;
INSERT INTO Places
SET
	id=26,
	name = "Entrée château",
	latitude = 47.216475,
	longitude = -1.550483,
	path_id = 2,
	places_on_open = "27",
	content = '<p class=\"tourisme\">La cathédrale se situe à 2 min à pied d\'ici. Le parcours ne prévoit pas d\'y passer, mais vous pouvez faire le détour si vous voulez. Le chemin est balisé.</p>
	<p>Avant d\'entrer dans le château, tu remarques cette statue.</p><p>Quel est le prénom de cette femme ?</p>',
	content_type = "img",
	media = 'img/2/anne.jpg',
	success_condition = 'password',
	success_key = 'anne',
	success_content = '<p>Quand tu prononces son nom, la statue te parle.</p>
	<p class=\"quote\">\"Tu trouveras une photo de l\'animal mytique que tu cherches au Mémorial d\'Abolition de l\'Esclavage. Pour la trouver, il faudra donner le nom de code du Maille Brezé.\" </p>
	<p>Ce sera pour plus tard. Pour l\'instant, il faut retrouver Nahtan.</p>',
	places_on_success = "47"
;
INSERT INTO Places
SET
	id=27,
	name = "Cours du château",
	latitude = 47.216192,
	longitude = -1.549421,
	path_id = 2,
	places_on_success = "28,30",
	content = '<p>Au milieu de la cours se trouve une oeuvre artistique. Il s\'agit d\'un bateau avec de nombreuses lettres accrochées.</p>
	<p>Chaque lettre possède un prénom. Est-ce que tu te souviens du prénom du serveur ?</p>',
	success_condition = 'password',
	success_key = 'nathan',
	success_content = '<p>Tu retrournes la lettre portant le nom de Nathan. Voici ce qu\'elle contient :</p>
	<p class=\"quote\">\"Le vendeur doit chercher du matériel pour ouvrir le coffre qui contient mon animal. Il a un contact au Lieu Unique. C\'est donc notre prochaine étape.\"</p>
	<p>Voici la sortie la plus rapide pour y accéder : </p>',
	success_content_type = "img",
	success_media = "img/2/sortie.jpg"
;
INSERT INTO Places
SET
	id=28,
	name = "Sortie du château",
	latitude = 47.216777,
	longitude = -1.548758,
	path_id = 2,
	places_on_open = "29",
	content = "<p>En sortant du château tu en profites pour admirer les douves et le parc extérieur.</p>",
	content_type = 'img',
	media = "img/2/chateau.jpeg"
;
INSERT INTO Places
SET
	id=29,
	name = "Cours Saint Pierre",
	latitude = 47.217309,
	longitude = -1.547999,
	path_id = 2,
	content = '<p class=\"tourisme\">Le cours Saint Pierre accueille des foires deux fois par an.</p>',
	content_type = 'img',
	media = "img/2/pierre.jpg"
;
INSERT INTO Places
SET
	id=30,
	name = "Le Lieu Unique",
	latitude = 47.215451,
	longitude = -1.54624,
	path_id = 2,
	places_on_open = "31,33",
	content = '<p class=\"tourisme\">Le Lieu Unique était auparavent l\'usine LU (pour Lefebvre-Utile). Depuis la fin du XXe siècle et l\'abandon de l\'usine, c\'est devenu un espace culturel. On y on y trouve un espace d\'expositions et de spectacles ainsi qu\'un café/bar/club, un restaurant, une librairie, une boutique et un hammam.</p>
	<p>En fouillant les lieux tu tombes sur un homme ligoté et bailloné. Tu le libères :</p>
	<p class=\"quote\">\"Je m\'appelle Nathan, je travaille dans un bar à côté. J\'ai suivi un type bizarre pour lui acheter... un animal. Mais quand il a enfin pu ouvrir le coffre qui le renfermait, son complice qui l\'attendait ici est devenu fou. Il m\'a ligotté ici, a dissimulé un animal, puis ils sont tous les deux partis en criant : Redécorrons Bouffay !\"</p>
	<p>Nathan vous suit afin d\'identifier ses aggresseurs.</p>
	<p class=\"tourisme\">A 10 min à pied d\'ici (près de la gare SNCF) se trouve le jardin des plantes. Il est décoré par Claude Ponti. Le parcrous ne prévoit pas le détour, mais je vous le recommande si vous avez le temps.</p>',
	content_type = 'img',
	media = "img/2/lu.jpg"
;
INSERT INTO Places
SET
	id=31,
	name = "Le miroir d\'eau",
	latitude = 47.215356,
	longitude = -1.548826,
	path_id = 2,
	places_on_open = "32",
	content = '<p class=\"tourisme\">Avec ses 32 jets, l\'oeuvre d\'art maintient 2 cm d\'eau afin de produire son effet de miroir.</p>',
	content_type = 'img',
	media = 'img/2/miroirdeau.jpg'
;
INSERT INTO Places
SET
	id=32,
	name = "Anamorphose",
	latitude = 47.214744,
	longitude = -1.550564,
	path_id = 2,
	content = '<p class=\"tourisme\">Est-ce que ce terrain de foot est réglementaire ?</p>',
	content_type = 'img',
	media = 'img/2/anamorphose.jpg'
;
INSERT INTO Places
SET
	id=33,
	name = "Place Bouffay",
	latitude = 47.214733,
	longitude = -1.553262,
	path_id = 2,
	places_on_open = "34",
	content = '<p>Tu ne vois rien d\'anormal sur la place Bouffay. Peut-être qu\'il parlait de la rue du Bouffay ?</p>',
	content_type = 'img',
	media = "img/2/buffay.jpg"
;
INSERT INTO Places
SET
	id=34,
	name = "Rue du Bouffay",
	latitude = 47.214901,
	longitude = -1.553836,
	path_id = 2,
	places_on_open = "35",
	content = '<p>Effectivement, cette rue a bien été visitée et décorée par nos hommes !</p>
	<p>D\'ailleurs, l\'un d\'entre eux a du se blesser en accrochant l\'un des animaux puisqu\'on trouve des taches de sang.</p>
	<p>La poursuite s\'annonce à nouveau facile. L\'homme a pris à gauche en sortant vers la rue de la Paix / bon secours.</p>'
;
INSERT INTO Places
SET
	id=35,
	name = "L\'Île Feydeau",
	latitude = 47.213622,
	longitude = -1.553659,
	path_id = 2,
	places_on_open = "36",
	content = '<p class=\"tourisme\">L\'Île Feydeau tient se nom d\'île, car la Loire était autrefois plus large et cet endroit était donc une île. Le sol y est très friable, pourtant elle a été construite très tôt. Lors de ta ballade, regarde bien les immeubles. Nombres d\'entre eux sont penchés à cause des mouvements de terrain.</p>
	<p>Les traces de sang continuent vers les rue Kervégan.</p>',
	content_type = 'img',
	media = "img/2/feydeau.jpg"
;
INSERT INTO Places
SET
	id=36,
	name = "Rue Kervégan",
	latitude = 47.213258,
	longitude = -1.554552,
	path_id = 2,
	places_on_open = "37",
	content = '<p class=\"tourisme\">Petite pause dans cette chasse aux bâtiments penchés pour en admirer un autre bien plus droit : la tour de Bretagne. Avec ses 144m, c\'est la 4e tour la plus haute de province. Concrètement, c\'est surtout la plus grosse clé USB jamais construite.</p>
	<p>Les traces montrent que les complices sont allés à la place du commerce.</p>',
	content_type = 'img',
	media = 'img/2/tour.jpg'
;
INSERT INTO Places
SET
	id=37,
	name = "Place du Commerce",
	latitude = 47.21309,
	longitude = -1.558015,
	path_id = 2,
	places_on_open = "38",
	places_on_success = "40",
	content = '<p>Un homme blessé git au milieu de la place</p>
	<p class=\"quote\">Nathan bondit : \"C\'est lui ! C\'est mon agresseur ! Enfin, celui qui voulait me vendre l\'animal dans un premier temps.\"</p>
	<p class=\"quote\">Ce dernier répond : \"Eugène, mon partenaire, m\'a abandonné. Je suis trop lent avec ma blessure. Mais je suis fier de ce que j\'ai réalisé. Je libère les animaux ! Je vais être célèbre ! Dites mon nom et je me rendrais sans histoire.\"</p>
	<p>Voici la photo de notre homme. Saurez-vous trouver son prénom ?</p>',
	content_type = 'img',
	success_condition = 'password',
	media = 'img/2/henri.jpg',
	success_content_type ='img',
	success_media = 'img/2/biais.jpg',
	success_key = 'henri',
	success_content = '<p>Quand son nom est prononcé, Henri se résigne à se rendre. Par contre, il va falloir le remettre aux authorités. Le plus simple semble de l\'accompagner au Palais de Justice.</p>
	<p class=\"tourisme\">Nous cherchions des bâtiments penchés tout à l\'heure. As-tu remarqué celui situé à côté du cinéma ?</p>'
;
INSERT INTO Places
SET
	id=38,
	name = "Espace Jacques Demy",
	latitude = 47.210954,
	longitude = -1.562001,
	path_id = 2,
	places_on_open = "39",
	content = '<p class=\"tourisme\">Cet espace accueille notemment une médiathèque.</p>',
	content_type = 'img',
	media = 'img/2/demy.jpg'
;
INSERT INTO Places
SET
	id=39,
	name = "Passerelle Victor Schoelcher",
	latitude = 47.209715,
	longitude = -1.561695,
	path_id = 2,
	content = '<p>Henri commence à s\'ouvrir un peu : </p>
	<p class=\"quote\">\"Eugène affirme qu\'il a trouvé une technique permettant de donner vie à des animaux empaillés.
	Il a un atelier dans le coin où il avait l\'habitude de faire ses expériences. Je ne connais pas l\'adresse exacte.
	Par contre, on se retrouvait régulièrement à l\'Esperance Café. Je suppose qu\'il ne doit pas être loin.\"</p>'
;
INSERT INTO Places
SET
	id=40,
	name = "Palais de Justice",
	latitude = 47.208433,
	longitude = -1.561448,
	path_id = 2,
	places_on_open = "41",
	content = "<p>Votre contact policier vous attend au Palais de Justice. Dès qu\'il vous voit arriver, il embarque Henri sans faire d\'avantage de commentaires.</p>",
	content_type = 'img',
	media = 'img/2/palais.jpg'
;
INSERT INTO Places
SET
	id=41,
	name = "Espérance café",
	latitude = 47.208314,
	longitude = -1.563224,
	path_id = 2,
	places_on_open = "49",
	content = '<p>Le patron vous reçoit jovialement. Eugène est un habitué. Son atelier se situe au 34 rue Noue Bras de Fer.</p>',
	content_type = 'img',
	media = 'img/2/cafe.jpg'
;
INSERT INTO Places
SET
	id=49,
	name = "Atelier de Eugène",
	latitude = 47.206998,
	longitude = -1.562602,
	path_id = 2,
	places_on_open = "42",
	content = '<p>L\'atelier déborde d\'animaux mécaniques.</p>
	<p class=\"quote\">\"Ces animaux ressemblent à ceux des machines de l\'Île. On pourrait demander leur avis sur la question\", propose Nahtan.</p>
	<p>Tu fouilles de fond en comble, mais ne trouve rien d\'interressant à part un coffre.</p>
	<p>Pour l\'ouvrir, il faut trouver la longueur totale indiquée sur le mètre ruban.</p>',
	content_type = 'img',
	media = 'img/2/metre.jpg',
	success_condition ='password',
	success_key = '517',
	success_content = '<p>Dans le coffre, tu trouves des plans. 
	Il semble que le projet de souffler la vie aux animaux empaillés soit plus un projet mecanique que biologique.</p>',
	objects_on_success = '27'
;
INSERT INTO Objects
SET
	id=27,
	name = "Les plans",
	path_id = 2,
	content_type = "img",
	thumb = "img/2/plans.png",
	media = "img/2/eleplan.jpg",
	content = '<p>Deux plans trouvés dans l\'atelier d\'Eugène. Un pour un éléphant et un pour un hippocampe.</p>'
;

INSERT INTO Places
SET
	id=42,
	name = "Les machines de l\'Île",
	latitude = 47.20645,
	longitude = -1.564629,
	path_id = 2,
	places_on_open = "43,50",
	content = '<p>Le directeur des machines semble bien occupé. Il vous reçoit rapidement.</p>
	<p class=\"quote\">\"Un individu assez louche a effectivement tenté de nous vendre un éléphant et un hippocampe.
	Nous avons pris l\'éléphant. Il est énorme !\"</p>
	<p> Apparemment, l\'homme disposait d\'un troisième animal qu\'il n\'a pas voulu montrer. 
	Par contre, Eugène a demandé des renseignements pour trouver des cables très spécifiques.</p>
	<p class=\"quote\">\"Il y en a près de la grue Titan Jaune.\", vous confie le directeur.</p>
	',
	content_type = 'img',
	media = 'img/2/heron.jpg'
;
INSERT INTO Places
SET
	id=43,
	name = "L\'arbre à Basket",
	latitude = 47.20661,
	longitude = -1.565788,
	path_id = 2,
	places_on_open = "44",
	content = '<p class=\"tourisme\">Ces paniers sont praticables. L\'été des ballons sont mis à disposition.</p>',
	content_type = 'img',
	media = 'img/2/basket.jpg'
;
INSERT INTO Places
SET
	id=44,
	name = "Carrousel des Mondes Marins",
	latitude = 47.205914,
	longitude = -1.567735,
	path_id = 2,
	content = '<p class=\"tourisme\">Le carousel divertit autant les enfants que les plus agés.</p>',
	content_type = 'img',
	media = 'img/2/carousel.jpg'
;
INSERT INTO Places
SET
	id=50,
	name = "Grue Titan Jaune",
	latitude = 47.205093,
	longitude = -1.569776,
	path_id = 2,
	places_on_open = "45,48",
	content = '<p>Tu interroges un SDF qui semble prendre la grue pour abris. Ce dernier affirme avoir vu un homme fouiller les lieux à la recherche de cables. Quand ils les a trouvés, il aurait dit :</p>
	<p class=\"quote\">\"Avec ça, je n\'aurais aucun mal à l\'accrocher au musée Dobrée. Ca va être magnifique !\"</p>
	<p class=\"tourisme\">A proximité, vous pouvez voir deux ouevres artistiques : les Anneaux de Buuren (le long du quai au Sud) et la Résolution des Forces en Présence (la pomme de pin géante)</p>',
	content_type = 'img',
	media = 'img/2/art.jpg'
;

INSERT INTO Places
SET
	id=45,
	name = "Le Nautilus",
	latitude = 47.206618,
	longitude = -1.568132,
	path_id = 2,
	places_on_open = "46",
	content = '<p class=\"tourisme\">Depuis ce bar/restaurant, vous avez une belle vue sur le Maille Brezé, bateau qui sert de musée naval aujourd\'hui.</p>',
	content_type = 'img',
	media = 'img/2/breze.jpg'
;
INSERT INTO Places
SET
	id=46,
	name = "Le Pont Anne de Bretagne",
	latitude = 47.207773,
	longitude = -1.565605,
	path_id = 2,
	content = '<p class=\"tourisme\">Depuis le pont, tu as une vue imparable sur le quai de la fosse, aussi appelé quai de la fesse par les étudiants
	Tout comme l\'Île Faydeau, le sol du quai est très instable. Du coup, les constructions s\'affessent.
	(Je suppse que le surnom du quai vient de là ?)</p>',
	content_type = 'img',
	media = 'img/2/quaifosse.jpg',
	places_on_open = "51"
;
INSERT INTO Places
SET
	id=47,
	name = "Mémorial Abolition Esclavage",
	latitude = 47.209037,
	longitude = -1.566297,
	path_id = 2,
	content = '<p>Tu te souviens des paroles d\'Anne de Bretagne :</p>
	<p class=\"quote\">\"Tu trouveras une photo de l\'animal mytique que tu cherches au Mémorial d\'Abolition de l\'Esclavage. Pour la trouver, il faudra donner le nom de code du Maille Brezé.\" </p>',
	success_condition = 'password',
	success_key = 'd627',
	success_content = 'Bravo, voici la photo de l\'animal mytique.',
	objects_on_success = '28'
;
INSERT INTO Objects
SET
	id=28,
	name = 'Photo de l\'animal mytique',
	path_id = 2,
	content_type = "img",
	thumb = "img/2/mytique.jpg",
	media = "img/2/mytique.jpg",
	content = '<p>Evidemment, il ne fallait pas s\'attendre à de la haute définition...</p>';

INSERT INTO Places
SET
	id=51,
	name = "Eugène",
	latitude = 47.211411,
	longitude = -1.567275,
	path_id = 2,
	content = '<p>Vous marchez tranquillement vers le musée que soudain Nathan s\'écrie :</p>
	<p class=\"quote\">\"C\'est lui, c\'est Eugène ! Arrêtez-le !\"</p>
	<p>Un policier qui passait par là s\'execute après lui avoir expliqué l\'affaire.</p>
	<p>Mais quel est le nom de famille d\'Eugène ?</p>',
	content_type = 'img',
	media = 'img/2/eugene.jpg',
	success_condition = 'password',
	success_key = 'livet',
	success_content = '<p>Eugène Livet vous fait une confidence avant d\'être emmené :</p>
	<p class=\"quote\">\"L\'aventure vallait le coup. Je ne regrette rien.\"</p>
	<p>Par contre, Eugène a eu le temps de se débarrasser de l\'animal mytique. Il faut continuer à le chercher.</p>'
;

INSERT INTO Places
SET
	id=48,
	name = "Musée Dobrée",
	latitude = 47.212044,
	longitude = -1.565562,
	path_id = 2,
	content = '<p>L\'animal est caché là quelque part. Il faut le trouver.</p>
	<p>Quel est le deuxième mot inscrit sous l\'animal ?</p>',
	content_type = 'img',
	media = 'img/2/dobree.jpg',
	success_condition = 'password',
	success_media = 'img/2/dragon.jpg',
	success_content_type = 'img',
	success_content = 'Vous avez retrouvé le dragon. Bravo ! C\'est gagné :)',
	objects_on_success = -1,
	success_key = 'arogac'
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
	"Curieuse enseigne pour un sex shop, non ?",
	"img",
	"img/2/canard_soluce.jpg",
	2,
	"img",
	"img/2/canard_hint.jpg"
),
(
	9,
	"Chat asiatique",
	"img/2/animals.png",
	"A quel groupe de rock fait référence le costume de ce chat ?",
	"password",
	"indochine",
	"Clin d\'oeil humouristique de cette épicerie asiatique.",
	"img",
	"img/2/emocat_soluce.jpg",
	2,
	"img",
	"img/2/emocat_hint.jpg"
),
(
	10,
	"Cheval",
	"img/2/animals.png",
	"En quoi est déguisé ce cheval amateur de glaces ?",
	"password",
	"licorne",
	'Il ne s\'agit pas ici de l\'animal mytique que l\'on cherche depuis le début... mais d\'un simple cheval.',
	"img",
	"img/2/cheval_soluce.jpg",
	2,
	"text",
	""
),
(
	11,
	"Elephant",
	"img/2/animals.png",
	"Combien de parties possède la trompe de cet éléphant ?",
	"password",
	"11",
	'Cet éléphant est maintenant devenu le symbole de la ville. Un peu comme la Petite Sirène à Copenhague, c\'est une référence à un auteur local.',
	"img",
	"img/2/elephant_soluce.jpg",
	2,
	"img",
	"img/2/elephant_hint.png"
),
(
	12,
	"Hippocampe",
	"img/2/animals.png",
	"Dans quel manège se trouve cet hippocampe ?",
	"password",
	"andrea",
	"Il ne faut pas confondre ce manège avec le carrousel des mondes marins qui se situe un peu plus loin.",
	"img",
	"img/2/hippocampe.jpg",
	2,
	"img",
	"img/2/hippocampe.jpg"
),
(
	13,
	"Oie",
	"img/2/animals.png",
	"Par quoi a été remplacée la tête de ce volatile ?",
	"password",
	"fourchette",
	"Non, il n\'y a rien de sexuel dans cette double enseigne.",
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
	"A côté de quel autre animal ce trouve l'ours-enseigne ?",
	"password",
	"oie",
	"Non, il n\'y a rien de sexuel dans cette double enseigne.",
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
	"Lors de la dernière édition du voyage à Nantes (un festival annuel visant à mettre en valeur le patrimoine nantais), une vague d\'enseignes originales ont été créées. Leve les yeux :)",
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
	"Il a le poil soyeux ce yack, non ?",
	"img",
	"img/2/yack.jpg",
	2,
	"img",
	"img/2/yack.jpg"
),
(
	17,
	"Cigale",
	"img/2/animals.png",
	"Sur quel type de restaurant se trouve la cigale ?",
	"password",
	"brasserie",
	"Véritable institution à Nantes, la Cigale s\'est inspirée des plus belles brasseries parisiennes.",
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
	"Bien joué :)",
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
	"On remarquera que le restaurant possède d\'autres cochons sur sa devanture.",
	"img",
	"img/2/cochon.jpg",
	2,
	"img",
	"img/2/cochon.jpg"
),
(	20,
	"Tortue",
	"img/2/animals.png",
	"Quel est le premier mot sous l'enseigne de la tortue ?",
	"password",
	"expecto",
	"Exact ! Tu ne te laisses pas déconcenter par la maison à colombage voisine.",
	"img",
	"img/2/tortue_soluce.jpg",
	2,
	"img",
	"img/2/tortue_hint.jpg"
),
(	21,
	"Homard",
	"img/2/animals.png",
	"Que représente ce homard ? A la place de quoi est-il dessiné ?",
	"password",
	"cancer",
	"Effectivement, seule une partie des signes du zodiaques ont été représenté ici.",
	"img",
	"img/2/homard_hint.jpg",
	2,
	"img",
	"img/2/homard_hint.jpg"
),
(	22,
	"Lapin",
	"img/2/animals.png",
	"Sur quel magasin a été placé la lapin ?",
	"password",
	"boucherie",
	"On remarquera que le lapin n\'est pas le seul animal exposé par la boucherie.",
	"img",
	"img/2/lapin_hint.jpg",
	2,
	"img",
	"img/2/lapin_hint.jpg"
),
(	23,
	"Chat noir",
	"img/2/animals.png",
	"Quel cépage ce site dans la vitrine de ce chat ?",
	"password",
	"muscadet",
	"Nantes est très fière de son vignoble. Si le muscadet et le gros plan ne sont pas des cépages qui ont bonne réputation, je peux vous assurer qu\'il existe de nombreuses bouteilles qui valent le détour.",
	"img",
	"img/2/chatnoir_soluce.jpg",
	2,
	"img",
	"img/2/chatnoir_hint.jpg"
),
(	24,
	"Ver",
	"img/2/animals.png",
	"A la sortie de quel monument nantais peut-on voir ce ver ?",
	"password",
	"pommeraye",
	"Ce ver-mosaique est idéalement placé pour être vu.",
	"img",
	"img/2/ver.jpg",
	2,
	"img",
	"img/2/ver.jpg"
),
(	25,
	"Hermine",
	"img/2/animals.png",
	"Quel est le numéro situé entre les deux hermines ?",
	"password",
	"22",
	"L\'hermine est un symbole de la royauté et de la Bretagne. Nantes n\'est pas officiellement en Bretagne, mais beaucoup de nantais se revendiquent bretons.",
	"img",
	"img/2/hermine_soluce.jpg",
	2,
	"img",
	"img/2/hermine_hint.jpg"
)
;