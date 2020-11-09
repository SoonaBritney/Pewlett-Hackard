# Pewlett-Hackard
<<<<<<< HEAD
=======
# Pewlett-Hackard
>>>>>>> 5c70fea7e87192533153dc1bb70758c1d70025e1

1. Purpose of the Pewlett-Hackard Project

The purpose of the project is Analysisng the PHEmployee Database by utilizng SQL query to determine 
1) the number of retiring employees per title, which has no duplicated titles, 
2) and identify employees who are eligible to participate in a mentorship program 

to prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

2. Results

1) The Number of Retiring Employees by Title

The retiring employes are who were born between January 1, 1952 and December 31, 1955. 
We joined the employees and title data table to create a retirement_titles table that holds emp_no, first_name, last_name, title, from_date. to_date and birthday. 
Although, this table holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955. Because some employees may have multiple titles in the database—for example, due to promotions.
We decided to take the latest title of each employees, and create another table, unique_title.

Step 1:
The retirement_titles table holds distintive 90,398 employees with 133,776 titles.
(retirement_titles.csv)

Step2:
The unique_titles table holds distintive 90,398 employees with 90,398 titles, since we removed the multiple titles of each employee, and only collected the latest titles.    
(unique_titles.csv)

Step 3:
Once the unique titles table is created, we like to count the each job title using Group By techniques.
The total title for retiring employees is 90,398:
The final table that has the number of retirement-age employees by most recent job title is as below.
(retiring_titles.csv)
==============================================
# of retiring employees    Title
============================================== 
29414	         	"Senior Engineer"
28255	         	"Senior Staff"
14222	         	"Engineer"
12242	         	"Staff"
4502	         	"Technique Leader"
==============================================
TOTAL                    90,398
==============================================


2) To identify employees who are eligible to participate in a mentorship program 

We created the mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965. 
We joined 4 tables, employees, dept_emp, and titles table to create the table to hold emp_no, first_name, last_name, title, birth_date, from_date, to_date.  
The number of mentorship program eligible employees is identified as total 3,125.
(mentorship_eligibilty.csv)


3. Summary: 

I will provide high-level responses to the following questions by providing two additional queries or tables that may provide more insight into the upcoming "silver tsunami."

1) How many roles will need to be filled as the "silver tsunami" begins to make an impact?
The total roles need to be filled is as below, and the total number is 90,398, which is significant number in the organization. 
It will require well planned strategy to train the eligible employees to fill the positions prior to the “silver tsunami”

=============================================================
# of retiring employees    Title (roles need to be filled)
============================================================= 
29414	         	"Senior Engineer"
28255	         	"Senior Staff"
14222	         	"Engineer"
12242	         	"Staff"
4502	         	"Technique Leader"
============================================================
TOTAL                    90,398
============================================================
 
2) Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

Here are the number of eligiable employees to be trained per department to fill the positions:
()
======================================================
# of eligible employees to be trained       dept_no
======================================================
279					"d001"
174					"d002"
235					"d003"
753					"d004"
875					"d005"
225					"d006"
553					"d007"
277					"d008"
312					"d009"
=====================================================

Meanwhile, the below is the number of of mentors, retirement-ready employees who can train the eligible employes to fill the position per department. 

========================================================
# of mentors, retirement-ready employees  dept_no
========================================================
6047					"d001"
5258					"d002"
5439					"d003"
22199					"d004"
25628					"d005"
6136					"d006"
15699					"d007"
6436					"d008"
7149					"d009"
=====================================================

As you can see the above, the number of mentors are much bigger than mentees in every department.

The conclusion is, Yes, there are enough qualified, retirement-ready employees in the departments to train the next generation of Pewlett Hackard employees.
So, HR does not have to worry about the knowledge transfer before the  “silver tsunami” happens.  

Additionally, 
1) The below is the eligiable employees who can be trained per department with current titles.
(mentees_count_dept_title.csv)
============================================================================
dept_no	dept_name		title			Mentees Count
============================================================================
d001	Marketing		Senior Staff		140
d001	Marketing		Staff			139
d002	Finance			Senior Staff		85
d002	Finance			Staff			89
d003	Human Resources		Senior Staff		114
d003	Human Resources		Staff			121
d004	Production		Assistant Engineer	45
d004	Production		Engineer		320
d004	Production		Senior Engineer		312
d004	Production		Senior Staff		12
d004	Production		Staff			16
d004	Production		Technique Leader	48
d005	Development		Assistant Engineer	55
d005	Development		Engineer		393
d005	Development		Senior Engineer		337
d005	Development		Senior Staff		18
d005	Development		Staff			24
d005	Development		Technique Leader	48
d006	Quality Management	Assistant Engineer	15
d006	Quality Management	Engineer		96
d006	Quality Management	Senior Engineer		100
d006	Quality Management	Technique Leader	14
d007	Sales			Senior Staff		262
d007	Sales			Staff			291
d008	Research		Assistant Engineer	2
d008	Research		Engineer		40
d008	Research		Senior Engineer		32
d008	Research		Senior Staff		88
d008	Research		Staff			111
d008	Research		Technique Leader	4
d009	Customer Service	Assistant Engineer	2
d009	Customer Service	Engineer		26
d009	Customer Service	Senior Engineer		24
d009	Customer Service	Senior Staff		118
d009	Customer Service	Staff			136
d009	Customer Service	Technique Leader	6
========================================================================  

2) The below is retirement ready employees, who can train eligible tranees in each department per titles as well, and there are qualified retirement-ready employees enough for the training.
(mentors_count_dept_title.csv)
========================================================================
dept_no	dept_name	        title			count
========================================================================
d001	Marketing		Senior Staff		4200
d001	Marketing		Staff			1847
d002	Finance			Senior Staff		3696
d002	Finance			Staff			1562
d003	Human Resources		Senior Staff		3744
d003	Human Resources		Staff			1695
d004	Production		Assistant Engineer	746
d004	Production		Engineer		6111
d004	Production		Senior Engineer		12767
d004	Production		Senior Staff		437
d004	Production		Staff			154
d004	Production		Technique Leader	1984
d005	Development		Assistant Engineer	889
d005	Development		Engineer		7187
d005	Development		Senior Engineer		14730
d005	Development		Senior Staff		376
d005	Development		Staff			194
d005	Development		Technique Leader	2252
d006	Quality Management	Assistant Engineer	230
d006	Quality Management	Engineer		1752
d006	Quality Management	Senior Engineer		3603
d006	Quality Management	Technique Leader	551
d007	Sales			Manager			1
d007	Sales			Senior Staff		10930
d007	Sales			Staff			4768
d008	Research		Assistant Engineer	32
d008	Research		Engineer		376
d008	Research		Manager			1
d008	Research		Senior Engineer		759
d008	Research		Senior Staff		3635
d008	Research		Staff			1521
d008	Research		Technique Leader	112
d009	Customer Service	Assistant Engineer	34
d009	Customer Service	Engineer		296
d009	Customer Service	Senior Engineer		611
d009	Customer Service	Senior Staff		4265
d009	Customer Service	Staff			1866
d009	Customer Service	Technique Leader	77
============================================================================

The conclusion is again, there are enough qualified, retirement-ready employees in the departments to train the next generation of Pewlett Hackard employees.
<<<<<<< HEAD
So, HR does not have to worry about the knowledge transfer before the  “silver tsunami” happens.  
=======
So, HR does not have to worry about the knowledge transfer before the  “silver tsunami” happens.  
>>>>>>> 5c70fea7e87192533153dc1bb70758c1d70025e1
