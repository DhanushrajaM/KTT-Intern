CREATE TYPE vehicle_ownership AS ENUM('Owned','Rented');
CREATE TABLE IF NOT EXISTS vehicles(
    id SERIAL PRIMARY KEY,
    vehicle_number VARCHAR(30) NOT NULL,
    vehicle_type VARCHAR(30) NOT NULL,
    ownership_type vehicle_ownership NOT NULL,
    seating_capacity INT CHECK(seating_capacity>0),
    Vendor_id INT NOT NULL,
    available_status BOOlEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_vehicle_vendor FOREIGN KEY (Vendor_id) REFERENCES vendors(id) 
);

INSERT INTO vehicles
(vehicle_number, vehicle_type, ownership_type, seating_capacity, vendor_id, available_status)
VALUES
('TN10AB1234', 'Bus', 'Owned', 5, 6),
('TN22CD5678', 'Car', 'Rented', 7, 6),
('TN14EF9012', 'Car', 'Owned', 4, 6),
('KA05GH3456', 'Bus', 'Rented', 5, 7),
('KA51IJ7890', 'Van', 'Rented', 12, 7),
('KA01KL2345', 'Bus', 'Owned', 20, 7),
('KL07MN6789', 'Car', 'Owned', 7, 8),
('KL11OP1122', 'Van', 'Rented', 8, 8),
('AP09QR3344', 'Bus', 'Owned', 40, 8),
('TS08ST5566', 'Car', 'Rented', 5, 8);

UPDATE vehicles SET available_status ='True';

SELECT * FROM vehicles;