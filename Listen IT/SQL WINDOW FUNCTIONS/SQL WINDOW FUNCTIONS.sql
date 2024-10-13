--create database test;

use test;

--create table student_grades
--(
--	name nvarchar(max),
--	subject nvarchar(max),
--	grade int
--);

--insert into student_grades
--values
--(N'Петя', N'математика', 3),
--(N'Петя', N'русский', 4),
--(N'Петя', N'физика', 5),
--(N'Петя', N'история', 4),
--(N'Маша', N'математика', 4),
--(N'Маша', N'русский', 3),
--(N'Маша', N'физика', 5),
--(N'Маша', N'история', 3);

select * 
from student_grades;

--function_name(column_name)
--[filter(where filter_clause)]
--over
--(
--	partition by (column_names)
--	order by (column_names)
--	[frame_clause]
--)

--select name, subject, grade,
--row_number() over (partition by name order by grade desc),
--rank() over (partition by name order by grade desc),
--dense_rank() over (partition by name order by grade desc)
--from student_grades;

--select name, subject, grade,
--row_number() over name_grade,
--rank() over name_grade,
--dense_rank() over name_grade
--from student_grades
--window name_grade as (partition by name order by grade desc);

--				Windwo Functions
--Aggregate			Ranking					Value
--AVG()             DENSE_RANK()            FIRST_VALUE()
--COUNT()			NTILE()					LAST_VALUE()
--MAX()				RANK()					LAG()
--MIN()				ROW_NUMBER()			LEAD()
--SUM()				CUME_DIST()				NTH_VALUE()

select name, subject, grade,
sum(grade) over (partition by name) as sum_grade,
avg(grade) over (partition by name) as avg_grade,
count(grade) over (partition by name) as count_grade,
min(grade) over (partition by name) as min_grade,
max(grade) over (partition by name) as max_grade
from student_grades;

select name, subject, grade,
row_number() over (partition by name order by grade desc) as row_number,
rank() over (partition by name order by grade desc) as rank,
dense_rank() over (partition by name order by grade desc) as dense_rank
from student_grades;

--create table Employees
--(
--	Id int,
--	Name varchar(max),
--	Gender varchar(max),
--	Salary int
--);

--insert into Employees
--values
--(1, 'Mark', 'Male', 5000),
--(2, 'John', 'Male', 4500),
--(3, 'Pam', 'Female', 5500),
--(4, 'Sara', 'Female', 4000),
--(5, 'Todd', 'Male', 3500),
--(6, 'Mary', 'Female', 5000),
--(7, 'Ben', 'Male', 6500),
--(8, 'Jodi', 'Female', 7000),
--(9, 'Tom', 'Male', 5500),
--(10, 'Ron', 'Male', 5000);

SELECT Name, Gender, Salary
FROM Employees;

SELECT Name, Gender, Salary,
NTILE(3) OVER (PARTITION BY GENDER ORDER BY Salary) AS [Ntile]
FROM Employees;

--create table grades_quartal
--(
--	name nvarchar(max),
--	quartal nvarchar(max),
--	subject nvarchar(max),
--	grade int
--);

--insert into grades_quartal
--values
--(N'Петя', N'1 четверть', N'физика', 4),
--(N'Петя', N'2 четверть', N'физика', 3),
--(N'Петя', N'3 четверть', N'физика', 4),
--(N'Петя', N'4 четверть', N'физика', 5);

select name, quartal, subject, grade
from grades_quartal;

select name, quartal, subject, grade,
lag(grade) over (order by quartal) as previous_grade,
lead(grade) over (order by quartal) as next_grade
--first_value(grade) over (order by quartal) as first_grade,
--last_value(grade) over (order by quartal) as last_grade
from grades_quartal;

--select department_id,
--nth_value(salary, 2) over (partition by department_id order by salary desc) as nth_value
--from employees;
