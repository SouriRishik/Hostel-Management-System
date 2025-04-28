--1. Hostel & Facility Management

CREATE OR REPLACE PROCEDURE manage_hostel(
    p_action VARCHAR2,
    p_hostel_num NUMBER,
    p_name VARCHAR2,
    p_cap NUMBER,
    p_vacant NUMBER,
    p_sports CHAR,
    p_paper CHAR
) IS
BEGIN
    IF p_action = 'ADD' THEN
        INSERT INTO HOSTEL VALUES(p_hostel_num, p_cap, p_name, p_vacant, 
                                (SELECT NVL(MAX(mess_id),100)+1 FROM HOSTEL), 
                                p_sports, p_paper);
        DBMS_OUTPUT.PUT_LINE('Hostel added');
    ELSIF p_action = 'UPDATE' THEN
        UPDATE HOSTEL SET hostel_name=p_name, capacity=p_cap, 
                         vacant_rooms=p_vacant, sports=p_sports, newspaper=p_paper
        WHERE hostel_number=p_hostel_num;
        DBMS_OUTPUT.PUT_LINE('Hostel updated');
    ELSE
        DELETE FROM HOSTEL WHERE hostel_number=p_hostel_num;
        DBMS_OUTPUT.PUT_LINE('Hostel deleted');
    END IF;
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error: '||SQLERRM);
END;
/

DECLARE
BEGIN
    manage_hostel(
        '&Action',
        &Hostel_Number,
        '&Hostel_Name',
        &Capacity,
        &Vacant_Rooms,
        '&Sports_Facility',
        '&Newspaper'
    );
END;
/

--2. Employee Management

CREATE OR REPLACE PROCEDURE manage_employee(
    p_type VARCHAR2,
    p_id NUMBER,
    p_name VARCHAR2,
    p_salary NUMBER,
    p_hostel NUMBER,
    p_post VARCHAR2
) IS
BEGIN
    IF p_type = 'SKILLED' THEN
        INSERT INTO Skilled_Employee VALUES(
            p_id, 
            SUBSTR(p_name, 1, INSTR(p_name,' ')-1),
            SUBSTR(p_name, INSTR(p_name,' ')+1),
            'M', p_salary, 30, '0000000000', 
            REPLACE(LOWER(p_name),' ','.')||'@example.com',
            p_post, p_hostel
        );
    ELSE
        INSERT INTO Unskilled_Employee VALUES(
            p_id,
            SUBSTR(p_name, 1, INSTR(p_name,' ')-1),
            SUBSTR(p_name, INSTR(p_name,' ')+1),
            'M', p_salary, 30, '0000000000', p_post, 26, p_hostel
        );
    END IF;
    DBMS_OUTPUT.PUT_LINE('Employee added');
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error: '||SQLERRM);
END;
/

DECLARE
BEGIN
    manage_employee(
        '&Type',
        &Employee_ID,
        '&Full_Name',
        &Salary,
        &Hostel_Number,
        '&Designation_Contractor'
    );
END;
/

--3. Student In-Out Tracking

CREATE OR REPLACE FUNCTION track_student(
    p_roll NUMBER,
    p_action VARCHAR2
) RETURN VARCHAR2 IS
    v_result VARCHAR2(100);
BEGIN
    IF p_action = 'OUT' THEN  
        INSERT INTO Student_In_Out VALUES(
            (SELECT NVL(MAX(record_number),0)+1 FROM Student_In_Out),
            SYSDATE, NULL, p_roll
        );
        v_result := 'Check-out recorded';
    ELSE
        UPDATE Student_In_Out 
        SET timestamp_sign_in = SYSDATE
        WHERE roll_number = p_roll AND timestamp_sign_in IS NULL
        AND ROWNUM = 1;
        v_result := 'Check-in recorded';
    END IF;
    RETURN v_result;
EXCEPTION 
    WHEN OTHERS THEN 
        RETURN 'Error: ' || SQLERRM;
END;
/

DECLARE
    v_msg VARCHAR2(100);
BEGIN
    v_msg := track_student(&Roll_Number, '&Action');
    DBMS_OUTPUT.PUT_LINE(v_msg);
END;
/

--4. Visitor Management

CREATE OR REPLACE PROCEDURE log_visitor(
    p_name VARCHAR2,
    p_hostel NUMBER,
    p_contact VARCHAR2
) IS
BEGIN
    INSERT INTO Visitor_Record VALUES(
        (SELECT NVL(MAX(record_number),0)+1 FROM Visitor_Record),
        SYSDATE, SYSDATE + 2/24, p_contact, p_name, p_hostel
    );
    DBMS_OUTPUT.PUT_LINE('Visitor logged');
