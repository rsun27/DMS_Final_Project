#
# TABLE STRUCTURE FOR: DEPARTMENT
#

DROP TABLE IF EXISTS `DEPARTMENT`;

CREATE TABLE `DEPARTMENT` (
  `Department_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Phone_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `DEPARTMENT` (`Department_id`, `Name`, `Phone_number`) VALUES (1, ' Marketing', '046.478.3374');
INSERT INTO `DEPARTMENT` (`Department_id`, `Name`, `Phone_number`) VALUES (2, ' Customer Services', '1-406-300-2032x3325');
INSERT INTO `DEPARTMENT` (`Department_id`, `Name`, `Phone_number`) VALUES (3, ' Management', '+94(5)7916521495');
INSERT INTO `DEPARTMENT` (`Department_id`, `Name`, `Phone_number`) VALUES (4, 'Sales', '711.137.1219x42766');
INSERT INTO `DEPARTMENT` (`Department_id`, `Name`, `Phone_number`) VALUES (5, ' Engineering', '107-440-3151');


