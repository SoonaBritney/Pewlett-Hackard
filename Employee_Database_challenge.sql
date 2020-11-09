=== DELIVERABLE 1 Retiring Employees ====

SELECT DISTINCT e.emp_no,
e.first_name,
e.last_name,
tl.title,
tl.from_date,
tl.to_date,
e.birth_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, tl.to_date DESC;

== EXPORT as csv file ===

SELECT * FROM retirement_titles;

======= counting emp_no : 90398 ===
SELECT count(DISTINCT emp_no) from retirement_titles; 

=== counting first name: 133776 ===== 
SELECT count(first_name) from retirement_titles; 

=== counting last name: 133776 ===== 
SELECT count(last_name) from retirement_titles; 


=== Making clean retirees list with only latest title by removing duplicated title ===

SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title,
from_date,
to_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;


SELECT * FROM unique_titles;

======= re-counting emp_no : 90398 ===
SELECT count(emp_no) from unique_titles; 

=== re-counting first name: 90398 ===== 
SELECT count(first_name) from unique_titles; 

=== re-counting last name: 90398 ===== 
SELECT count(last_name) from unique_titles;


=== CREATING retirees Table with group-by title ====

SELECT COUNT(title) AS "Count",
title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;

SELECT * FROM retiring_titles;

==========================================================
Deliverable 2 Eligiable Employees for Mentorship Training =============
=============================================================

SELECT DISTINCT e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
tl.title
INTO membership_eligibility
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS tl
ON (de.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM membership_eligibility;

SELECT COUNT(emp_no) from membership_eligibility;

SELECT COUNT(title) AS "Count",
title 
INTO membership_eligibility_per_current_title
FROM membership_eligibility
GROUP BY title
ORDER BY count(title) DESC;

SELECT * FROM membership_eligibility_per_current_title;


=======================================================
DELIVERABLE 3 - Mentoring plan per department =======
===================================================================
=== Find out the mentors who are retirement-ready and train the eligibl employees  
=== find out mentors list per dept_no (JOIN unique_titles and dept_emp)

SELECT DISTINCT ut.emp_no, 
ut.first_name,
ut.last_name,
ut.title,
de.dept_no,
d.dept_name
INTO retiring_mentor_groupby_dept
FROM unique_titles AS ut
INNER JOIN dept_emp AS de
ON (ut.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
ORDER BY ut.emp_no;

SELECT * FROM retiring_mentor_groupby_dept;
DROP TABLE retiring_mentor_groupby_dept;
SELECT * FROM dept_emp;

== mentors count per dept ======
SELECT COUNT(dept_no), 
dept_no
INTO mentors_count_per_dept
FROM retiring_mentor_groupby_dept
GROUP BY dept_no
ORDER BY dept_no;


SELECT * FROM mentors_count_per_dept;

==mentors count per dept and title as well======
SELECT dept_no,
dept_name,
title,
COUNT(title) 
INTO mentors_count_per_dept_title
FROM retiring_mentor_groupby_dept
GROUP BY dept_no, dept_name, title
ORDER BY dept_no, title;

SELECT * FROM mentors_count_per_dept_title;

====== Eligible Mentees ===================
== (Mentees) to find out the mentorship eligiable employees per dept and title

SELECT me.emp_no,
me.first_name,
me.last_name,
me.birth_date,
me.from_date,
me.to_date,
me.title,
de.dept_no,
d.dept_name
INTO membership_eligibility_per_dept
FROM membership_eligibility as me
INNER JOIN dept_emp AS de
ON (me.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
ORDER BY me.emp_no;

SELECT * FROM membership_eligibility_per_dept;
DROP TABLE membership_eligibility_per_dept;


==== elegible mentees count per dept number ==================

SELECT dept_no,
dept_name,
title,
COUNT(title) AS "Mentees Count"
INTO membership_eligibility_per_dept_title
FROM membership_eligibility_per_dept
GROUP BY dept_no,dept_name,title
ORDER BY dept_no,title;


SELECT * FROM membership_eligibility_groupby_dept;

SELECT * FROM membership_eligibility_per_dept_title;


