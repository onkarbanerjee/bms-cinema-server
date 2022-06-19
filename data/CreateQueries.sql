CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `cinemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `cityID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cinemas_relation_1` (`cityID`),
  CONSTRAINT `cinemas_relation_1` FOREIGN KEY (`cityID`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `screens` (
  `id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cinemaID` int DEFAULT NULL,
  `screenNumber` int DEFAULT NULL,
  UNIQUE KEY `screens_index_1` (`id`,`cinemaID`),
  KEY `screens_relation_1` (`cinemaID`),
  CONSTRAINT `screens_relation_1` FOREIGN KEY (`cinemaID`) REFERENCES `cinemas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `shows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `screenID` int DEFAULT NULL,
  `movieID` int DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shows_relation_2` (`movieID`),
  KEY `shows_relation_3` (`screenID`),
  CONSTRAINT `shows_relation_2` FOREIGN KEY (`movieID`) REFERENCES `movies` (`id`),
  CONSTRAINT `shows_relation_3` FOREIGN KEY (`screenID`) REFERENCES `screens` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `seats` (
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `row` varchar(255) DEFAULT NULL,
  `column` int DEFAULT NULL,
  `screenID` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  KEY `seats_relation_2` (`screenID`),
  CONSTRAINT `seats_relation_2` FOREIGN KEY (`screenID`) REFERENCES `screens` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

