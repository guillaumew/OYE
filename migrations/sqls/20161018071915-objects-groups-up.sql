/* Replace with your SQL commands */

UPDATE Objects
SET
	media = "8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25",
	content_type = "group"
WHERE id = 7;

UPDATE Places
SET content = '<p>Les traces traversent la place en direction de la basilique.</p>
	<p>Mais la femme au milieu de la fontaine se met à parler.</p>
	<p class=\"quote\">\"Le coffre que tu cherches contient les restes d\'un animal légendaire. Trouve les derniers de mes affluents et je te dirai lequel.\"</p>
	<p>Voilà une enigme bien mystérieuse... une petite explication en vidéo :</p>',
	success_content = '<p>La statue sourit : </p>
	<p>\"Bien joué, détective ! L\'animal mythique que tu cherches est un dragon.\"</p>'
WHERE id = 17;