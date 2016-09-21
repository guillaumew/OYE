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
	latitude DECIMAL(10) NOT NULL,
	longitude DECIMAL(10) NOT NULL,
	give_objects varchar(20) DEFAULT NULL,
	open_places varchar(20) DEFAULT NULL,
	content text DEFAULT NULL,
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
	content_type varchar(10) NOT NULL,
	path_id int unsigned,
	PRIMARY KEY (id),
	CONSTRAINT object_path 
		FOREIGN KEY (path_id)
		REFERENCES Paths(id) 
) ENGINE=InnoDB CHARSET=utf8;