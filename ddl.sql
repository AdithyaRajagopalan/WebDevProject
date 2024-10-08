CREATE TABLE `login_log` (
  `login_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `login_timestamp` timestamp NULL DEFAULT NULL,
  `logout_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`login_id`)

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` tinytext,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `regn_date` date DEFAULT NULL,
  `phone_number` int DEFAULT NULL,
  `password` tinytext,
  PRIMARY KEY (`user_id`)

  CREATE TABLE `membership` (
  `membership_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `membership_type_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `amount_paid` int DEFAULT NULL,
  PRIMARY KEY (`membership_id`)

   CREATE TABLE `user_booking` (
  `booking_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `slot_id` int DEFAULT NULL,
  PRIMARY KEY (`booking_id`)

  CREATE TABLE `slots` (
  `slot_id` int NOT NULL,
  `day` varchar(3) DEFAULT NULL,
  `slot_time` time DEFAULT NULL,
  `total_seats` int DEFAULT NULL,
  `available_seats` int DEFAULT NULL,
  PRIMARY KEY (`slot_id`)

  CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `slot_id` int DEFAULT NULL,
  PRIMARY KEY (`attendance_id`)

  CREATE TABLE `membership_lookup` (
  `membership_type_id` int NOT NULL,
  `membership_type` tinytext,
  `cost` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `coaching_included` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`membership_type_id`)

  CREATE TABLE `payment_transactions` (
  `transaction_id` int NOT NULL,
  `membership_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `transaction_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
