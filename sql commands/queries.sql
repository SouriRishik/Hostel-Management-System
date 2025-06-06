--1) List the full names of skilled employees along with their hostel names
SELECT 
    se.first_name || ' ' || se.last_name AS full_name,
    h.hostel_name
FROM 
    Skilled_Employee se
JOIN 
    Hostel h ON se.hostel_number = h.hostel_number
ORDER BY 
    h.hostel_name;

--2. Total number of skilled and unskilled employees assigned per hostel
SELECT 
    H.hostel_name,
    COUNT(DISTINCT SE.employee_id) AS skilled_count,
    COUNT(DISTINCT UE.employee_id) AS unskilled_count
FROM 
    HOSTEL H
LEFT JOIN 
    Skilled_Employee SE ON H.hostel_number = SE.hostel_number
LEFT JOIN 
    Unskilled_Employee UE ON H.hostel_number = UE.hostel_number
GROUP BY 
    H.hostel_name
ORDER BY 
    skilled_count DESC;

--3. Top 3 skilled employees with highest attendance percentage
SELECT 
    SE.first_name || ' ' || SE.last_name AS employee_name,
    SE.post,
    SETR.attendance,
    H.hostel_name
FROM 
    Skilled_Employee SE
JOIN 
    Skilled_Employee_Transaction SETR ON SE.employee_id = SETR.id_no
JOIN 
    HOSTEL H ON H.hostel_number = SE.hostel_number
ORDER BY 
    SETR.attendance DESC
FETCH FIRST 3 ROWS ONLY;

--4. Count of students per hostel
SELECT 
    H.hostel_name,
    COUNT(S.roll_number) AS student_count
FROM 
    HOSTEL H
LEFT JOIN 
    Student S ON H.hostel_number = S.hostel_number
GROUP BY 
    H.hostel_name
ORDER BY 
    student_count DESC;

--5. List students who stayed in the hostel for more than 25 days with their attendance
SELECT 
    S.roll_number, 
    S.first_name || ' ' || S.last_name AS student_name,
    ST.days_in_hostel,
    ST.attendance,
    H.hostel_name
FROM 
    Student S
JOIN 
    Student_Transaction ST ON S.roll_number = ST.roll_number
JOIN 
    HOSTEL H ON S.hostel_number = H.hostel_number
WHERE 
    ST.days_in_hostel > 25
ORDER BY 
    ST.attendance DESC;