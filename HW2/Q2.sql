--livesql (https://livesql.oracle.com/)

--Creating an EnrollmentTable that stores students and the classes the student has enrolled in and their respective grades in the subject.
--Here StudentId and ClassName will be a unique combination as the enrollment of a student to a class needs to be listed only once. Thus the 
--combination of the StudentId and ClassName form a composite primary key
CREATE TABLE EnrollmentTable(
StudentId INTEGER NOT NULL,
ClassName CHAR(50) NOT NULL,
Grade CHAR(1) NOT NULL,
PRIMARY KEY(StudentId,ClassName)
);

--Inserting data into the columns
INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (123,'Processing','A');

INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (123,'Python','B');

INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (123,'Scratch','B');

INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (662,'Java','B');

INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (662,'Python','A');

INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (662,'JavaScript','A');

INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (662,'Scratch','B');

INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (345,'Scratch','A');

INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (345,'JavaScript','B');

INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (345,'Python','A');

INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (555,'Python','B');

INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (555,'JavaScript','B');

INSERT INTO EnrollmentTable(StudentId, ClassName, Grade) VALUES (213,'JavaScript','A');

SELECT * FROM EnrollmentTable;

--In this query I'm using the GROUP BY command to group all the students according to the classes they were enrolled into. 
--Using this group by I'm counting the total number of students in each class using the COUNT() aggregate function. 
--This is further sorted using the ORDER BY command that sorts the rows based on it's count in ascending order.
--To counter this we specify the Keyword 'DESC' to order the rows based on the count in descending(Reverse) order.
SELECT ClassName, COUNT(*) FROM EnrollmentTable GROUP BY ClassName ORDER BY COUNT(*) DESC;

