CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL,
  `user_id` int NOT NULL,
  `slot_id` int NOT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `user_id` (`user_id`),
  KEY `slot_id` (`slot_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`slot_id`) REFERENCES `slots` (`slot_id`)
)

CREATE TABLE `login_log` (
  `login_id` int NOT NULL,
  `user_id` int NOT NULL,
  `login_timestamp` timestamp NOT NULL,
  `logout_timestamp` timestamp NOT NULL,
  PRIMARY KEY (`login_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
)

CREATE TABLE `membership` (
  `membership_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `membership_type_id` int NOT NULL,
  `start_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `is_active` char(1) NOT NULL,
  `amount_paid` int NOT NULL,
  PRIMARY KEY (`membership_id`),
  KEY `user_id` (`user_id`),
  KEY `membership_type_id` (`membership_type_id`),
  CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `membership_ibfk_2` FOREIGN KEY (`membership_type_id`) REFERENCES `membership_lookup` (`membership_type_id`)
)

CREATE TABLE `membership_lookup` (
  `membership_type_id` int NOT NULL,
  `membership_type` tinytext NOT NULL,
  `cost` int NOT NULL,
  `duration_months` int NOT NULL,
  `coaching_included` char(1) NOT NULL,
  PRIMARY KEY (`membership_type_id`)
)

CREATE TABLE `payment_transactions` (
  `transaction_id` int NOT NULL,
  `membership_id` int NOT NULL,
  `amount` int NOT NULL,
  `status` char(1) NOT NULL,
  `transaction_timestamp` timestamp NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `membership_id` (`membership_id`),
  CONSTRAINT `payment_transactions_ibfk_1` FOREIGN KEY (`membership_id`) REFERENCES `membership` (`membership_id`)
)

CREATE TABLE `slots` (
  `slot_id` int NOT NULL,
  `day` varchar(3) NOT NULL,
  `start_time` time NOT NULL,
  `total_seats` int NOT NULL,
  `available_seats` int NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`slot_id`)
)

CREATE TABLE `user_booking` (
  `booking_id` int NOT NULL,
  `user_id` int NOT NULL,
  `slot_id` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `slot_id` (`slot_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_booking_ibfk_1` FOREIGN KEY (`slot_id`) REFERENCES `slots` (`slot_id`),
  CONSTRAINT `user_booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
)

 CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` tinytext NOT NULL,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `regn_date` date NOT NULL,
  `phone_number` bigint DEFAULT NULL,
  `password` tinytext NOT NULL,
  PRIMARY KEY (`user_id`)
)

