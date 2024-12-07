
# Create database script for Shelfie Spot

# Create the database
CREATE DATABASE IF NOT EXISTS shelfie_spot;
USE shelfie_spot;

# Create the tables
#CREATE TABLE IF NOT EXISTS books (id INT AUTO_INCREMENT,name VARCHAR(50),price DECIMAL(5, 2) unsigned,PRIMARY KEY(id));

# Create the app user
/*CREATE USER IF NOT EXISTS 'shelfie_spot_app'@'localhost' IDENTIFIED BY 'kjuertyultyp'; 
GRANT ALL PRIVILEGES ON shelfie_spot.* TO ' shelfie_spot_app'@'localhost'; */




/*CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    datecreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); */




CREATE TABLE `customers` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL, -- Foreign key to users table
  `email` VARCHAR(80) NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(40) NOT NULL,
  `address1` VARCHAR(80) NOT NULL,
  `address2` VARCHAR(80) DEFAULT NULL,
  `city` VARCHAR(60) NOT NULL,
  `post_code` MEDIUMINT(5) UNSIGNED ZEROFILL NOT NULL,
  `phone` CHAR(10) NOT NULL,
  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`), -- Ensures a 1-to-1 relationship
  CONSTRAINT `fk_customers_user_id` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
