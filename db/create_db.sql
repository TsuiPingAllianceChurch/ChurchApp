CREATE TABLE IF NOT EXISTS User(
    user_id INT AUTO_INCREMENT,
    name_en VARCHAR(255) NULL,
    `name_zh-hk` VARCHAR(255) NOT NULL,
    created_date DATETIME NOT NULL,
    PRIMARY KEY (user_id)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Fellowship (
    fellowship_id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_date DATETIME NOT NULL,
    PRIMARY KEY (fellowship_id)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Attendance (
    user_id INT NOT NULL,
    worship_id INT NOT NULL,
    created_date DATETIME NOT NULL
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Worship (
    worship_id INT AUTO_INCREMENT,
    data DATE NOT NULL,
    type VARCHAR(255) NOT NULL,
    remark TEXT NOT NULL,
    created_date DATETIME NOT NULL,
    PRIMARY KEY (worship_id)
)  ENGINE=INNODB;

ALTER TABLE Fellowship ADD FOREIGN KEY (user_id)
REFERENCES User(user_id);

ALTER TABLE Attendance ADD FOREIGN KEY (user_id)
REFERENCES User(user_id);

ALTER TABLE Attendance ADD FOREIGN KEY (worship_id)
REFERENCES Worship(worship_id);
