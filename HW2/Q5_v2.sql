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
