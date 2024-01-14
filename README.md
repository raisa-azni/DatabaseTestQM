# Program Description

### There are two agent-based programs in this branch. For this project, the main focus is on "DatabaseTestQM"
"QMSoftware" has also been included to show the change in implementation when we have a different database structure.

The program descriptions for each program are:

  - DatabaseTestQM

This program is built on a three-table database (database name "quizmasterUsers") structure, where we have one table to store the questions and their options called 'question'. This table has eight columns, such as questionID, categoryID, questionText, option1, option2, option3, option4, and correctAnswer.
   
   - QMSoftware

This program is built on a four-table database (database name "seng696") structure, where we have two tables to store the questions and their options, called 'questions' and 'options' respectively.

  - The table 'questions' has three columns such as id, text, and category_id
  - The table 'options' four columns such as id, is_correct, text, and question_id.

### How run the program "DatabaseTestQM"? ...

Step 1: Load the program "DatabaseTestQM"

   1. Clone the project files.
   2. Open the "DatabaseTestQM" project in a new window on the IDE. Preferably in the intellij IDEA.

Step 2: Loading the libraries
   
  1. Add all the libraries to the module of the project in intellij IDEA. 
  Setting -> Project Structure -> module -> Dependencies -> + -> all the .jar files (in the Libraries folder in the program files).
  2. Add the MySql.jar file and jade.jar file to the libraries in intellij IDEA.
  Setting -> Project Structure -> Libraries -> + 'New Project Library' -> add the MySql .jar file -> add the jade.jar file

Step 3: Handling the database

   1. Turn on the MySQL server.
   2. Make a new schema on the MySql workbench and import or copy-paste the query in the "DatabaseTestQM.sql" file. Run the query to generate tables.
   3. Make the necessary modifications (server link, username, password) to the DatabaseConnectionTest file and the database agent.

Step 4: Run the program

1. Go to Edit Configuration.
2. Give a program name. Preferably "DatabaseTestQM".
3. Add class name; write "jade.Boot".
4. Add the following arguments:
