-- Exercice 1 --

-- 1

SELECT dept_name FROM department
WHERE budget = (SELECT MAX(budget) FROM department);

-- 2

SELECT salary, name FROM teacher
WHERE salary > (SELECT SUM(salary)/COUNT(salary) FROM teacher);

-- 3

SELECT tchr.name, s.name, COUNT(*) as nb_cours FROM teacher tchr
JOIN teaches tchs ON tchs.ID = tchr.ID
JOIN takes tk ON tk.course_id = tchs.course_id
JOIN student s ON s.ID = tk.ID
GROUP BY tchr.name, s.name
HAVING COUNT(*) > 2;

-- 4

SELECT * FROM (
    SELECT tchr.name AS name_tchr, s.name AS name_s, COUNT(*) AS nb_cours
    FROM teacher tchr
    JOIN teaches tchs ON tchs.ID = tchr.ID
    JOIN takes tk ON tk.course_id = tchs.course_id
    JOIN student s ON s.ID = tk.ID
    GROUP BY tchr.name, s.name
)
WHERE nb_cours > 2;

-- 5

SELECT s.ID, s.name
FROM student s
WHERE s.ID NOT IN (
    SELECT ID FROM takes WHERE year < 2010
);

-- 6

SELECT name FROM teacher
WHERE name LIKE 'E%';

-- 7

SELECT * FROM (
    SELECT salary, name FROM teacher
    ORDER BY salary DESC
    FETCH FIRST 4 ROWS ONLY
)
MINUS
SELECT * FROM (
    SELECT salary, name FROM teacher
    ORDER BY salary DESC
    FETCH FIRST 3 ROWS ONLY
);

-- 8

SELECT * FROM (
    SELECT name, salary FROM teacher
    ORDER BY salary ASC
    FETCH FIRST 3 ROWS ONLY
)
ORDER BY salary DESC;

-- 9

SELECT DISTINCT s.name FROM takes tk
JOIN student s ON tk.ID = s.ID
WHERE tk.semester = 'Fall' AND tk.year = '2009';