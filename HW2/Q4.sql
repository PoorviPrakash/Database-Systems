--livesql (https://livesql.oracle.com/)

--Creating a table with the following attributes - classId, ClassName, Number of students in the class, InstructorId, InstructorName
--Instructors hourly rate and their respective bonuses. Here the combination the classId and Instructor will always be unique as we need only one
--enter of an instructor teaching a class. Thus ClassId and InstructorId together form a composite primary key.
--The bonus earned  by the instructor is automatically calculated in the bonus column using the formula defined consisting of hourly rate and Number of students
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
INSERT INTO Teaches(ClassId, ClassName, NumStudents, InstructorId, InstructorName, HourlyRate) VALUES (106,'Python',23,234671,'Patty Skit',55);

SELECT * FROM Teaches;

--Here I'm creating another table to store InstructorName and their total bonus from all the classes they teach. For instance in my table
--instructor Patty teaches class 105 and 106. Her bonus from each of those classes are 148.5 and 126.5 respectively. So my OverAllBonus table will store
--the total bonus amount earned by her by summing all of them. So Patty in OverAllBonus table will have the value of 275.
CREATE TABLE OverAllBonus AS (SELECT InstructorName, sum(BONUS) AS Bonus FROM Teaches GROUP BY InstructorName);
SELECT * FROM OverAllBonus;

--Here I'm using a select query which fetches the details of those instructors who have the bonus same as the maximum bonus from the OverAllBonus table. To get the maximum bonus from the bonus column
--I'm using the max() aggregate function. This function returns a single maximum value from the bonus column.
SELECT Bonus FROM OverAllBonus WHERE Bonus IN (SELECT MAX(BONUS) FROM OverAllBonus);
