ALTER TABLE Objects
DROP occurence;

UPDATE Places
SET objects_on_open="2"
WHERE id=1;

UPDATE Places
SET objects_on_success="3"
WHERE id=2;