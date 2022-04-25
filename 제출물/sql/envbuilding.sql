CREATE TABLE `envbuilding` (
  `buildingName` varchar(45) NOT NULL,
  `num` varchar(45) DEFAULT NULL,
  `code` int DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `inspectionDate` varchar(45) DEFAULT NULL,
  `inspectionInstitution` varchar(45) DEFAULT NULL,
  `inspectionType` varchar(45) DEFAULT NULL,
  `disposal` varchar(45) DEFAULT NULL,
  `inspeciton` varchar(45) DEFAULT NULL,
  `inspectionResult` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`buildingName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci