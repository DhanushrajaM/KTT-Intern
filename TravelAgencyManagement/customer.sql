CREATE TABLE IF NOT EXISTS customers(
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
ALTER TABLE customers
RENAME COLUMN customer_id to id;
SELECT * FROM customers;

CREATE INDEX customerEmail_index ON customers(email);

INSERT INTO customers(name,email,phone,password,nationality
,DOB,address) VALUES('arun','arun@gmail.com',
'9383737332','arun@123','INDIA','2003-09-11','Chennai,tamilnadu'),
('barath',
'barath@gmail.com','barath@123','9282738722','INDIA','2002-02-12','salem,tamilnadu'),
('charan',
'charan@gmail.com','charan@123','3838873934','INDIA','2002-12-12','salem,tamilnadu'),
('dilip','dilip@gmail.com','dilip@123','8328782626','INDIA','2003-12-01','coimbatore,tamilnadu');

