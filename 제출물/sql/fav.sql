CREATE TABLE `fav` (
  `id` varchar(30) DEFAULT NULL COMMENT '아이디',
  `local` varchar(30) DEFAULT NULL COMMENT '시/도',
  `city` varchar(30) DEFAULT NULL COMMENT '구/군',
  `dong` varchar(30) DEFAULT NULL COMMENT '동'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci