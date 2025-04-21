INSERT INTO HOSTEL VALUES (1, 100, 'Block1', 10, 101, 'Y', 'Y');
INSERT INTO HOSTEL VALUES (2, 120, 'Block2', 15, 102, 'Y', 'N');
INSERT INTO HOSTEL VALUES (3, 90, 'Block3', 5, 103, 'N', 'Y');
INSERT INTO HOSTEL VALUES (4, 110, 'Block4', 12, 104, 'Y', 'Y');
INSERT INTO HOSTEL VALUES (5, 80, 'Block5', 8, 105, 'N', 'N');
INSERT INTO HOSTEL VALUES (6, 95, 'Block6', 7, 106, 'Y', 'Y');
INSERT INTO HOSTEL VALUES (7, 100, 'Block7', 20, 107, 'N', 'Y');

INSERT INTO Mess_Menu VALUES (101, 'Monday', 'Breakfast', 'Idli, Sambar, Chutney');
INSERT INTO Mess_Menu VALUES (102, 'Tuesday', 'Lunch', 'Roti, Dal, Rice, Salad');
INSERT INTO Mess_Menu VALUES (103, 'Wednesday', 'Dinner', 'Paneer, Roti, Rice');
INSERT INTO Mess_Menu VALUES (104, 'Thursday', 'Breakfast', 'Poha, Jalebi');
INSERT INTO Mess_Menu VALUES (105, 'Friday', 'Lunch', 'Chole, Rice, Salad');
INSERT INTO Mess_Menu VALUES (106, 'Saturday', 'Dinner', 'Biryani, Raita');
INSERT INTO Mess_Menu VALUES (107, 'Sunday', 'Breakfast', 'Aloo Paratha, Curd');

INSERT INTO Mess_Admin VALUES (101, 'Sodexo', 'Amit Kumar');
INSERT INTO Mess_Admin VALUES (102, 'FoodKing', 'Priya Singh');
INSERT INTO Mess_Admin VALUES (103, 'EatRight', 'Rahul Mehta');
INSERT INTO Mess_Admin VALUES (104, 'GoodFood', 'Nisha Reddy');
INSERT INTO Mess_Admin VALUES (105, 'Annapurna', 'Ravi Sharma');
INSERT INTO Mess_Admin VALUES (106, 'NutriMeal', 'Kavita Joshi');
INSERT INTO Mess_Admin VALUES (107, 'YummyFoods', 'Arun Iyer');

INSERT INTO Skilled_Employee VALUES (1, 'Ravi', 'Kumar', 'M', 30000.00, 35, '9876543210', 'ravi.k@example.com', 'Hostel Warden', 1);
INSERT INTO Skilled_Employee VALUES (2, 'Neha', 'Sharma', 'F', 32000.00, 30, '8765432109', 'neha.s@example.com', 'Resident Teacher', 2);
INSERT INTO Skilled_Employee VALUES (3, 'Amit', 'Verma', 'M', 31000.00, 40, '7654321098', 'amit.v@example.com', 'Counselor', 3);
INSERT INTO Skilled_Employee VALUES (4, 'Sunita', 'Mishra', 'F', 30500.00, 33, '6543210987', 'sunita.m@example.com', 'Academic Mentor', 4);
INSERT INTO Skilled_Employee VALUES (5, 'Deepak', 'Jain', 'M', 30000.00, 38, '5432109876', 'deepak.j@example.com', 'Discipline In-charge', 5);
INSERT INTO Skilled_Employee VALUES (6, 'Meena', 'Patel', 'F', 31500.00, 29, '4321098765', 'meena.p@example.com', 'Activity Coordinator', 6);
INSERT INTO Skilled_Employee VALUES (7, 'Rakesh', 'Yadav', 'M', 32500.00, 34, '3210987654', 'rakesh.y@example.com', 'Sports Trainer', 7);

