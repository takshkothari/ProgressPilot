# dbsproject
Design and implement a Web-based system to record student registration and grade information for courses at a university which permits recording of course performance information—specifically, the marks given to each student in each assignment or exam of a course, and computation of a (weighted) sum of marks to get the total course marks. The number of assignments/exams should not be predefined; that is, more assignments/exams can be added at any time. The system should also support grading, permitting cut-offs to be specified for various grades.
A database will be used to store the details of a student and marks in each assignment/exam. Operations on the database will be used to calculate the grades and the database can be viewed in the form of a table(s) to see the marks/grades of a student.


The main goal of this project is to create a portal which can help handle the grading calculations for students to keep a track of their progress through the semester.

The web portal, on being opened will first ask the student if the registration has already been done or if a new registration is required. For every new registration, the registration number of the student will be asked and so will their marks in each subject. If the student is an already registered user, they will be given a choice to either add assignment/exam marks or view their current grade. Based upon the marks entered by the student in each subject, they shall be graded.
The grading will be done using a weighted sum of marks, where the weights of each subject will be the number of credits that particular subject holds.

Based on the calculations, the grade can be translated to A, B, C etc. using certain threshold/cut-off values for grades. The cut-off values for grades can also be specified as per the requirement. If not specified, the default values will be used. After calculating the grades for all subjects, the CGPA of a student can be calculated using the given formula:

If a new assignment/exam is conducted and is required to be uploaded to the portal, the student will be given an option to upload the marks and the updated grade will be shown after this operation has been completed.
This will be very useful for students as all the data will be tabulated and will be in an easy-to-understand manner and can be useful for them to have a fair idea of how they have been faring till now
