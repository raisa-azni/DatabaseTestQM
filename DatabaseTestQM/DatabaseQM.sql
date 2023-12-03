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

create table question (questionID int(10) PRIMARY KEY, categoryID int(10), questionText varchar(1000), option1 varchar(1000), option2 varchar(1000), option3 varchar(1000), option4 varchar(1000), correctAnswer int(10));


INSERT INTO question(questionID, categoryID, questionText, option1, option2, option3, option4, correctAnswer) VALUES (1, 1, 'What is the primary function of DNA in living organisms?', 'Energy production', 'Cellular respiration','Genetic information storage','Protein synthesis', 3);
INSERT INTO question(questionID, categoryID, questionText, option1, option2, option3, option4, correctAnswer) VALUES (2, 1, 'Define photosynthesis and identify the key components involved in this process.', 'Oxygen consumption', 'Sugar breakdown','Sunlight absorption','Conversion of sunlight into chemical energy', 4);
INSERT INTO question(questionID, categoryID, questionText, option1, option2, option3, option4, correctAnswer) VALUES (3, 1, 'Explain the difference between prokaryotic and eukaryotic cells.', 'Both lack a nucleus', 'Prokaryotic cells have a nucleus, while eukaryotic cells dont','Eukaryotic cells have a nucleus, while prokaryotic cells dont','Both contain membrane-bound organelles', 2);
INSERT INTO question(questionID, categoryID, questionText, option1, option2, option3, option4, correctAnswer) VALUES (4, 1, 'What role does the mitochondria play in cellular function?', 'Photosynthesis', 'Cellular respiration and energy production','DNA replication','Protein synthesis', 2);
INSERT INTO question(questionID, categoryID, questionText, option1, option2, option3, option4, correctAnswer) VALUES (5, 1, 'How does natural selection contribute to the process of evolution?', 'Random genetic mutations', 'Environmental changes','Selective advantage leading to increased survival and reproduction ','Artificial selection by humans', 3);

INSERT INTO question(questionID, categoryID, questionText, option1, option2, option3, option4, correctAnswer) VALUES (6, 2, 'Chemistry Question 1?', 'Energy production', 'Cellular respiration','Genetic information storage','Protein synthesis', 3);
INSERT INTO question(questionID, categoryID, questionText, option1, option2, option3, option4, correctAnswer) VALUES (7, 2, 'Chemistry Question 2?', 'Oxygen consumption', 'Sugar breakdown','Sunlight absorption','Conversion of sunlight into chemical energy', 4);
INSERT INTO question(questionID, categoryID, questionText, option1, option2, option3, option4, correctAnswer) VALUES (8, 2, 'Chemistry Question 3?', 'Both lack a nucleus', 'Prokaryotic cells have a nucleus, while eukaryotic cells dont','Eukaryotic cells have a nucleus, while prokaryotic cells dont','Both contain membrane-bound organelles', 2);
INSERT INTO question(questionID, categoryID, questionText, option1, option2, option3, option4, correctAnswer) VALUES (9, 2, 'Chemistry Question 4?', 'Photosynthesis', 'Cellular respiration and energy production','DNA replication','Protein synthesis', 2);
INSERT INTO question(questionID, categoryID, questionText, option1, option2, option3, option4, correctAnswer) VALUES (10, 2, 'Chemistry Question 5?', 'Random genetic mutations', 'Environmental changes','Selective advantage leading to increased survival and reproduction ','Artificial selection by humans', 3);

SELECT * FROM question;