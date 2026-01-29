CREATE TABLE IF NOT EXISTS Customers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') UNIQUE,
    phone VARCHAR(20),
    password VARCHAR(100),
    nationality VARCHAR(100),
    DOB DATE,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX customerEmail_index ON Customers(email);

INSERT INTO Customers
(name, email, phone, password, nationality, DOB, address)
VALUES
('Arun Kumar','arun.kumar01@gmail.com','9383737332','arun@123','INDIA','2003-09-11','No. 12, Anna Nagar West, Chennai – 600101'),
('Barath Raj','barath.raj02@gmail.com','9282738722','barath@123','INDIA','2002-02-12','32, Fairlands Main Road, Salem – 636016'),
('Charan Kumar','charan.k03@gmail.com','3838873934','charan@123','INDIA','2002-12-12','7, Ammapet 3rd Street, Salem – 636003'),
('Dilip Kumar','dilip.k04@gmail.com','8328782626','dilip@123','INDIA','2003-12-01','45, Avinashi Road, Peelamedu, Coimbatore – 641004'),
('Dhanush M','dhanush.m05@gmail.com','6726732678','dhanush@123','INDIA','2001-12-21','31, RS Puram East, Coimbatore – 641002'),
('Fazil Ahmed','fazil.ahmed06@gmail.com','8728672672','fazil@123','INDIA','1997-03-23','18, T Nagar Main Road, Chennai – 600017'),
('Gokul Raj','gokul.raj07@gmail.com','9876543210','gokul@123','INDIA','2000-06-15','22, Velachery Main Road, Chennai – 600042'),
('Hari Prasad','hari.p08@gmail.com','9123456780','hari@123','INDIA','1999-08-19','11, Thillai Nagar 4th Cross, Trichy – 620018'),
('Irfan Khan','irfan.k09@gmail.com','9345678901','irfan@123','INDIA','1998-11-05','9, Palayamkottai High Road, Tirunelveli – 627002'),
('Jeeva Kumar','jeeva.k10@gmail.com','9786543210','jeeva@123','INDIA','2001-01-22','8, KK Nagar, Madurai – 625020'),
('Karthik R','karthik.r11@gmail.com','9090909090','karthik@123','INDIA','2000-04-14','16, Anna Nagar, Madurai – 625020'),
('Lokesh M','lokesh.m12@gmail.com','9191919191','lokesh@123','INDIA','1999-09-09','12, Sathuvachari, Vellore – 632009'),
('Manoj Kumar','manoj.k13@gmail.com','9292929292','manoj@123','INDIA','1998-07-18','26, Katpadi Road, Vellore – 632004'),
('Naveen Raj','naveen.r14@gmail.com','9393939393','naveen@123','INDIA','2002-03-03','5A, Saravanampatti Main Road, Coimbatore – 641035'),
('Prakash S','prakash.s15@gmail.com','9494949494','prakash@123','INDIA','1997-05-27','14, Gandhi Nagar, Vellore – 632006'),
('Raghu V','raghu.v16@gmail.com','9595959595','raghu@123','INDIA','1996-12-12','19, Woraiyur, Trichy – 620003'),
('Santhosh K','santhosh.k17@gmail.com','9696969696','santhosh@123','INDIA','2001-10-10','7, Meyyanur Road, Salem – 636004'),
('Tamil Selvan','tamil.s18@gmail.com','9797979797','tamil@123','INDIA','2000-02-20','41, Suramangalam, Salem – 636005'),
('Uday Kumar','uday.k19@gmail.com','9888888888','uday@123','INDIA','1999-06-06','12, Perundurai Road, Erode – 638011'),
('Vignesh R','vignesh.r20@gmail.com','9777777777','vignesh@123','INDIA','1998-08-08','33, Solar Street, Erode – 638002'),
('Yogeshwaran','yogesh.21@gmail.com','9666666666','yogesh@123','INDIA','1997-11-11','9, Bhavani Road, Erode – 638004'),
('Ajith Kumar','ajith.k22@gmail.com','9555555555','ajith@123','INDIA','2002-01-01','6, Besant Nagar, Chennai – 600090'),
('Balaji M','balaji.m23@gmail.com','9444444444','balaji@123','INDIA','1996-04-04','7, Mount Road, Chennai – 600015'),
('Chandru S','chandru.s24@gmail.com','9333333333','chandru@123','INDIA','1995-03-03','10, Avinashi Road, Coimbatore – 641015'),
('Deepak Raj','deepak.r25@gmail.com','9222222222','deepak@123','INDIA','1999-09-19','6, Ellis Nagar, Madurai – 625016'),
('Eswaran K','eswaran.k26@gmail.com','9111111111','eswaran@123','INDIA','1998-02-14','18, Bypass Road, Madurai – 625010'),
('Francis M','francis.m27@gmail.com','9000000001','francis@123','INDIA','1997-07-07','11, Williams Road, Trichy – 620001'),
('Ganesh P','ganesh.p28@gmail.com','9000000002','ganesh@123','INDIA','2000-05-05','25, Karumandapam, Trichy – 620001'),
('Hemanth S','hemanth.s29@gmail.com','9000000003','hemanth@123','INDIA','2001-06-16','4, VOC Street, Erode – 638001'),
('Imran Ali','imran.a30@gmail.com','9000000004','imran@123','INDIA','1996-12-24','22, Millerpuram, Thoothukudi – 628008'),
('Jagan M','jagan.m31@gmail.com','9000000005','jagan@123','INDIA','1995-11-11','6, Beach Road, Thoothukudi – 628001'),
('Kishore R','kishore.r32@gmail.com','9000000006','kishore@123','INDIA','2002-08-08','14, Bryant Nagar, Thoothukudi – 628003'),
('Logeshwaran','logesh.33@gmail.com','9000000007','logesh@123','INDIA','2003-03-03','33, NGO Colony, Tirunelveli – 627007'),
('Madhan K','madhan.k34@gmail.com','9000000008','madhan@123','INDIA','1999-04-14','39, Maharaja Nagar, Tirunelveli – 627011'),
('Nithish S','nithish.s35@gmail.com','9000000009','nithish@123','INDIA','2000-01-20','10, Vannarapettai, Tirunelveli – 627003'),
('Om Prakash','om.p36@gmail.com','9000000010','om@123','INDIA','1998-09-09','17, Palani Road, Dindigul – 624001'),
('Pravin Kumar','pravin.k37@gmail.com','9000000011','pravin@123','INDIA','1997-10-10','6, RM Colony, Dindigul – 624001'),
('Ramesh S','ramesh.s38@gmail.com','9000000012','ramesh@123','INDIA','1996-06-06','28, Natham Road, Dindigul – 624003'),
('Suresh B','suresh.b39@gmail.com','9000000013','suresh@123','INDIA','1995-05-05','14, Begampur, Dindigul – 624002'),
('Tharun V','tharun.v40@gmail.com','9000000014','tharun@123','INDIA','2001-12-12','30, Anna Nagar, Dindigul – 624001');


SELECT * FROM Customers;