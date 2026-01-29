CREATE TABLE IF NOT EXISTS drivers_vehicles(
    id SERIAL PRIMARY KEY,
    Driver_id INT NOT NULL,
    Vehicle_id INT NOT NULL,
    assigned_from DATE DEFAULT CURRENT_DATE,
    assigned_to DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_driver FOREIGN KEY (Driver_id) REFERENCES drivers(id),
    CONSTRAINT fk_vehicle FOREIGN KEY (Vehicle_id) REFERENCES vehicles(id),
    CONSTRAINT unique_driver_vehicle UNIQUE (driver_id, vehicle_id, assigned_from)
);


CREATE OR REPLACE FUNCTION driverVehicleAvailability()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' OR (TG_OP = 'UPDATE' AND NEW.status = 'active') THEN
        UPDATE drivers
        SET available_status = FALSE
        WHERE id = NEW.driver_id;

        UPDATE vehicles
        SET available_status = FALSE
        WHERE id = NEW.vehicle_id;

    ELSIF TG_OP = 'UPDATE' AND NEW.status <> 'active' THEN
        UPDATE drivers
        SET available_status = TRUE
        WHERE id = NEW.driver_id;

        UPDATE vehicles
        SET available_status = TRUE
        WHERE id = NEW.vehicle_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER TrgdriverVehicleAvailability
AFTER INSERT OR UPDATE ON drivers_vehicles
FOR EACH ROW
EXECUTE FUNCTION driverVehicleAvailability();

INSERT INTO drivers_vehicles
(driver_id, vehicle_id, assigned_from, assigned_to, status)
VALUES(1, 4, '2025-01-01', '2025-12-31', 'Active'),
(2, 7, '2025-02-01', '2025-10-31', 'Active'),
(3, 2, '2025-03-15', '2025-09-15', 'Active'),
(4, 8, '2025-04-01', '2025-08-31', 'Active'),
(5, 4, '2025-01-10', '2025-12-31', 'Active'),
(6, 1, '2025-05-01', '2025-11-30', 'Active');


UPDATE drivers_vehicles SET status='Completed' WHERE id =1;

SELECT * FROM drivers_vehicles;

DROP TABLE drivers_vehicles;