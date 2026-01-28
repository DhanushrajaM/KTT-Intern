CREATE TABLE IF NOT EXISTS travelPackages(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    source VARCHAR(100),
    destination VARCHAR(100),
    duration_days INTEGER,
    price DECIMAL(10,2),
    seats_available INTEGER,
    travel_start_date DATE,
    travel_end_date DATE,
    description TEXT,
    Created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_created_by FOREIGN KEY (Created_by) REFERENCES users(id)
);

ALTER TABLE travelPackage RENAME TO travelPackages;
CREATE OR REPLACE FUNCTION check_user_role()
RETURNS TRIGGER AS $$
DECLARE 
    user_role user_role;
BEGIN
  SELECT role INTO user_role FROM users WHERE id = NEW.Created_by;
  IF user_role IS NULL THEN
      RAISE EXCEPTION 'the role is null'; 
  ELSEIF user_role <> 'Admin' THEN
      RAISE EXCEPTION 'DO not have the access';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql; 

CREATE TRIGGER role_access BEFORE 
INSERT OR UPDATE ON travelPackages
FOR EACH ROW
EXECUTE FUNCTION check_user_role();


INSERT INTO travelPackages(name,source,destination,duration_days,
price,seats_available,travel_start_date,travel_end_date,description,
Created_by) VALUES (
    'Kerala Backwaters Tour',
    'chennai,tamilnadu',
    'Kerala, India',
    3,
    15000.00,
    47,
    '2026-03-21',
    '2026-03-24',
    'Experience trekking, camping, and mountain views in Manali.',
    2
);
DROP TABLE travelPackages;

SELECT * FROM travelpackages;
UPDATE travelPackages SET seats_available = 40 WHERE id =1;
INSERT INTO travelPackages(name,source,destination,duration_days,
price,seats_available,travel_start_date,travel_end_date,description,
Created_by) VALUES('Goa Beach Holiday','Salem,Tamilnadu','Goa,India',5,29499.00,45,
'2026-02-07','2026-02-12','Enjoy beautiful beaches, nightlife, and water sports in Goa.',
1
);
