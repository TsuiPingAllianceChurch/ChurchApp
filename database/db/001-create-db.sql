DROP SCHEMA IF EXISTS tpac_db;
CREATE SCHEMA tpac_db;
USE tpac_db;

CREATE TABLE IF NOT EXISTS User (
    user_id INT AUTO_INCREMENT,
    name_en VARCHAR(255) NULL,
    `name_zh-hk` VARCHAR(255) NOT NULL,
    gender VARCHAR(10) NULL,
    phone_country VARCHAR(5) NULL,
    phone VARCHAR(20) NULL,
    avator TEXT NULL,
    created_date DATETIME NOT NULL,
    PRIMARY KEY (user_id)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS `Group` (
    group_id INT AUTO_INCREMENT,
    type VARCHAR(255) NOT NULL,
    name_en VARCHAR(255) NOT NULL,
    `name_zh-hk` VARCHAR(255) NOT NULL,
    created_date DATETIME NOT NULL,
    PRIMARY KEY (group_id)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Group_Member (
    group_id INT NOT NULL,
    user_id INT NOT NULL,
    group_seq_num INT NULL,
    created_date DATETIME NOT NULL
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Attendance (
    attendance_id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    worship_id INT NOT NULL,
    created_date DATETIME NOT NULL,
    PRIMARY KEY (attendance_id)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Worship (
    worship_id INT AUTO_INCREMENT,
    date DATE NOT NULL,
    type VARCHAR(255) NOT NULL,
    remark TEXT NOT NULL,
    created_date DATETIME NOT NULL,
    PRIMARY KEY (worship_id)
)  ENGINE=INNODB;

ALTER TABLE `Group_Member` ADD FOREIGN KEY (group_id)
REFERENCES `Group`(group_id);

ALTER TABLE `Group_Member` ADD FOREIGN KEY (user_id)
REFERENCES User(user_id);

ALTER TABLE Attendance ADD FOREIGN KEY (user_id)
REFERENCES User(user_id);

ALTER TABLE Attendance ADD FOREIGN KEY (worship_id)
REFERENCES Worship(worship_id);
