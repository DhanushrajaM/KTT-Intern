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

SELECT * FROM vendors;
DROP TABLE vendors;
ALTER TABLE vendors ADD COLUMN is_active BOOlEAN DEFAULT TRUE;