INSERT INTO Skilled_Employee_Transaction VALUES (1, 95.5, 26, 1);
INSERT INTO Skilled_Employee_Transaction VALUES (2, 89.0, 25, 2);
INSERT INTO Skilled_Employee_Transaction VALUES (3, 91.5, 27, 3);
INSERT INTO Skilled_Employee_Transaction VALUES (4, 93.0, 26, 4);
INSERT INTO Skilled_Employee_Transaction VALUES (5, 88.0, 24, 5);
INSERT INTO Skilled_Employee_Transaction VALUES (6, 90.5, 26, 6);
INSERT INTO Skilled_Employee_Transaction VALUES (7, 92.0, 27, 7);

INSERT INTO Unskilled_Employee VALUES (11, 'Suresh', 'Das', 'M', 15000.00, 45, '9988776655', 'ABC Contractor', 26, 1);
INSERT INTO Unskilled_Employee VALUES (12, 'Geeta', 'Rao', 'F', 14000.00, 40, '8877665544', 'XYZ Contractor', 25, 2);
INSERT INTO Unskilled_Employee VALUES (13, 'Karan', 'Singh', 'M', 14500.00, 42, '7766554433', 'LMN Contractor', 27, 3);
INSERT INTO Unskilled_Employee VALUES (14, 'Lata', 'Pandey', 'F', 14200.00, 39, '6655443322', 'PQR Contractor', 24, 4);
INSERT INTO Unskilled_Employee VALUES (15, 'Vikas', 'Tiwari', 'M', 15000.00, 41, '5544332211', 'DEF Contractor', 26, 5);
INSERT INTO Unskilled_Employee VALUES (16, 'Nisha', 'Gupta', 'F', 14800.00, 38, '4433221100', 'GHI Contractor', 25, 6);
INSERT INTO Unskilled_Employee VALUES (17, 'Rahul', 'Yadav', 'M', 14900.00, 37, '3322110099', 'JKL Contractor', 27, 7);


INSERT INTO Unskilled_Employee_Transaction VALUES (11, 85.0, 25, 1);
INSERT INTO Unskilled_Employee_Transaction VALUES (12, 82.5, 24, 2);
INSERT INTO Unskilled_Employee_Transaction VALUES (13, 88.0, 26, 3);
INSERT INTO Unskilled_Employee_Transaction VALUES (14, 86.0, 25, 4);
INSERT INTO Unskilled_Employee_Transaction VALUES (15, 90.0, 27, 5);
INSERT INTO Unskilled_Employee_Transaction VALUES (16, 87.5, 26, 6);
INSERT INTO Unskilled_Employee_Transaction VALUES (17, 89.0, 27, 7);

INSERT INTO Student VALUES (1001, 'Rohan', 'Sharma', TO_DATE('2003-05-10','YYYY-MM-DD'), 21, 101, '9123456780', 'rohan.s@example.com', '12A', '5th', 'Delhi', 'Delhi', 'India', '110001', 1);
INSERT INTO Student VALUES (1002, 'Ayesha', 'Khan', TO_DATE('2002-11-02','YYYY-MM-DD'), 22, 102, '9123456781', 'ayesha.k@example.com', '34B', '6th', 'Mumbai', 'Maharashtra', 'India', '400001', 2);
INSERT INTO Student VALUES (1003, 'Nikhil', 'Verma', TO_DATE('2003-01-15','YYYY-MM-DD'), 21, 103, '9123456782', 'nikhil.v@example.com', '56C', '7th', 'Chennai', 'Tamil Nadu', 'India', '600001', 3);
INSERT INTO Student VALUES (1004, 'Sneha', 'Mehta', TO_DATE('2003-03-20','YYYY-MM-DD'), 21, 104, '9123456783', 'sneha.m@example.com', '78D', '8th', 'Kolkata', 'West Bengal', 'India', '700001', 4);
INSERT INTO Student VALUES (1005, 'Rajat', 'Kapoor', TO_DATE('2002-08-08','YYYY-MM-DD'), 22, 105, '9123456784', 'rajat.k@example.com', '90E', '9th', 'Bangalore', 'Karnataka', 'India', '560001', 5);
INSERT INTO Student VALUES (1006, 'Diya', 'Singh', TO_DATE('2003-07-25','YYYY-MM-DD'), 21, 106, '9123456785', 'diya.s@example.com', '11F', '10th', 'Hyderabad', 'Telangana', 'India', '500001', 6);
INSERT INTO Student VALUES (1007, 'Kabir', 'Joshi', TO_DATE('2002-12-12','YYYY-MM-DD'), 22, 107, '9123456786', 'kabir.j@example.com', '22G', '11th', 'Pune', 'Maharashtra', 'India', '411001', 7);

