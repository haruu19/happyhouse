CREATE TABLE `notice` (
  `isbn` int NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `views` int DEFAULT '0',
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci