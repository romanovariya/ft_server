
CREATE DATABASE my_database;
CREATE USER 'mbabette'@'localhost' IDENTIFIED BY 'mbabette';
GRANT ALL PRIVILEGES ON my_database.* TO 'mbabette'@'localhost';
FLUSH PRIVILEGES;