CREATE TYPE user_role AS ENUM ('Admin','Manager','Agent');
CREATE INDEX userEmail_index ON users(email);
ALTER TYPE user_role ADD VALUE 'Manager' AFTER 'Admin';
CREATE TABLE IF NOT EXISTS users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') UNIQUE,
    password VARCHAR(50),
    role user_role DEFAULT 'Agent',
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

INSERT INTO users(name,email,password,role,phone)
VALUES('raja','raja@gmail.com','12345','Admin','9876382342');

INSERT INTO users(name,email,password,role,phone)
VALUES('divraj','divjraj@gmail.com','12345','Agent','9823782762');

UPDATE users SET email ='raja@gmail.com' WHERE user_id=1;

SELECT * FROM users;
SELECT * FROM users WHERE  id =1;
DROP TABLE users;