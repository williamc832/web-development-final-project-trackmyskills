CREATE DATABASE trackmyskills;

USE trackmyskills;

CREATE TABLE users (
	user_id INT PRIMARY KEY,
	username VARCHAR(100),
	email VARCHAR(100),
    `password` VARCHAR(255),
    `name` VARCHAR(100),
    `resume` BLOB
);

CREATE TABLE uploads (
	upload_id INT PRIMARY KEY,
    user_id INT,
	`name` VARCHAR(100),
	content BLOB,
    CONSTRAINT fk_uploads_users FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE skills (
	skill_id INT PRIMARY KEY,
	`name` VARCHAR(100),
    `description` VARCHAR(100)
);

CREATE TABLE user_skills (
	user_id INT,
    skill_id INT,
    progress VARCHAR(100),
    CONSTRAINT fk_user_skills_users FOREIGN KEY (user_id) REFERENCES users (user_id),
    CONSTRAINT fk_user_skills_skills FOREIGN KEY (skill_id) REFERENCES skills (skill_id),
	PRIMARY KEY (user_id, skill_id), # When searching by user
    INDEX (skill_id, user_id) # When searching by skill
);
