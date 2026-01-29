CREATE TABLE IF NOT EXISTS hotels(
   id SERIAL PRIMARY KEY,
   Vendor_id INT,
   name VARCHAR(100) NOT NULL,
   location VARCHAR(100) NOT NULL,
   star_rating INT CHECK(star_rating BETWEEN 1 AND 5),
   total_rooms INT CHECK(total_rooms>0),
   is_active BOOlEAN DEFAULT TRUE,
   Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   CONSTRAINT fk_vendor_id FOREIGN KEY (Vendor_id) REFERENCES vendors(id)
   );
   
INSERT INTO hotels
(vendor_id, name, location, star_rating, total_rooms, is_active)
VALUES
(1, 'Sunrise Grand', 'Chennai, Tamil Nadu', 4, 120, TRUE),
(1, 'Sunrise Elite', 'Chennai, Tamil Nadu', 5, 80, TRUE),
(2, 'Ocean View Residency', 'Pondicherry', 3, 60, TRUE),
(2, 'Palm Breeze Hotel', 'Pondicherry', 4, 95, TRUE),
(3, 'City Comfort Inn', 'Bengaluru, Karnataka', 3, 70, TRUE),
(3, 'Metro Plaza', 'Bengaluru, Karnataka', 4, 110, FALSE),
(4, 'Hilltop Retreat', 'Ooty, Tamil Nadu', 5, 45, TRUE),
(4, 'Misty Valley Lodge', 'Ooty, Tamil Nadu', 4, 55, TRUE),
(5, 'Royal Orchid Suites', 'Hyderabad, Telangana', 5, 150, TRUE),
(5, 'Urban Stay Hotel', 'Hyderabad, Telangana', 3, 90, TRUE);

   
   SELECT * FROM hotels;
   DROP TABLE hotels;

   