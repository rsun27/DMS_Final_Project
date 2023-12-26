#
# TABLE STRUCTURE FOR: SHIPPING_PROVIDER
#

DROP TABLE IF EXISTS `SHIPPING_PROVIDER`;

CREATE TABLE `SHIPPING_PROVIDER` (
  `Provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Contact_name` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `SHIPPING_PROVIDER` (`Provider_id`, `Name`, `Contact_name`, `Phone`) VALUES (1, 'Predovic-Lang', 'Justus Schroeder', '04392583067');
INSERT INTO `SHIPPING_PROVIDER` (`Provider_id`, `Name`, `Contact_name`, `Phone`) VALUES (2, 'Donnelly-Waelchi', 'Jammie Turner', '1-973-119-6345x2504');
INSERT INTO `SHIPPING_PROVIDER` (`Provider_id`, `Name`, `Contact_name`, `Phone`) VALUES (3, 'Nolan-Corwin', 'Dr. Omer Schultz DDS', '(157)287-9053');
INSERT INTO `SHIPPING_PROVIDER` (`Provider_id`, `Name`, `Contact_name`, `Phone`) VALUES (4, 'Wyman and Sons', 'Wilford Botsford', '1-854-421-5751x863');


