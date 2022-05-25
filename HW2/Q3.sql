--livesql (https://livesql.oracle.com/)

--Creating a table called ProjectStatus that stores the progress of all the teams according to the steps completed. Table created
--according to the table definition provided
CREATE TABLE ProjectStatus(
ProjectId CHAR(4) NOT NULL,
Step INTEGER NOT NULL,
Status CHAR(1) NOT NULL,
PRIMARY KEY(ProjectId,Step)
);

--Loading data into the table.
INSERT INTO ProjectStatus(ProjectId, Step, Status) VALUES ('P100',0,'C');

INSERT INTO ProjectStatus(ProjectId, Step, Status) VALUES ('P100',1,'W');

INSERT INTO ProjectStatus(ProjectId, Step, Status) VALUES ('P100',2,'W');

INSERT INTO ProjectStatus(ProjectId, Step, Status) VALUES ('P201',0,'C');

INSERT INTO ProjectStatus(ProjectId, Step, Status) VALUES ('P201',1,'C');

INSERT INTO ProjectStatus(ProjectId, Step, Status) VALUES ('P333',0,'W');

INSERT INTO ProjectStatus(ProjectId, Step, Status) VALUES ('P333',1,'W');

INSERT INTO ProjectStatus(ProjectId, Step, Status) VALUES ('P333',2,'W');

INSERT INTO ProjectStatus(ProjectId, Step, Status) VALUES ('P333',3,'W');

INSERT INTO ProjectStatus(ProjectId, Step, Status) VALUES ('P434',0,'C');

INSERT INTO ProjectStatus(ProjectId, Step, Status) VALUES ('P434',1,'W');

INSERT INTO ProjectStatus(ProjectId, Step, Status) VALUES ('P434',2,'W');

SELECT * FROM ProjectStatus;

--I'm using subqueries to get the names of such teams. First I'm quering out all the rows that don't have even step 0 marked as 'W'. 
--Then I using another query to fetch all the teams that have the remaining steps as 'W' and are not the same teams that were returned 
--from the subquery. This way it lists those teams that have Step 0 as 'C' and the remaining steps as 'W'
SELECT ProjectId from ProjectStatus where (Step != 0 AND Status != 'C') AND ProjectId NOT IN(SELECT ProjectId from ProjectStatus where (Step =0 AND Status = 'W')) GROUP BY ProjectId;