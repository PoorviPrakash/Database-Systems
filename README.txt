STEM Organisation ER Diagram

Explanation and assumptions of my ER Diagram - 

1. As stated by the problem statement, a student enrolled in the org can take multiple classes. This is depicted as a many-to-many relationship between student and class. In the class entity, I'm recording the student's ID, Coding language used(as an extra info) and the student's rating out of 5 for the class. 

2. In my ER Diagram, Every class can have multiple class schedules which specifies which room, date, time and instructor details for the class. In contrast, every class schedule can only be related to one class. 

3. Although the problem statement tells us that a class can have multiple instructors, for any given class schedule, on a particular date and time, only one instructor can teach the class. As I'm mapping instructor to the class schedule for a given day, an instructor can teach multiple classes during multiple different schedules but a schedule can only refer to one instructor at a time. This is depicted through one-to-many relationship between instructor and class schedule entities.

4. As the instructor changes based on the class schedule, I've indicated the text book required for the class in the class schedule. Thus the text book required changes according to the instructor assigned.

5. Each schedule indicates the number of lecture hours assigned. Thus the total number of lecture hours taught by an instructor for all the classes undertaken can be easily obtained by mapping class schedules for a given instructor and adding them up. 

6. I've assumed that the project topics are predefined and the students have to choose from a list of projects offered by the organisation. Depending on the topic the student wants to work on, they can form groups. There is no restrictions as to how many projects the student can be a part of, thus he might be part of different groups for different projects. Thus, a many-to-many relationship.

7.  Each group can only work on one project and that project is specified through its project ID. For each project offered by the university, the project entity specifies which micro-controller it requires and what the coding language should be. 

8. Each group is assigned a table with a project box each. This project box is identified through Project box no. It also captures the date of issue and return of the hardware. This project box can contain multiple items required for the project.

9. Each item has a unique item_id which is used to track the item. This item entity contains information about which box it's a part of, the condition of the item and the supplier who rendered the order. 

10. A supplier can render multiple items of same or different order numbers, but each individual item can only be supplied by one supplier. Thus one-to-many relationship between the supplier and project items.

11. Just like class, each project also has its own schedule. This schedule defines the date, time, room and the instructor supervising it. Every project schedule must have an instructor to supervise it. Different schedules can have different instructors to supervise. 

12. There can be cases where an instructor is very busy and does not have any time to supervise project. Thus an instructor can supervise zero to many project schedules. The project schedule entity also contains the number of hours, thus giving us information about the number of hours an instructor supervised. 

13. The room entity is mapped to both the class schedule and project schedule. I have assumed that a project schedule can be assigned to only one room at a time, but the same room can be used for multiple project schedules. Similarly, a given class schedule can only be in one room and a room can hold multiple class schedules.

14. Both the class and project schedule together forms the student's schedule based on the classes and projects taken by the student.

15. Student pays fees at the beginning of the term which is credited to the organisation's account. I'm capturing this in Credit Transaction table which stories details of all the credit transactions and student IDs. This transaction also gets recorded in account transaction table of the organisation which stores additional details of the transactions like timestamp of payment, reason etc. Any fees paid by the student either as enrolment fees, library late fees or project items damage fees are all captured through the credit and amount transaction entity. Account transaction table comprises of all the transactions to and from the university account. However, every credit transaction can only contribute once in the overall account transaction entity. 

16. Similarly, based on the amount of lecture hours and project hours the instructors takes, their salary is calculated which is registered as a debit transaction in the debit entity(which stores instructor ID) and account transaction table.

17. Student can borrow zero or more books from the library. And the library can issue books to zero or more students. The library entity also stores the return date and the student issuing the book details.

18. I have created 2 separate tables to capture instructor and project ratings as project and instructor are not mapped directly to a student. 