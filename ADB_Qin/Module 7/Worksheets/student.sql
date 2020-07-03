drop table tblstudent;

-- creates the table
create table tblstudent(
stuId NUMBER(5),
lastName VARCHAR2(30),
firstName VARCHAR2(30),
address VARCHAR2(30),
city VARCHAR(30),
state VARCHAR2(7),
zip VARCHAR2(10),
totalHours NUMBER(5),
gpa NUMBER(4,2),
CONSTRAINT tblstudent_stuId_pk PRIMARY KEY (stuId));

-- add the information for the students
INSERT INTO tblstudent
VALUES (2, 'Udey', 'Wendi', '559 Antioch', 'Beaver City', 'NE', '68926', 20, 2.57);
INSERT INTO tblstudent
VALUES (3, 'Wimberly', 'Peter', '610 Sunset Dr.', 'Wahoo', 'NE', '68066', 100, 3.40);
INSERT INTO tblstudent
VALUES (5, 'Williams', 'Andrew', '14 Plaza One', 'Grand Island', 'NE', '66101', 12, 0.75);
INSERT INTO tblstudent
VALUES (20, 'Artz', 'Jacob', '229 W. 5th', 'Ionia', 'IA', '50645', 95, 4.00);
INSERT INTO tblstudent
VALUES (22, 'Long', 'Jason', '777 Elm', 'Clarinda', 'IA', '51632', 15, 0.56);
INSERT INTO tblstudent
VALUES (25, 'Caputo', 'Heather', '111 E. Vine', 'Corning', 'IA', '50841', 23, 1.00);
INSERT INTO tblstudent
VALUES (30, 'Otte', 'Elizabeth', '347 Pine Drive', 'Emporia', 'KS', '66801', 154, 1.23);
INSERT INTO tblstudent
VALUES (37, 'Meinters', 'Kennet', '220 Garfield', 'Kansas City', 'MO', '64111', 12, 2.25);
INSERT INTO tblstudent
VALUES (40, 'Anderson', 'Belinda', '5,The Penthouse', 'Kansas City', 'MO', '64108', 0, 0.00);
INSERT INTO tblstudent
VALUES (45, 'Wilmes', 'Travis', '923 Redbud', 'Maryville', 'MO', '64468', 0, 0.00);
INSERT INTO tblstudent
VALUES (51, 'Herod', 'Scott', '557 Maple Ave.', 'Olin', 'IA', '52320', 23, 4.00);
INSERT INTO tblstudent
VALUES (56, 'Lewis', 'Sean', '324 Yorkshire', 'Pella', 'IA', '50219', 30, 3.25);
INSERT INTO tblstudent
VALUES (62, 'Anderson', 'Cherie', '111 Ravine Ave.', 'Hutchinson', 'KS', '67501', 60, 2.25);
INSERT INTO tblstudent
VALUES (67, 'Rodriguez', 'Roberto', '322 Ridgedale', 'Maryville', 'MO', '64468', 120, 1.25);
INSERT INTO tblstudent
VALUES (73, 'Gray', 'Clarissa', '433 Grant', 'Stockton', 'IA', '52769', 124, 3.00);
INSERT INTO tblstudent
VALUES (78, 'Fong', 'Jesse', '819 Perry Hill', 'Manhattan', 'KS', '66502', 88, 3.00);
INSERT INTO tblstudent
VALUES (82, 'Dosland', 'Megan', '99 Friendly Ln.', 'Kansas City', 'MO', '64111', 77, 3.00);
INSERT INTO tblstudent
VALUES (89, 'Stephens', 'Laurie', '23 Hancock', 'Kansas City', 'MO', '64113', 0, 0.00);
INSERT INTO tblstudent
VALUES (94, 'Smith', 'Lucille', '222 Mason Ave.', 'New Hampton', 'IA', '50659', 0, 0.00);
INSERT INTO tblstudent
VALUES (356, 'Anderson', 'Rebecca', '316 E. 6th', 'Brockton', 'MA', '02401', 15, 3.10);
INSERT INTO tblstudent
VALUES (357, 'Bauman', 'Michael', '617 Prather', 'Kansas City', 'MO', '64138', 15, 2.75);
INSERT INTO tblstudent
VALUES (358, 'Buckingham', 'Michael', '400 Stanley Ct.', 'Glade', 'KS', '67639', 99, 2.50);
INSERT INTO tblstudent
VALUES (362, 'Esler', 'Darrin', '101 Ken Pl.', 'Tracy', 'IA', '50256', 77, 2.00);
INSERT INTO tblstudent
VALUES (377, 'Benson', 'Mary', '2001 Wilson', 'Maryville', 'MO', '64468', 66, 3.00);
INSERT INTO tblstudent
VALUES (380, 'Davis', 'Amanda', '444 Azalea Dr.', 'Maryville', 'MO', '64468', 55, 3.90);
INSERT INTO tblstudent
VALUES (390, 'Vicker', 'Cher', '324 Kennedy', 'Kansas City', 'MO', '64113', 44, 2.00);
INSERT INTO tblstudent
VALUES (400, 'Soda', 'Russell', '555 Maple', 'Topeka', 'KS', '66601', 33, 2.75);
INSERT INTO tblstudent
VALUES (401, 'Dew', 'Jennifer', '201 N. Main', 'Maryville', 'MO', '64468', 22, 2.50);
INSERT INTO tblstudent
VALUES (402, 'Milks', 'Crystal', '110 Dewey', 'Lamoni', 'IA', '50140', 9, 3.10);
INSERT INTO tblstudent
VALUES (403, 'Smith', 'Gergory', '3220 Exeter', 'Stewartsville', 'MO', '64490', 6, 3.10);
INSERT INTO tblstudent
VALUES (406, 'Younger', 'Jennifer', '326 N. Grand', 'Kansas City', 'MO', '64111', 3, 3.90);
INSERT INTO tblstudent
VALUES (407, 'Wagers', 'William', '777 W. Torrance', 'Cedar Rapids', 'IA', '52406', 14, 3.00);
INSERT INTO tblstudent
VALUES (408, 'Klotz', 'Curtis', '324 Empire', 'Maryville', 'MO', '64468', 177, 1.90);
INSERT INTO tblstudent
VALUES (412, 'Donaldson', 'Sue', '312 N. 5th', 'Maryville', 'MO', '64468', 99, 2.75);
INSERT INTO tblstudent
VALUES (417, 'Smith', 'Alex', 'Rte. 3, Box 17', 'Davenport', 'IA', '52805', 122, 2.00);
INSERT INTO tblstudent
VALUES (420, 'Anderson', 'Nicole', '59 Freed Ct.', 'Maryville', 'MO', '64468', 47, 2.75);
INSERT INTO tblstudent
VALUES (421, 'Supinger', 'Stephanie', 'Route 1', 'Kansas City', 'MO', '64111', 22, 2.80);
INSERT INTO tblstudent
VALUES (426, 'Benson', 'David', '322 Hwy 71 N.', 'Maryville', 'MO', '64468', 12, 2.50);
INSERT INTO tblstudent
VALUES (427, 'Scheiber', 'Jennifer', '1442 Quivira', 'Maryville', 'MO', '64468', 23, 3.00);
INSERT INTO tblstudent
VALUES (428, 'Jones', 'Nicole', '325 N. 7th Ave.', 'Wichita', 'KS', '67208', 34, 2.80);
INSERT INTO tblstudent
VALUES (429, 'Chan', 'Bill', '325 Hillport', 'Kansas City', 'MO', '64105', 45, 2.50);
INSERT INTO tblstudent
VALUES (433, 'Lopez', 'Joe', '555 Wyatt', 'Kansas City', 'MO', '64112', 56, 3.10);
INSERT INTO tblstudent
VALUES (437, 'Doane', 'Rebecca', '515 E. 7th Blvd', 'Elkhorn', 'NE', '68022', 67, 2.75);
INSERT INTO tblstudent
VALUES (438, 'Willey', 'Jenny', '9339 Jefferson', 'Waterloo', 'IA', '50706', 78, 2.80);
INSERT INTO tblstudent
VALUES (439, 'Cave', 'Odessa', '21 Rex Ave. NE', 'Kansas City', 'MO', '64111', 89, 1.90);
INSERT INTO tblstudent
VALUES (450, 'Hellebuyck', 'Jeremy', '505 Grand Ave.', 'Maryville', 'MO', '64468', 90, 3.25);
INSERT INTO tblstudent
VALUES (460, 'Brejnik', 'Steven', '1229 Buchanan', 'Kansas City', 'MO', '64126', 45, 2.80);
INSERT INTO tblstudent
VALUES (461, 'Gaffney', 'Michelle', '34 Daisy Circle', 'Barnard', 'MO', '64423', 46, 2.80);
INSERT INTO tblstudent
VALUES (462, 'Garcia', 'Ryan', '111 Frey Ave.', 'Kansas City', 'MO', '64168', 56, 2.75);
INSERT INTO tblstudent
VALUES (463, 'Reed', 'Lisa', '23 Ironwood', 'Kansas City', 'KS', '66105', 78, 3.10);
INSERT INTO tblstudent
VALUES (464, 'Chavez', 'Robert', '943 Adams', 'Brockton', 'MA', '02403', 79, 2.80);
INSERT INTO tblstudent
VALUES (465, 'White', 'Rose', '444 Dogwood', 'Kansas City', 'MO', '64114', 89, 3.25);
INSERT INTO tblstudent
VALUES (466, 'Stiens', 'John', '145 Hillcrest', 'Junction City', 'KS', '66441', 90, 2.80);
INSERT INTO tblstudent
VALUES (469, 'Egbert', 'Josph', '3 Ponderosa Dr.', 'Bedford', 'IA', '50833', 23, 3.25);
INSERT INTO tblstudent
VALUES (500, 'Wood', 'William', '35 E. Mulberry', 'Salina', 'KS', '67401', 21, 2.50);
INSERT INTO tblstudent
VALUES (501, 'Bass', 'Chad', 'Route 1 Box 302', 'Maryville', 'MO', '64468', 32, 2.80);
INSERT INTO tblstudent
VALUES (502, 'Slater', 'Brenda', '666 Oak', 'Maryville', 'MO', '64468', 43, 2.80);
INSERT INTO tblstudent
VALUES (503, 'Combs', 'Jeff', '1 Schoen Ave.', 'PLANO', 'IA', '52581', 54, 3.25);
INSERT INTO tblstudent
VALUES (510, 'Boone', 'Michael', '407 Fisher Dr.', 'Kansas City', 'MO', '64138', 65, 2.80);
INSERT INTO tblstudent
VALUES (511, 'Houseworth', 'Ryan', '122 S. Linn', 'Maryville', 'MO', '64468', 76, 3.10);
INSERT INTO tblstudent
VALUES (512, 'Marinakas', 'Frank', '789 Hillridge', 'Craig', 'MO', '64437', 87, 2.80);
INSERT INTO tblstudent
VALUES (520, 'Wesack', 'Mitch', '523 W. 5th', 'Maryville', 'MO', '64468', 98, 3.90);
INSERT INTO tblstudent
VALUES (521, 'Brune', 'Lisa', '1234 Birch St.', 'Kansas City', 'MO', '64113', 198, 1.90);
INSERT INTO tblstudent
VALUES (522, 'Kopriva', 'Larry', '1234 Johns St.', 'Platte City', 'MO', '64079', 11, 3.90);
INSERT INTO tblstudent
VALUES (615, 'Copp', 'Joshua', '402 W. Third', 'Sioux City', 'IA', '51102', 22, 3.10);
INSERT INTO tblstudent
VALUES (616, 'Lam', 'Kenneth', '4444 Prospect', 'Kansas City', 'MO', '64118', 33, 3.10);
INSERT INTO tblstudent
VALUES (643, 'Smith', 'Betty', '444 Metcalf', 'Kansas City', 'MO', '64126', 44, 2.75);
INSERT INTO tblstudent
VALUES (720, 'O Rourke', 'Craig', 'Rte. 2, Box 63D', 'Des Moines', 'IA', '50316', 55, 2.75);
INSERT INTO tblstudent
VALUES (731, 'Freeman', 'Timothe', '3478 Truman', 'Brockton', 'MA', '02402', 66, 2.80);
INSERT INTO tblstudent
VALUES (746, 'Reistroffer', 'Joseph', '724 Metcalf', 'Kansas City', 'MO', '64126', 77, 2.75);
INSERT INTO tblstudent
VALUES (752, 'Kent', 'Jason', '3449 Barry Rd.', 'Davenport', 'IA', '52805', 88, 2.00);
INSERT INTO tblstudent
VALUES (765, 'Smith', 'Alex', '704 Macomber', 'Gower', 'MO', '64454', 9, 2.50);
INSERT INTO tblstudent
VALUES (766, 'Blain', 'Cynthia', '515 Clover', 'Kansas City', 'KS', '66101', 13, 2.80);
INSERT INTO tblstudent
VALUES (785, 'Smith', 'Kim', '724 Truman', 'Des Moines', 'IA', '50316', 24, 2.75);
INSERT INTO tblstudent
VALUES (801, 'Smith', 'Amy', '214 Hughes', 'Maryville', 'MO', '64468', 35, 2.50);
INSERT INTO tblstudent
VALUES (830, 'Adwell', 'William', '8833 E. 5th', 'Lawrence', 'KS', '66044', 46, 1.90);
INSERT INTO tblstudent
VALUES (834, 'McClain', 'Matthew', '45 Parkdale', 'Gower', 'MO', '64454', 57, 2.00);
INSERT INTO tblstudent
VALUES (870, 'Cox', 'Joe', '312 Mulberry', 'Maryville', 'MO', '64468', 68, 2.80);
INSERT INTO tblstudent
VALUES (875, 'Anderson', 'Heather', '704 S. Roe', 'Maryville', 'MO', '64468', 79, 3.25);
INSERT INTO tblstudent
VALUES (876, 'Teague', 'Tracy', '73 Macomber', 'Kansas City', 'MO', '64126', 82, 2.50);
INSERT INTO tblstudent
VALUES (901, 'Combs', 'Stephanie', '99 Holland St.', 'Columbia', 'MO', '65201', 93, 2.00);
INSERT INTO tblstudent
VALUES (910, 'Lough', 'Ryan', '222 Zehman Ct', 'Maryville', 'MO', '64468', 31, 3.25);
INSERT INTO tblstudent
VALUES (911, 'White', 'Robert', '3 Indiana Ave.', 'Kansas City', 'MO', '64133', 42, 1.90);
INSERT INTO tblstudent
VALUES (943, 'White', 'Theresa', '32 Wymore Ave.', 'Conception', 'MO', '64433', 53, 2.50);
INSERT INTO tblstudent
VALUES (944, 'Cathcart', 'Amy', '14 Jewell Ave.', 'Kansas City', 'MO', '64111', 64, 2.50);

commit;

create or replace procedure update_gpa
(studentId IN NUMBER,
 newGpa IN NUMBER)
IS
BEGIN
  update tblStudent
  set gpa = newGpa
  where stuId = studentId;
  commit;
END;
/

SELECT * FROM tblstudent;