INSERT INTO Student_Transaction VALUES (1001, 92.5, 220, 1);
INSERT INTO Student_Transaction VALUES (1002, 90.0, 215, 2);
INSERT INTO Student_Transaction VALUES (1003, 88.5, 210, 3);
INSERT INTO Student_Transaction VALUES (1004, 95.0, 225, 4);
INSERT INTO Student_Transaction VALUES (1005, 89.0, 218, 5);
INSERT INTO Student_Transaction VALUES (1006, 91.5, 222, 6);
INSERT INTO Student_Transaction VALUES (1007, 94.0, 219, 7);

INSERT INTO Student_In_Out VALUES (1, TO_DATE('2025-04-01 09:00','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-01 20:00','YYYY-MM-DD HH24:MI'), 1001);
INSERT INTO Student_In_Out VALUES (2, TO_DATE('2025-04-02 10:00','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-02 18:00','YYYY-MM-DD HH24:MI'), 1002);
INSERT INTO Student_In_Out VALUES (3, TO_DATE('2025-04-03 11:00','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-03 21:00','YYYY-MM-DD HH24:MI'), 1003);
INSERT INTO Student_In_Out VALUES (4, TO_DATE('2025-04-04 08:30','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-04 19:30','YYYY-MM-DD HH24:MI'), 1004);
INSERT INTO Student_In_Out VALUES (5, TO_DATE('2025-04-05 09:15','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-05 22:00','YYYY-MM-DD HH24:MI'), 1005);
INSERT INTO Student_In_Out VALUES (6, TO_DATE('2025-04-06 07:00','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-06 23:00','YYYY-MM-DD HH24:MI'), 1006);
INSERT INTO Student_In_Out VALUES (7, TO_DATE('2025-04-07 06:45','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-07 20:30','YYYY-MM-DD HH24:MI'), 1007);

INSERT INTO Visitor_Record VALUES (1, TO_DATE('2025-04-01 14:00','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-01 17:00','YYYY-MM-DD HH24:MI'), '9988776655', 'Mr. Sharma', 1);
INSERT INTO Visitor_Record VALUES (2, TO_DATE('2025-04-02 13:00','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-02 16:00','YYYY-MM-DD HH24:MI'), '8877665544', 'Mrs. Khan', 2);
INSERT INTO Visitor_Record VALUES (3, TO_DATE('2025-04-03 15:00','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-03 18:00','YYYY-MM-DD HH24:MI'), '7766554433', 'Mr. Verma', 3);
INSERT INTO Visitor_Record VALUES (4, TO_DATE('2025-04-04 16:30','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-04 19:30','YYYY-MM-DD HH24:MI'), '6655443322', 'Mrs. Mehta', 4);
INSERT INTO Visitor_Record VALUES (5, TO_DATE('2025-04-05 17:15','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-05 20:00','YYYY-MM-DD HH24:MI'), '5544332211', 'Mr. Kapoor', 5);
INSERT INTO Visitor_Record VALUES (6, TO_DATE('2025-04-06 12:00','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-06 16:00','YYYY-MM-DD HH24:MI'), '4433221100', 'Mrs. Singh', 6);
INSERT INTO Visitor_Record VALUES (7, TO_DATE('2025-04-07 10:45','YYYY-MM-DD HH24:MI'), TO_DATE('2025-04-07 14:30','YYYY-MM-DD HH24:MI'), '3322110099', 'Mr. Joshi', 7);

INSERT INTO Internet VALUES (1, 101, '192.168.1.101');
INSERT INTO Internet VALUES (2, 102, '192.168.2.102');
INSERT INTO Internet VALUES (3, 103, '192.168.3.103');
INSERT INTO Internet VALUES (4, 104, '192.168.4.104');
INSERT INTO Internet VALUES (5, 105, '192.168.5.105');
INSERT INTO Internet VALUES (6, 106, '192.168.6.106');
INSERT INTO Internet VALUES (7, 107, '192.168.7.107');
