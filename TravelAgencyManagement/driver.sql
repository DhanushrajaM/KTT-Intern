CREATE TABLE IF NOT EXISTS drivers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    license_number VARCHAR(50) NOT NULL UNIQUE ,
    license_expiry DATE NOT NULL,
    experience_years INT,
    available_status BOOlEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO drivers
(name, phone, license_number, license_expiry, experience_years, available_status)
VALUES
('Babu', '9232827762', 'TN1020150001234', '2030-08-12', 8),
('Siva', '8272767267', 'TN2220170002345', '2035-09-25', 10),
('Murugan', '6726276268', 'TN1420120003456', '2028-11-11', 6),
('Sakthi', '8712876121', 'TN0920200004567', '2048-12-21', 4),
('Ramesh', '9123456781', 'KA0520140005678', '2032-05-14', 9),
('Karthik', '9123456782', 'KA0120160006789', '2034-03-22', 7),
('Arun', '9123456783', 'KL0720180007890', '2031-07-19', 5),
('Vignesh', '9123456784', 'TN1020190008901', '2036-10-30', 6),
('Prakash', '9123456785', 'AP0920130009012', '2029-02-18', 11),
('Senthil', '9123456786', 'TS0820150010123', '2033-06-09', 8),
('Ganesh', '9123456787', 'KA5120170011234', '2037-01-27', 5),
('Manikandan', '9123456788', 'TN1420110012345', '2028-09-03', 12);

UPDATE drivers SET available_status ='True';
SELECT * FROM drivers;