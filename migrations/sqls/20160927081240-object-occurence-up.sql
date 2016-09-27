ALTER TABLE Objects
ADD COLUMN occurence SMALLINT UNSIGNED NOT NULL DEFAULT 1;

UPDATE Objects
SET occurence=3,
success_content = "Une fois tous les morceaux récoltés, tu peux reconstituer la lettre.",
success_content_type = "img",
success_media = "img/1/lettre_proprio.jpg",
content_type = "img",
media = "img/1/lettre_proprio_thumb.jpg",
content = "Il s'agit d'une lettre déchirée.",
places_on_open = NULL,
places_on_success = "5,7",
success_condition = "occurence"
WHERE id=6;

UPDATE Places
SET objects_on_open="2,6"
WHERE id=1;

UPDATE Places
SET objects_on_success="3,6"
WHERE id=2;