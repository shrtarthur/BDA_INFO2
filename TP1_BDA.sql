-- Exercice 1 --




-- Exercice 2 --

-- 1

SELECT * FROM section;

-- 2

SELECT * FROM course;

-- 3

SELECT title, dept_name FROM course;

-- 4

SELECT dept_name, budget FROM department;

-- 5

SELECT name, dept_name FROM teacher;

-- 6

SELECT name FROM teacher
WHERE salary > 65000;

-- 7

SELECT name FROM teacher
WHERE salary >= 55000 AND salary <= 85000;

-- 8

SELECT DISTINCT dept_name from teacher;

-- 9

SELECT name FROM teacher
WHERE dept_name = 'Comp. Sci' AND salary > 65000;

-- 10

SELECT * FROM section
WHERE semester = 'Spring' AND year = 2010;

-- 11

SELECT title FROM course
WHERE dept_name = 'Comp. Sci.' AND credits > 3;

-- 12

SELECT t.name, t.dept_name, d.building FROM teacher t
JOIN department d ON d.dept_name = t.dept_name;

-- 13

SELECT s.name FROM student s
JOIN takes t ON t.ID = s.ID
JOIN course c ON c.course_id = t.course_id
WHERE c.dept_name = 'Comp. Sci.';

-- 14

SELECT DISTINCT s.name FROM student s
JOIN takes tk ON tk.ID = s.ID
JOIN teaches tchs ON tchs.course_id = tk.course_id
JOIN teacher tchr ON tchr.ID = tchs.ID
WHERE tchr.name = 'Einstein';

-- 15

SELECT c.course_id, tchr.name FROM course c
JOIN teaches tchs ON tchs.course_id = c.course_id
JOIN teacher tchr ON tchr.ID = tchs.ID;

-- 16

SELECT course_id, COUNT(*) FROM takes
WHERE semester = 'Spring' AND year = 2010
GROUP BY course_id;

-- 17

SELECT d.dept_name, MAX(t.salary) FROM department d
JOIN teacher t ON t.dept_name = d.dept_name
GROUP BY d.dept_name;

-- 18

SELECT course_id, COUNT(*) FROM takes
GROUP BY course_id;

-- 19

SELECT building, COUNT(*) FROM section
WHERE (semester = 'Fall' AND year = 2009) OR (semester = 'Spring' AND year = 2010)
GROUP BY building;

-- 20

SELECT c.dept_name, d.building, COUNT(*) FROM course c
JOIN department d ON d.dept_name = c.dept_name
JOIN section s ON s.course_id = c.course_id
WHERE s.building = d.building
GROUP BY c.dept_name, d.building;

-- 21

SELECT DISTINCT c.title, tchr.name FROM section s
JOIN course c ON c.course_id = s.course_id
JOIN teaches tchs ON tchs.course_id = c.course_id
JOIN teacher tchr ON tchr.ID = tchs.ID;

-- 22

SELECT semester, COUNT(*) FROM section
WHERE semester != 'Winter'
GROUP BY semester;

-- 23

SELECT s.name, s.tot_cred - SUM(c.credits) FROM student s
JOIN takes tk ON tk.ID = s.ID
JOIN course c ON c.dept_name = s.dept_name AND c.course_id = tk.course_id
GROUP BY s.ID, s.name, s.tot_cred;

-- 24

SELECT c.dept_name, SUM(c.credits) FROM course c
JOIN section s ON s.course_id = c.course_id
GROUP BY c.dept_name;
