CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE,
    price NUMERIC
);


CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products(product_id),
    quantity INTEGER
	
);
-- Ensure price is positive
ALTER TABLE products
ADD CONSTRAINT price_positive CHECK (price > 0);
-- Insert a product
INSERT INTO products (name, price) VALUES ('Laptop Stand', 45.00);

INSERT INTO products (name, price) VALUES ('mouse', 87);

-- Insert an order for that product
INSERT INTO orders (product_id, quantity) VALUES (1, 2);

--Insert a product with negative price
INSERT INTO products (name, price) VALUES ('keyboard', -84);


