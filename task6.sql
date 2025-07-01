-- 1_scalar_subquery_select.sql

SELECT 
    name,
    (SELECT AVG(marks) FROM Marks WHERE Marks.student_id = Students.student_id) AS avg_marks
FROM Students;

-- 2_subquery_where_in.sql

SELECT name 
FROM Students 
WHERE student_id IN (SELECT student_id FROM Marks WHERE marks > 80);

-- 3_subquery_from.sql

SELECT avg_marks 
FROM (
    SELECT student_id, AVG(marks) AS avg_marks 
    FROM Marks 
    GROUP BY student_id
) AS Sub;

-- 4_exists.sql

SELECT name 
FROM Students S
WHERE EXISTS (
    SELECT 1 
    FROM Marks M 
    WHERE M.student_id = S.student_id AND M.marks < 40
);

-- 5_correlated_equals.sql

SELECT name 
FROM Students 
WHERE age = (SELECT MAX(age) FROM Students);