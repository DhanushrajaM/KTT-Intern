CREATE TYPE user_role AS ENUM ('Admin','Manager','Agent');
CREATE INDEX userEmail_index ON Users(email);
CREATE TABLE IF NOT EXISTS Users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') UNIQUE,
    password VARCHAR(50),
    role user_role DEFAULT 'Agent',
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

INSERT INTO Users(name,email,password,role,phone)
VALUES('Raja','raja@gmail.com','12345','Admin','9876382342'),
('Divraj','divraj@gmail.com','12345','Agent','9823782762'),
('Kavin','kavin@gmail.com','12345','Manager','9876123456'),
('Ashwin','ashwin@gmail.com','12345','Agent','9812345678'),
('Naveen','naveen@gmail.com','12345','Agent','9876543210'),
('Pradeep','pradeep@gmail.com','12345','Manager','9823456789'),
('Suresh','suresh@gmail.com','12345','Admin','9834567890'),
('Vikram','vikram@gmail.com','12345','Agent','9845678901'),
('Manoj','manoj@gmail.com','12345','Manager','9856789012'),
('Arjun','arjun@gmail.com','12345','Agent','9867890123'),
('Lokesh','lokesh@gmail.com','12345','Agent','9878901234'),
('Ramesh','ramesh@gmail.com','12345','Manager','9889012345'),
('Ganesh','ganesh@gmail.com','12345','Agent','9890123456'),
('Karthik','karthik@gmail.com','12345','Admin','9801234567'),
('Dinesh','dinesh@gmail.com','12345','Agent','9812345670'),
('Hemanth','hemanth@gmail.com','12345','Manager','9823456701'),
('Pravin','pravin@gmail.com','12345','Agent','9834567012'),
('Sathish','sathish@gmail.com','12345','Agent','9845670123'),
('Tharun','tharun@gmail.com','12345','Manager','9856701234'),
('Ajith','ajith@gmail.com','12345','Agent','9867012345');


SELECT * FROM Users;
DROP TABLE users;