CREATE TABLE IF NOT EXISTS products_menu (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price MONEY NOT NULL
);

CREATE TABLE IF NOT EXISTS cart (
    product_id INT PRIMARY KEY,
    qty INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products_menu(id)
);

CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS order_header (
    order_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS order_details (
    order_header_id INT NOT NULL,
    prod_id INT NOT NULL,
    qty INT NOT NULL,
    FOREIGN KEY (order_header_id) REFERENCES order_header(order_id),
    FOREIGN KEY (prod_id) REFERENCES products_menu(id)
);


--Question 2:Insert Sample Data
INSERT INTO products_menu (id, name, price) VALUES
(1, 'Coke', 10.00),
(2, 'Chips', 5.00);

INSERT INTO users (user_id, username) VALUES
(1, 'Arnold'),
(2, 'Sheryl');

SELECT * FROM products_menu;
SELECT * FROM users;


--Q3:Add Item to Cart
-- Add Coke (ProductId = 1)
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM cart WHERE product_id = 1) THEN
        UPDATE cart SET qty = qty + 1 WHERE product_id = 1;
    ELSE
        INSERT INTO cart (product_id, qty) VALUES (1, 1);
    END IF;
END $$;

-- Add Coke again
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM cart WHERE product_id = 1) THEN
        UPDATE cart SET qty = qty + 1 WHERE product_id = 1;
    ELSE
        INSERT INTO cart (product_id, qty) VALUES (1, 1);
    END IF;
END $$;

-- Add Chips (ProductId = 2)
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM cart WHERE product_id = 2) THEN
        UPDATE cart SET qty = qty + 1 WHERE product_id = 2;
    ELSE
        INSERT INTO cart (product_id, qty) VALUES (2, 1);
    END IF;
END $$;

-- View cart
SELECT * FROM cart;


--Question4: Remove Item from Cart
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM cart WHERE product_id = 1 AND qty > 1) THEN
        UPDATE cart SET qty = qty - 1 WHERE product_id = 1;
    ELSE
        DELETE FROM cart WHERE product_id = 1;
    END IF;
END $$;

-- View cart
SELECT * FROM cart;


--Question 5: Checkout
-- Insert into order_header
INSERT INTO order_header (user_id, order_date)
VALUES (1, NOW()) RETURNING order_id;

-- Use returned order_id in the insert below
INSERT INTO order_details (order_header_id, prod_id, qty)
SELECT 1, product_id, qty FROM cart;

-- Clear the cart
DELETE FROM cart;
SELECT * FROM order_header;
SELECT * FROM order_details;