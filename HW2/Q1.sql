--livesql (https://livesql.oracle.com/)

--My solution to overcome the two problem in room reservations is creating a new table called HourlySlots. 
--This table has all the slots available to the students to book a room. Each of these slots have a unique Id to Identify it. Thus Id is the primary key.
--Each of them are 1 hour slots. Here I'm also ensuring that the booking are within the operational hours from 7AM - 6PM.
Create Table HourlySlots(
Id INTEGER,
SLOT_TIME CHAR(10) NOT NULL,
PRIMARY KEY (Id));

--Inserting 11 timeslots from 7AM - 6PM, one hour per entry.
INSERT INTO HourlySlots(Id, SLOT_TIME) VALUES (1,'7-8');
INSERT INTO HourlySlots(Id, SLOT_TIME) VALUES (2,'8-9');
INSERT INTO HourlySlots(Id, SLOT_TIME) VALUES (3,'9-10');
INSERT INTO HourlySlots(Id, SLOT_TIME) VALUES (4,'10-11');
INSERT INTO HourlySlots(Id, SLOT_TIME) VALUES (5,'11-12');
INSERT INTO HourlySlots(Id, SLOT_TIME) VALUES (6,'12-13');
INSERT INTO HourlySlots(Id, SLOT_TIME) VALUES (7,'13-14');
INSERT INTO HourlySlots(Id, SLOT_TIME) VALUES (8,'14-15');
INSERT INTO HourlySlots(Id, SLOT_TIME) VALUES (9,'15-16');
INSERT INTO HourlySlots(Id, SLOT_TIME) VALUES (10,'16-17');
INSERT INTO HourlySlots(Id, SLOT_TIME) VALUES (11,'17-18');

Select * from HourlySlots;

--Now we create the ProjectRoomBookings table
--(i) To overcome the first problem of having endtime before the starttime, I came up with a simple solution of removing the endtime attribute
--    and replacing it with a new attribute called TotalHours, which takes in the total number of hours of booking required. And because of the 
--    predefined time slot table, depending on the number of hours needed, respective entries can be made such that the endtime increases exactly by the 
--    intervals defined, thus, eliminating the posibility of the endtime being before the start time. Also, start time will be the start time of each time slot
--    of the booking.

--(ii) To overcome the second problem I'm using the combination of the roomNum and Time_slot Id as a primary key. This ensures that for a particular room
--     only 1 entry can be made in the table for a given time slot. Here the time_slot Id is a foreign key referencing the HourlySlot table. 
--     to make an entry for booking a room for multiple hours, multiple single entries need to be made with an hour increment using the time-slot Id.
--     Thus to book room 2 for 3 hours from 8 AM, we need to make 3 entries into the projectroombookings table. First entry from 8AM - 9AM with time_slot id of 2.
--     Second entry would be from 9AM - 10AM with time_slot Id of 3 and third entry would be from 10AM - 11AM with time_slot Id of 4. 
CREATE TABLE ProjectRoomBookings
(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL,
TotalHours INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
Time_Slot INTEGER NOT NULL,
CONSTRAINT FK1 FOREIGN KEY(Time_Slot) REFERENCES HourlySlots(Id),
PRIMARY KEY (roomNum, Time_Slot));


-- Inserting room reservation by entering the roomNumber, start time, total hours of reservation, Group name and the time_slot of reservation
INSERT INTO ProjectRoomBookings(roomNum, startTime, TotalHours, groupName, Time_Slot) VALUES (1,7,2,'Group 1', 1);
INSERT INTO ProjectRoomBookings(roomNum, startTime, TotalHours, groupName, Time_Slot) VALUES (1,8,2,'Group 1', 2);
INSERT INTO ProjectRoomBookings(roomNum, startTime, TotalHours, groupName, Time_Slot) VALUES (2,7,4,'Group 2', 1);
INSERT INTO ProjectRoomBookings(roomNum, startTime, TotalHours, groupName, Time_Slot) VALUES (2,8,4,'Group 2', 2);
INSERT INTO ProjectRoomBookings(roomNum, startTime, TotalHours, groupName, Time_Slot) VALUES (2,9,4,'Group 2', 3);
INSERT INTO ProjectRoomBookings(roomNum, startTime, TotalHours, groupName, Time_Slot) VALUES (2,10,4,'Group 2', 7);
--Next Insert won't work because room 1 is alreaday booked by Group 1 from 8AM - 9AM
INSERT INTO ProjectRoomBookings(roomNum, startTime, TotalHours, groupName, Time_Slot) VALUES (1,8,2,'Group 3', 2); 
INSERT INTO ProjectRoomBookings(roomNum, startTime, TotalHours, groupName, Time_Slot) VALUES (1,9,2,'Group 3', 3);

Select * from ProjectRoomBookings;



-------------ALTERNATE SOLUTION---------------
-- Using triggers - We can create a trigger after creating the projectRoomBooking table. This trigger should fire on either insert or update of a row.
-- In this trigger we can check if there exists an entry in the projectRoomBooking table where the newly inserted row has the same roomNum as any of the other rows present 
-- in the projectBookingTable. If yes, then we should also check if the StartTime of the newly inserted rows is before the endTime of any other booking for the same room number. 
-- Additional we should also check in the trigger if the endTime of the new row is before the StartTime specified. If only of these conditions are true the trigger should
-- Throw a warning to the user for duplicate entry.   