CREATE TYPE status_type AS ENUM('Pending','Confirmed','Cancelled');
CREATE TABLE IF NOT EXISTS bookings(
    id SERIAL PRIMARY KEY,
    Customer_id INT NOT NULL,
    Package_id INT NOT NULL,
    booking_date DATE DEFAULT CURRENT_DATE,
    booking_seats INT NOT NULL CHECK(booking_seats>0),
    booking_status status_type DEFAULT 'Pending',
    total_amount DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking_customer FOREIGN KEY (Customer_id) REFERENCES customers(id),
    CONSTRAINT fk_booking_package FOREIGN KEY (Package_id) REFERENCES travelPackages(id)
);


CREATE OR REPLACE FUNCTION calculate_total_amount()
RETURNS TRIGGER AS $$
BEGIN
NEW.total_amount := NEW.booking_seats*(SELECT price FROM travelPackages WHERE id = NEW.package_id );
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER booking_total BEFORE INSERT OR UPDATE ON bookings 
 FOR EACH ROW
 EXECUTE FUNCTION calculate_total_amount();


 CREATE OR REPLACE FUNCTION updatePackageSeats()
 RETURNS TRIGGER AS $$
 DECLARE
  seatDiff INT;
 BEGIN
  IF TG_OP ='INSERT' THEN
     IF (SELECT seats_available FROM travelPackages WHERE id=NEW.Package_id)<NEW.booking_seats THEN 
        RAISE EXCEPTION 'Seats Not Available';
     END IF;
   
     UPDATE travelPackages SET seats_available = seats_available- NEW.booking_seats
     WHERE id = NEW.Package_id;

   ELSIF TG_OP='UPDATE' THEN
      seatDiff := NEW.booking_seats - OLD.booking_seats;
      IF seatDiff > 0 THEN
        IF (SELECT seats_available FROM travelPackages WHERE id = NEW.Package_id)<seatDiff THEN
          RAISE EXCEPTION 'Seats Are Not Available';
        END IF;

        UPDATE travelPackages SET seats_available = seats_available - seatDiff
        WHERE id = NEW.Package_id;

      END IF;
    END IF;
  RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

CREATE TRIGGER bookingSeatAjustment
BEFORE INSERT OR UPDATE OF booking_seats ON bookings
FOR EACH ROW
EXECUTE FUNCTION updatePackageSeats();


INSERT INTO bookings (customer_id,Package_id,booking_seats) VALUES(2,1,5);
INSERT INTO bookings (customer_id,package_id,booking_seats) VALUES(4,1,2);
UPDATE bookings SET booking_seats = 3 WHERE id =1;

UPDATE bookings SET booking_status='Confirmed' WHERE booking_id=1;
UPDATE bookings SET 
booking_seats = 3 WHERE booking_id=2;

SELECT * FROM bookings;

DROP TABLE bookings;