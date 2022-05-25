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

-- Here I'm using the INTERSECT sql DML command to get the common instructor names obtained from the 3 different select queries. The first select query fetches
-- names of instructors who teach JavaScript. We intersect(find common names) it with the second select query where we are fetching names of instructors who teach
-- Scratch. We again intersect the rows obtained from the last intersect with the third select query where we are fetching the names of the instructors who teach Python.
-- Thus in this way we are able to get the common names of instructors who teach JavaScript, Scratch and Python. This is a query with hardcoded values of the subjects from the ClassList table. 
SELECT INSTRUCTORNAME FROM JobCandidates WHERE SUBJECT = 'JavaScript' INTERSECT SELECT INSTRUCTORNAME FROM JobCandidates WHERE SUBJECT = 'Scratch' INTERSECT SELECT INSTRUCTORNAME FROM JobCandidates WHERE SUBJECT = 'Python';

-- In this version, first we filter out only those instructors who teach one or more subjects from the classList. This can be done using a where clause. If a particular instructor teaches all the subjects present in the classList, then on grouping the 
-- Candidate table based on the instructor name and counting all the subjects from the classList taught by the instructor we can compare their counts. Thus on filtering if an instructor teaches 3 subjects and the total number of subjects in the classList 
-- is 3, then we can select the candidate as he/she satisfies our criteria. Here I'm using GROUP BY to group the instructors and count the number of subjects they teach. For count I'm using the COUNT() aggregate function. Having clause is then used to check
-- if the number of subjects in the classList is equal to the number of subjects taught by this instructor.
SELECT INSTRUCTORNAME FROM JobCandidates WHERE SUBJECT IN (SELECT SUBJECT FROM CLassList) GROUP BY INSTRUCTORNAME HAVING COUNT(INSTRUCTORNAME)=(SELECT COUNT(*) FROM ClassList);

-- In this version of the query, Can be broken down into 3 main Operations. First operation is that I'm cross joining the tables JobCandidates and ClassList. By cross joining we are multiplying every row from table with every rows of the
-- other table. Thus cross join is helping us get the product of the tables. Since my table 1(JobCandidates) has 15 entries and table 2(ClassList) has 3 entries, the resulting table would have 15*3 = 45 enteries. 
-- The second main operation we are doing is subtracting the resulting table with our JobCandidates table. When we do this we get a list of all the instructors who are not teaching one or more of the subjects present in the ClassList. Thus each row
-- in the resultant table of the second operation will be the instructor name and the subject that is there in the ClassList but is NOT taught by them. We can get such a list by using the MINUS operatoe. Thus we now have the list of instructors who don't satisfy our criteria.
-- What we need are list of instructors who satisfy our condition which is just a complement of our resultant table. To get the complement list we subtract these instructors with the complete list of instructors who applied for the job. That is what we are doing in the third step. We again subtracting
-- the resultant table from the original JobCandidates table and picking out all the different instructors who teach all the subjects in the ClassList.
select distinct InstructorName from JobCandidates 
minus 
select InstructorName from ( 
    select j.InstructorName, c.Subject from JobCandidates j CROSS JOIN ClassList c
    minus 
    select InstructorName, Subject from JobCandidates 
) 
