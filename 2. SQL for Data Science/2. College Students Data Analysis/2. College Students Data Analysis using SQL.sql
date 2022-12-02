/* Once a student is passed out from a Institute or College, he/she is known as Alumni of the Institute. 
Alumni’s career growth plays important role in Institute’s ranking and other networking activities. 
In this project, career choices of alumni of two Universities will be analyzed with respect to their passing year 
as well as the course they completed. 

Dataset: Six .csv file (Alumni record of College A and College B) Higher Studies, Self Employed and Service/Job record 

College_A_HS ~ Higher Studies Record of College A
College_A_SE ~ Self Employed Record of College A
College_A_SJ ~ Service/Job Record of College A
College_B_HS ~ Higher Studies Record of College B
College_B_SE ~ Higher Studies Record of College B
College_B_SJ ~ Higher Studies Record of College B
Tasks to be performed    */

-- Q1. Create new schema as alumni

CREATE SCHEMA alumni;
USE alumni;

-- Q2. Import all .csv files into MySQL

SHOW TABLES;

-- Q3. Run SQL command to see the structure of six tables

DESC college_a_hs;
DESC college_a_se;
DESC college_a_sj;
DESC college_b_hs;     
DESC college_b_se;     
DESC college_b_sj;     

-- Q4. Display first 1000 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) with Python.

-- Answer: Check python (.ipynb) file 

-- Q5. Import first 1500 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) into MS Excel.

-- Answer: Check Excel file.

-- Q6. Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, Remove null values. 

CREATE VIEW College_A_HS_V AS SELECT * FROM college_a_hs WHERE RollNo  IS NOT NULL AND 
LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL AND Batch IS NOT NULL AND 
Degree IS NOT NULL AND PresentStatus IS NOT NULL AND HSDegree IS NOT NULL AND EntranceExam IS NOT NULL AND 
Institute IS NOT NULL AND Location IS NOT NULL;

SELECT * FROM College_A_HS_V;

-- Q7. Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, Remove null values.

CREATE VIEW College_A_SE_V AS SELECT * FROM college_a_se WHERE RollNo IS NOT NULL AND 
LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL AND Batch IS NOT NULL AND 
Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Organization IS NOT NULL AND Location IS NOT NULL;

SELECT * FROM College_A_SE_V;

-- Q8. Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, Remove null values.

CREATE VIEW College_A_SJ_V AS SELECT * FROM college_a_sj WHERE RollNo IS NOT NULL AND 
LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL AND Batch IS NOT NULL AND 
Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Organization IS NOT NULL AND Designation IS NOT NULL AND Location IS NOT NULL;

SELECT * FROM College_A_SJ_V;

-- Q9. Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values.

CREATE VIEW College_B_HS_V AS SELECT * FROM college_b_hs WHERE RollNo IS NOT NULL AND 
LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL AND Branch IS NOT NULL AND 
Batch IS NOT NULL AND Degree IS NOT NULL AND PresentStatus IS NOT NULL AND HSDegree IS NOT NULL AND EntranceExam IS NOT NULL AND 
Institute IS NOT NULL AND Location IS NOT NULL;

SELECT * FROM College_B_HS_V;

-- Q10. Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values.

CREATE VIEW College_B_SE_V AS SELECT * FROM college_b_se WHERE RollNo IS NOT NULL AND 
LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL AND Branch IS NOT NULL AND 
Batch IS NOT NULL AND Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Organization IS NOT NULL AND Location IS NOT NULL;

SELECT * FROM College_B_SE_V;

-- Q11. Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V, Remove null values.

CREATE VIEW College_B_SJ_V AS SELECT * FROM college_b_sj WHERE RollNo IS NOT NULL AND 
LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL AND Branch IS NOT NULL AND 
Batch IS NOT NULL AND Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Organization IS NOT NULL AND Designation IS NOT NULL AND 
Location IS NOT NULL;

SELECT * FROM College_B_SJ_V;

-- Q12. Make procedure to use string function/s for converting record of Name, FatherName, MotherName into lower case for views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 


DELIMITER $$
CREATE PROCEDURE c_view1()
BEGIN
SELECT LOWER(Name) Name, LOWER(FatherName) FatherName, LOWER(MotherName) MotherName FROM college_a_hs_v;
END$$
DELIMITER ;
CALL c_view1();

DELIMITER $$
CREATE PROCEDURE c_view2()
BEGIN
SELECT LOWER(Name) Name, LOWER(FatherName) FatherName, LOWER(MotherName) MotherName FROM college_a_se_v;
END$$
DELIMITER ;
CALL c_view2();

