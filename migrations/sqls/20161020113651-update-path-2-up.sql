/* Replace with your SQL commands */

UPDATE Places
SET
	content_type = "youtube",
	media = "ee47QFwm6S8"
WHERE
	id = 13;

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
	29,
	"Serpent",
	"img/2/serpent_thumb.jpg",
	"La tête de ce serpent est dirigée vers de petits animaux multicolores. Combien sont-ils ?",
	"password",
	"3",
	"Comment nommeriez-vous ces petites créatures ?",
	"img",
	"img/2/serpent_soluce.jpg",
	2,
	"img",
	"img/2/serpent_hint.jpg"
);

UPDATE Places
SET media ="A9eo9HmdVso"
WHERE id = 17;

UPDATE Objects
SET
	media = "8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,29"
WHERE id = 7;