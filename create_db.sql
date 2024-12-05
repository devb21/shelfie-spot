
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

