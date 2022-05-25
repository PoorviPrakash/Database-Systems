--livesql (https://livesql.oracle.com/)

--This version I'm hard coding the subject names in my query

-- Creating the job candidates table 
-- Here I'm considering instructor id primary key as it serves our purpose of uniquely identifying each candidate.  
CREATE TABLE JobCandidates( 
InstructorId INTEGER,
InstructorName CHAR(50) NOT NULL, 
Subject CHAR(50) NOT NULL, 
PRIMARY KEY (InstructorId));

-- Inserting rows into the job candidates table 
INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(1,'Aleph','Scratch');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(2,'Aleph','Java');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(3,'Aleph','Processing');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(4,'Bit','Python');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(5,'Bit','JavaScript');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(6,'Bit','Java');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(7,'CRC','Python');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(8,'CRC','JavaScript');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(9,'Dat','Scratch');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(10,'Dat','Python');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(11,'Dat','JavaScript');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(12,'Emscr','Scratch');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(13,'Emscr','Processing');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(14,'Emscr','JavaScript');

INSERT INTO JobCandidates(InstructorId, InstructorName, Subject) VALUES(15,'Emscr','Python');


-- Creating Class List table to hold list of classes taught by the org
-- Here I'm using ClassId as a primary key to ensure that every class has a different Id to access it
CREATE TABLE ClassList( 
ClassId INTEGER, 
Subject CHAR(50) NOT NULL, 
PRIMARY KEY (ClassId));

-- Inserting rows into the ClassList tables

INSERT INTO ClassList(ClassId, Subject) VALUES(1,'JavaScript');

INSERT INTO ClassList(ClassId, Subject) VALUES(2,'Scratch');

INSERT INTO ClassList(ClassId, Subject) VALUES(3,'Python');


SELECT * FROM JobCandidates;

SELECT * FROM ClassList;

-- Here I'm using the INTERSECT sql DML command to get the common instructor names obtained from the 3 different select queries. The first select query fetches
-- names of instructors who teach JavaScript. We intersect(find common names) it with the second select query where we are fetching names of instructors who teach
-- Scratch. We again intersect the rows obtained from the last intersect with the third select query where we are fetching the names of the instructors who teach Python.
-- Thus in this way we are able to get the common names of instructors who teach JavaScript, Scratch and Python. This is a query with hardcoded values of the subjects from the ClassList table. 
SELECT INSTRUCTORNAME FROM JobCandidates WHERE SUBJECT = 'JavaScript' INTERSECT SELECT INSTRUCTORNAME FROM JobCandidates WHERE SUBJECT = 'Scratch' INTERSECT SELECT INSTRUCTORNAME FROM JobCandidates WHERE SUBJECT = 'Python';
