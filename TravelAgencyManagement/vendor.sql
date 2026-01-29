CREATE TABLE IF NOT EXISTS vendors(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    vendor_type VARCHAR(50) NOT NULL,
    contact_info TEXT,
    rating DECIMAL(2,1) CHECK(rating BETWEEN 0 AND 5),
    is_active BOOlEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    
);

CREATE INDEX vendorType_index ON vendors(vendor_type);

INSERT INTO vendors(name,vendor_type,contact_info,rating)
VALUES('Sunrise Hotels','hotel','sunrise@hotel.com, +91-9876543210',4.6);

INSERT INTO vendors
(name, vendor_type, contact_info, rating, is_active)
VALUES
('Oceanic Stays Pvt Ltd', 'hotel', 'contact@oceanicstays.com, +91-9000022222', 4.2, TRUE),
('Metro Inns & Suites', 'hotel', 'metroinns@gmail.com, +91-9000033333', 3.9, TRUE),
('Hilltop Resorts', 'hotel', 'hilltop@resorts.com, +91-9000044444', 4.6, TRUE),
('Royal Orchid Group', 'hotel', 'royalorchid@hotels.com, +91-9000055555', 4.7, TRUE),
('FastTrack Fleet Services', 'vehicle', 'fasttrack@fleet.com, +91-9111111111', 4.4, TRUE),
('Urban Ride Solutions', 'vehicle', 'urbanride@solutions.com, +91-9222222222', 4.1, TRUE),
('Highway Transport Co.', 'vehicle', 'highway@transport.com, +91-9333333333', 4.6, TRUE),
('Spice Route Caterers', 'food', 'spiceroute@caterers.com, +91-9444444444', 4.3, TRUE),
('Daily Meal Services', 'food', 'dailymeals@food.com, +91-9555555555', 4.0, TRUE),
('Royal Feast Kitchens', 'food', 'royalfeast@kitchen.com, +91-9666666666', 4.8, FALSE);

SELECT * FROM vendors;
DROP TABLE vendors;
ALTER TABLE vendors ADD COLUMN is_active BOOlEAN DEFAULT TRUE;

