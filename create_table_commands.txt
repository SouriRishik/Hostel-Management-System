--TABLE CREATION
-- HOSTEL Table
CREATE TABLE HOSTEL (
    hostel_number NUMBER PRIMARY KEY,
    capacity NUMBER,
    hostel_name VARCHAR2(255),
    vacant_rooms NUMBER,
    mess_id NUMBER,
    sports CHAR(1), -- Use 'Y' or 'N' for BOOLEAN
    newspaper CHAR(1)
);

-- Mess_Menu Table
CREATE TABLE Mess_Menu (
    mess_id NUMBER PRIMARY KEY,
    day VARCHAR2(10),
    time VARCHAR2(10),
    menu VARCHAR2(1000)
);

-- Mess_Admin Table
CREATE TABLE Mess_Admin (
    mess_id NUMBER PRIMARY KEY,
    caterer_name VARCHAR2(255),
    representative VARCHAR2(255)
);

-- Skilled_Employee Table
CREATE TABLE Skilled_Employee (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    sex CHAR(1),
    salary NUMBER(10,2),
    age NUMBER,
    contact_number VARCHAR2(15),
    mail_id VARCHAR2(255),
    post VARCHAR2(100),
    hostel_number NUMBER
);

-- Skilled_Employee_Transaction Table
CREATE TABLE Skilled_Employee_Transaction (
    id_no NUMBER PRIMARY KEY,
    attendance NUMBER(5,2),
    working_days NUMBER,
    hostel_number NUMBER
);

-- Unskilled_Employee Table
CREATE TABLE Unskilled_Employee (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    sex CHAR(1),
    salary NUMBER(10,2),
    age NUMBER,
    contact_number VARCHAR2(15),
    contractor_name VARCHAR2(255),
    working_days NUMBER,
    hostel_number NUMBER
);

-- Unskilled_Employee_Transaction Table
CREATE TABLE Unskilled_Employee_Transaction (
    id_no NUMBER PRIMARY KEY,
    attendance NUMBER(5,2),
    working_days NUMBER,
    hostel_number NUMBER
);

-- Student Table
CREATE TABLE Student (
    roll_number NUMBER PRIMARY KEY,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    date_of_birth DATE,
    age NUMBER,
    room_number NUMBER,
    contact_number VARCHAR2(15),
    mail_id VARCHAR2(255),
    house_no VARCHAR2(50),
    street_no VARCHAR2(50),
    city VARCHAR2(50),
    state VARCHAR2(50),
    country VARCHAR2(50),
    zip_code VARCHAR2(10),
    hostel_number NUMBER
);

-- Student_Transaction Table
CREATE TABLE Student_Transaction (
    roll_number NUMBER PRIMARY KEY,
    attendance NUMBER(5,2),
    days_in_hostel NUMBER,
    hostel_number NUMBER
);

-- Student_In_Out Table
CREATE TABLE Student_In_Out (
    record_number NUMBER PRIMARY KEY,
    timestamp_sign_out DATE,
    timestamp_sign_in DATE,
    roll_number NUMBER
);

-- Visitor_Record Table
CREATE TABLE Visitor_Record (
    record_number NUMBER PRIMARY KEY,
    timestamp_arrival DATE,
    timestamp_departure DATE,
    contact_number VARCHAR2(15),
    visitor_name VARCHAR2(255),
    hostel_number NUMBER
);

-- Internet Table
CREATE TABLE Internet (
    hostel_number NUMBER,
    room_number NUMBER,
    ip_address VARCHAR2(50) UNIQUE,
    PRIMARY KEY (hostel_number, room_number)
);


--QUERIES
ALTER TABLE HOSTEL
ADD CONSTRAINT uq_hostel_mess_id UNIQUE (mess_id);

-- Adding Foreign Key for Mess_Menu Table
ALTER TABLE Mess_Menu 
ADD CONSTRAINT fk_mess_menu FOREIGN KEY (mess_id) REFERENCES HOSTEL(mess_id);

-- Adding Foreign Key for Mess_Admin Table
ALTER TABLE Mess_Admin
ADD CONSTRAINT fk_mess_admin FOREIGN KEY (mess_id) REFERENCES Mess_Menu(mess_id);

-- Adding Foreign Key for Skilled_Employee Table
ALTER TABLE Skilled_Employee
ADD CONSTRAINT fk_skilled_hostel FOREIGN KEY (hostel_number) REFERENCES HOSTEL(hostel_number);

-- Adding Foreign Key for Skilled_Employee_Transaction Table
ALTER TABLE Skilled_Employee_Transaction
ADD CONSTRAINT fk_skilled_employee
FOREIGN KEY (id_no) REFERENCES Skilled_Employee(employee_id);

-- Adding Foreign Key for Unskilled_Employee Table
ALTER TABLE Unskilled_Employee
ADD CONSTRAINT fk_unskilled_hostel FOREIGN KEY (hostel_number) REFERENCES HOSTEL(hostel_number);

-- Adding Foreign Key for Unskilled_Employee_Transaction Table
ALTER TABLE Unskilled_Employee_Transaction
ADD CONSTRAINT fk_unskilled_employee
FOREIGN KEY (id_no) REFERENCES Unskilled_Employee(employee_id);

-- Adding Foreign Key for Student Table
ALTER TABLE Student
ADD CONSTRAINT fk_student_hostel FOREIGN KEY (hostel_number) REFERENCES HOSTEL(hostel_number);

-- Adding Foreign Key for Student_Transaction Table
ALTER TABLE Student_Transaction
ADD CONSTRAINT fk_student_tran FOREIGN KEY (roll_number) REFERENCES Student(roll_number);

ALTER TABLE Student_Transaction
ADD CONSTRAINT fk_student_tran_hostel FOREIGN KEY (hostel_number) REFERENCES HOSTEL(hostel_number);

-- Adding Foreign Key for Student_In_Out Table
ALTER TABLE Student_In_Out
ADD CONSTRAINT fk_sign_in_out FOREIGN KEY (roll_number) REFERENCES Student(roll_number);

-- Adding Foreign Key for Visitor_Record Table
ALTER TABLE Visitor_Record
ADD CONSTRAINT fk_visitor_hostel FOREIGN KEY (hostel_number) REFERENCES HOSTEL(hostel_number);

-- Adding Foreign Key for Internet Table
ALTER TABLE Internet
ADD CONSTRAINT fk_internet_hostel FOREIGN KEY (hostel_number) REFERENCES HOSTEL(hostel_number);
