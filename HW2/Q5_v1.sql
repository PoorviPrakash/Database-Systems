--livesql (https://livesql.oracle.com/)

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

-- In this version, first we filter out only those instructors who teach one or more subjects from the classList. This can be done using a where clause. If a particular instructor teaches all the subjects present in the classList, then on grouping the 
-- Candidate table based on the instructor name and counting all the subjects from the classList taught by the instructor we can compare their counts. Thus on filtering if an instructor teaches 3 subjects and the total number of subjects in the classList 
-- is 3, then we can select the candidate as he/she satisfies our criteria. Here I'm using GROUP BY to group the instructors and count the number of subjects they teach. For count I'm using the COUNT() aggregate function. Having clause is then used to check
-- if the number of subjects in the classList is equal to the number of subjects taught by this instructor.
SELECT INSTRUCTORNAME FROM JobCandidates WHERE SUBJECT IN (SELECT SUBJECT FROM CLassList) GROUP BY INSTRUCTORNAME HAVING COUNT(INSTRUCTORNAME)=(SELECT COUNT(*) FROM ClassList);
