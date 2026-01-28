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
   
   INSERT INTO hotels (Vendor_id,name,location,star_rating,total_rooms) 
   VALUES(1,'Sunrise Grand','chennai,tamilnadu',4,120);
   
   INSERT INTO hotel (hotel_name,hotel_location,star_rating,contact_info) 
   VALUES('CRT Hotel','salem,tamilnadu', 3,'8289282928'),
   ('SDS Hotel','madurai,tamilnadu',4,'9647383883');
   
   SELECT * FROM hotels;
   DROP TABLE hotels;

   