DELIMITER $$
CREATE PROCEDURE c_view3()
BEGIN
SELECT LOWER(Name) Name, LOWER(FatherName) FatherName, LOWER(MotherName) MotherName FROM college_a_sj_v;
END$$
DELIMITER ;
CALL c_view3();

DELIMITER $$
CREATE PROCEDURE c_view4()
BEGIN
SELECT LOWER(Name) Name, LOWER(FatherName) FatherName, LOWER(MotherName) MotherName FROM college_b_hs_v;
END$$
DELIMITER ;
CALL c_view4();

DELIMITER $$
CREATE PROCEDURE c_view5 ()
BEGIN
SELECT LOWER(Name) Name, LOWER(FatherName) FatherName, LOWER(MotherName) MotherName FROM college_b_se_v;
END$$
DELIMITER ;
CALL c_view5();

DELIMITER $$
CREATE PROCEDURE c_view6()
BEGIN
SELECT LOWER(Name) Name, LOWER(FatherName) FatherName, LOWER(MotherName) MotherName FROM college_b_sj_v;
END$$
DELIMITER ;
CALL c_view6();

-- Q13. Import the created views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) into MS Excel and make pivot chart for location of Alumni. 

-- Answer: Check Excel file.

-- Q14. Write a query to create procedure get_name_collegeA using the cursor to fetch names of all students from college A.
 
DELIMITER |
CREATE PROCEDURE get_name_collegeA(INOUT s_name TEXT (40000))
BEGIN
 
DECLARE finished INT DEFAULT 0;
DECLARE namelist VARCHAR(400) DEFAULT "";

DECLARE namedetail CURSOR FOR SELECT Name FROM college_a_hs UNION SELECT Name FROM college_a_se UNION SELECT Name FROM college_a_sj;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

OPEN namedetail;

getname: LOOP

FETCH namedetail INTO namelist;
IF finished = 1 THEN LEAVE getname;
END IF;

SET s_name = CONCAT(namelist, ' ; ', s_name);
END LOOP getname;
CLOSE namedetail;
END |
DELIMITER ;

SET @s_name = " ";
CALL get_name_collegeA(@s_name);
SELECT @s_name 'Students Name';

 
-- Q15. Write a query to create procedure get_name_collegeB using the cursor to fetch names of all students from college B.

DELIMITER $
CREATE PROCEDURE get_name_collegeB(INOUT st_name TEXT (40000))
BEGIN
 
DECLARE finished INT DEFAULT 0;
DECLARE namelist VARCHAR(400) DEFAULT "";

DECLARE namedetail CURSOR FOR SELECT Name FROM college_b_hs UNION SELECT Name FROM college_b_se UNION SELECT Name FROM college_b_sj;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

OPEN namedetail;

getname: LOOP

FETCH namedetail INTO namelist;
IF finished = 1 THEN LEAVE getname;
END IF;

SET st_name = CONCAT(namelist, ' ; ', st_name);
END LOOP getname;
CLOSE namedetail;
END $
DELIMITER ;

SET @st_name = " ";
CALL get_name_collegeB(@st_name);
SELECT @st_name 'Students Name';

-- Q16. Calculate the percentage of career choice of College A and College B Alumni
-- (w.r.t Higher Studies, Self Employed and Service/Job) Note: Approximate percentages are considered for career choices.


SELECT COUNT(*) from college_a_hs;   -- 1157                total count of A = 5887
SELECT COUNT(*) from college_a_se;   -- 724
SELECT COUNT(*) from college_a_sj;   -- 4006
SELECT COUNT(*) from college_b_hs;   -- 199                 total count of B = 2259
SELECT COUNT(*) from college_b_se;   -- 201
SELECT COUNT(*) from college_b_sj;   -- 1859

SELECT 'Higher Studies' Career, (COUNT(*)/5887)*100 'College A Percentage' FROM college_a_hs UNION
SELECT 'Self Employed'Career, (COUNT(*)/5887)*100 'College A Percentage' FROM college_a_se UNION
SELECT 'Service/Job'Career, (COUNT(*)/5887)*100 'College A Percentage' FROM college_a_sj;

SELECT 'Higher Studies' Career, (COUNT(*)/2259)*100 'College B Percentage' FROM college_b_hs UNION
SELECT 'Self Employed'Career, (COUNT(*)/2259)*100 'College B Percentage' FROM college_b_se UNION 
SELECT 'Service/Job'Career, (COUNT(*)/2259)*100 'College B Percentage' FROM college_b_sj;
