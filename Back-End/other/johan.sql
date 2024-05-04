-- 0 : user
-- 1 : admin
CREATE  TABLE utilisateur_front_office (
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	mail                 VARCHAR(255)  NOT NULL     ,
	telephone            VARCHAR(20)  NOT NULL     ,
	avatar               VARCHAR(255)  NOT NULL     ,
	pseudo               VARCHAR(50)  NOT NULL     ,
	mdp                  VARCHAR(255)  NOT NULL     ,
	profile              INT  NOT NULL DEFAULT (0)
 ) engine=InnoDB;

CREATE TABLE tokens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    token VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES utilisateur_front_office(id)
) ENGINE=InnoDB;

