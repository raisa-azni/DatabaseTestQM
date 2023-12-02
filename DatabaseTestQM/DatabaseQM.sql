create database quizmasterUsers;  
use quizmasterUsers;  
create table user(username varchar(40), email varchar(40), phoneNumber int(10),password int(8));  

SELECT * FROM user;

create table categories(serialNumber int(10) PRIMARY KEY, categoryName varchar(40));

INSERT INTO categories (serialNumber, categoryName) VALUES (1, 'Biology');
INSERT INTO categories (serialNumber, categoryName) VALUES (2, 'Chemistry');
INSERT INTO categories (serialNumber, categoryName) VALUES (3, 'English');
INSERT INTO categories (serialNumber, categoryName) VALUES (4, 'Physics');
INSERT INTO categories (serialNumber, categoryName) VALUES (5, 'Religion');

SELECT * FROM categories;

create table question (questionID int(10) PRIMARY KEY, categoryID int(10), questionText varchar(1000), option1 varchar(1000), option2 varchar(1000), option3 varchar(1000), option4 varchar(1000), correctAnswer varchar(1000));

INSERT INTO question(questionID, categoryID, questionText, option1, option2, option3, option4, correctAnswer) VALUES (1, 1, 'What is the primary function of DNA in living organisms?');
INSERT INTO question(questionID, categoryID, questionText) VALUES (2, 1, 'Define photosynthesis and identify the key components involved in this process.');
INSERT INTO question(questionID, categoryID, questionText) VALUES (3, 1, 'Explain the difference between prokaryotic and eukaryotic cells.');
INSERT INTO question(questionID, categoryID, questionText) VALUES (4, 1, 'What role does the mitochondria play in cellular function?');
INSERT INTO question(questionID, categoryID, questionText) VALUES (5, 1, 'How does natural selection contribute to the process of evolution?');

INSERT INTO question(questionID, categoryID, questionText) VALUES (6, 2, 'Which gas makes up the majority of Earthes atmosphere?');
INSERT INTO question(questionID, categoryID, questionText) VALUES (7, 2, 'Define photosynthesis and identify the key components involved in this process.');
INSERT INTO question(questionID, categoryID, questionText) VALUES (8, 2, 'What is the chemical symbol for gold?');
INSERT INTO question(questionID, categoryID, questionText) VALUES (9, 2, 'In a neutral solution, what is the pH level?');
INSERT INTO question(questionID, categoryID, questionText) VALUES (10, 2, 'Which subatomic particle carries a negative charge?');

CREATE TABLE options (
    optionID INT(10) PRIMARY KEY,
    questionID INT(10),
    optionText VARCHAR(1000),
    isCorrect BOOLEAN,
    FOREIGN KEY (questionID) REFERENCES question(questionID)
);

SELECT * FROM options;

INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (0, 101, 'Energy production', 0);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (1, 101, 'Cellular respiration', 0);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (2, 101, 'Genetic information storage', 1);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (3, 101, 'Protein synthesis', 0);

INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (4, 2, 'Oxygen consumption', 0);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (5, 2, 'Sugar breakdown', 0);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (6, 2, 'Sunlight absorption', 0);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (7, 2, 'Conversion of sunlight into chemical energy', 1);

INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (8, 3, 'Both lack a nucleus', 0);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (9, 3, 'Prokaryotic cells have a nucleus, while eukaryotic cells dont', 1);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (10, 3, 'Eukaryotic cells have a nucleus, while prokaryotic cells dont', 0);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (11, 3, 'Both contain membrane-bound organelles', 0);

INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (12, 4, 'Photosynthesis', 0);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (13, 4, 'Cellular respiration and energy production', 1);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (14, 4, 'DNA replication', 0);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (15, 4, 'Protein synthesis', 0);

INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (16, 5, 'Random genetic mutations', 0);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (17, 5, 'Environmental changes', 0);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (18, 5, 'Selective advantage leading to increased survival and reproduction', 1);
INSERT INTO options(optionID, questionID, optionText, isCorrect) VALUES (19, 5, 'Artificial selection by humans', 0);

SELECT * FROM options;