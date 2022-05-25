--livesql (https://livesql.oracle.com/)

--Creating a table with the following attributes - classId, ClassName, Numberr of students in the class, InstructorId, InstructorName
--Instructors hourly rate and their respective bonuses. Here the combination the classId and Instructor will always be unique as we need to only 
--enter the value of an instructor teaching a class only once. Thus ClassId and InstructorId together form a composite primary key.
--The bonus earned  by the instructor is automatically calculate in the bonus column using the formula defined consisting on hourly rate and Number of students
--in the class.

CREATE TABLE Teaches(
ClassId INTEGER,
ClassName CHAR(50) NOT NULL,
NumStudents INTEGER NOT NULL,
InstructorId INTEGER,
InstructorName CHAR(50) NOT NULL,
HourlyRate INTEGER NOT NULL,
Bonus NUMERIC(10,2) as (HourlyRate * NumStudents * 0.1),
PRIMARY KEY(ClassId, InstructorId)
);

-- Entering rows of data into the table containing the instructor and class attributes
INSERT INTO Teaches(ClassId, ClassName, NumStudents, InstructorId, InstructorName, HourlyRate) VALUES (101,'Processing',25,255567,'James Scott',55);
INSERT INTO Teaches(ClassId, ClassName, NumStudents, InstructorId, InstructorName, HourlyRate) VALUES (101,'Processing',25,764536,'Natasha Simons',53);
INSERT INTO Teaches(ClassId, ClassName, NumStudents, InstructorId, InstructorName, HourlyRate) VALUES (102,'Python',55,783645,'George Hudson',47);
INSERT INTO Teaches(ClassId, ClassName, NumStudents, InstructorId, InstructorName, HourlyRate) VALUES (103,'Scratch',13,647385,'Hannah Rodgers',58);
INSERT INTO Teaches(ClassId, ClassName, NumStudents, InstructorId, InstructorName, HourlyRate) VALUES (103,'Scratch',13,928334,'Kate Ivory',33);
INSERT INTO Teaches(ClassId, ClassName, NumStudents, InstructorId, InstructorName, HourlyRate) VALUES (104,'Java',35,213647,'Robert Mash',27);
INSERT INTO Teaches(ClassId, ClassName, NumStudents, InstructorId, InstructorName, HourlyRate) VALUES (104,'Java',35,283953,'Franklin Kite',46);
INSERT INTO Teaches(ClassId, ClassName, NumStudents, InstructorId, InstructorName, HourlyRate) VALUES (105,'JavaScript',27,234671,'Patty Skit',55);

SELECT * FROM Teaches;

--Here I'm using a select query which fetches the details of those instructors who have the bonus same as the maximum bonus of the table. The query is 
--is designed in such a way that if multiple instructors have the same maximum bonus, each of them will be queried. To get the maximum bonus from the bonus column
--I'm using the max() aggregate function. This function returns a single maximum value from the column
SELECT * FROM Teaches WHERE Bonus IN (SELECT MAX(BONUS) FROM TEACHES);

