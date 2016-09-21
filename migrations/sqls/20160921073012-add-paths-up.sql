DROP TABLE IF EXISTS Tags;

CREATE TABLE Tags (
  id smallint unsigned NOT NULL AUTO_INCREMENT,
  name varchar(40) NOT NULL,
  parent smallint unsigned DEFAULT NULL,
  user int unsigned DEFAULT NULL,
  PRIMARY KEY (id)
) CHARSET=utf8;

LOCK TABLES Tags WRITE;
INSERT INTO Tags VALUES (1,'test migration',0,NULL),(2,'Sports',0,NULL),(3,'Education',0,NULL),(4,'Associations',0,NULL),(5,'Hoobies',0,NULL),(6,'Alenty',1,NULL),(7,'Beansight',1,NULL),(8,'Adikteev',1,NULL),(9,'Basketball',2,NULL),(10,'Tennis',2,NULL),(11,'Skiing',2,NULL),(12,'Henri IV',3,NULL),(13,'Centrale Lyon',3,NULL),(14,'Duke University',3,NULL),(15,'LeCJE',4,NULL),(16,'Improv',5,NULL);
UNLOCK TABLES;