EXCEPTION 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

DECLARE
BEGIN
    log_visitor('&Name', &Hostel_Number, '&Contact_Number');
END;
/


--5. Transaction Reporting

CREATE OR REPLACE PROCEDURE generate_report(
    p_type VARCHAR2,
    p_hostel NUMBER
) IS
    v_rc SYS_REFCURSOR;
BEGIN
    IF p_type = 'ATTENDANCE' THEN
        OPEN v_rc FOR
        SELECT 'Student' AS type, roll_number AS id, attendance 
        FROM Student_Transaction WHERE hostel_number = p_hostel
        UNION ALL
        SELECT 'Employee' AS type, id_no AS id, attendance 
        FROM Skilled_Employee_Transaction WHERE hostel_number = p_hostel;
    ELSE
        OPEN v_rc FOR
        SELECT e.employee_id, e.first_name, e.salary, 
               e.salary*(t.working_days/26)*(t.attendance/100) AS payable
        FROM Skilled_Employee e
        JOIN Skilled_Employee_Transaction t ON e.employee_id = t.id_no
        WHERE e.hostel_number = p_hostel;
    END IF;
    DBMS_SQL.RETURN_RESULT(v_rc);
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error: '||SQLERRM);
END;
/

DECLARE
BEGIN
    generate_report('&Report_Type', &Hostel_Number);
END;
/


--6. User Authentication

CREATE OR REPLACE PROCEDURE reset_password(
    p_username IN VARCHAR2,
    p_mobile_number IN VARCHAR2,
    p_new_password IN VARCHAR2,
    p_otp_input IN NUMBER
) AS
    v_generated_otp NUMBER;
    v_authenticated BOOLEAN := FALSE;
BEGIN
    v_generated_otp := TO_NUMBER(SUBSTR(p_mobile_number, 1, 4));
    
    DBMS_OUTPUT.PUT_LINE('System generated OTP: ' || v_generated_otp);
    
    IF p_otp_input = v_generated_otp THEN
        v_authenticated := TRUE;
        DBMS_OUTPUT.PUT_LINE('OTP verified successfully.');
        
        DBMS_OUTPUT.PUT_LINE('Password has been successfully reset for user: ' || p_username);
        DBMS_OUTPUT.PUT_LINE('New password: ' || p_new_password);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid OTP. Password reset failed.');
    END IF;
END reset_password;
/

DECLARE
    v_username VARCHAR2(100) := '&Enter_Username';
    v_mobile_number VARCHAR2(20) := '&Enter_Mobile_Number';
    v_new_password VARCHAR2(100) := '&Enter_New_Password';
    v_otp_input NUMBER := &Enter_OTP_Received;
BEGIN
    reset_password(v_username, v_mobile_number, v_new_password, v_otp_input);
END;
/


--7. Payment Management

CREATE OR REPLACE PROCEDURE process_payment(
    p_emp_id NUMBER,
    p_type VARCHAR2,
    p_bonus NUMBER
) IS
    v_salary NUMBER;
BEGIN
    IF p_type = 'SKILLED' THEN
        SELECT salary INTO v_salary FROM Skilled_Employee WHERE employee_id = p_emp_id;
    ELSE
        SELECT salary INTO v_salary FROM Unskilled_Employee WHERE employee_id = p_emp_id;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Processed payment: '||(v_salary+p_bonus));
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error: '||SQLERRM);
END;
/

DECLARE
BEGIN
    process_payment(&Employee_ID, '&Type', 0);   
END;
/
--8. Notification System

CREATE OR REPLACE FUNCTION send_reminder(
    p_type VARCHAR2,
    p_id NUMBER
) RETURN VARCHAR2 IS
    v_message VARCHAR2(100);
BEGIN
    IF p_type = 'PAYMENT' THEN
        v_message := 'Reminder sent for payment ID: ' || p_id;
    ELSE
        v_message := 'Notification sent for visitor ID: ' || p_id;
    END IF;
    
    RETURN v_message;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM;
END;
/


DECLARE
    v_reminder_message VARCHAR2(100);
BEGIN
    v_reminder_message := send_reminder(
        '&Type',
        &ID
    );
    DBMS_OUTPUT.PUT_LINE(v_reminder_message);
END;
/
