CREATE TABLE subscribers (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL CHECK (username ~ '^[A-Z]'),
    password VARCHAR(20) NOT NULL CHECK (password ~ '^[0-9]+$'),
    email VARCHAR(100) NOT NULL CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
);

INSERT INTO subscribers (username, password, email) VALUES
('Lee', '123456', 'yendelee@tech.com'),
('Dave', '987654321', 'davek@gmail.com'),
('Courts', '20252025', 'courts2@codecollege.co.za');

SELECT * FROM subscribers

INSERT INTO subscribers (username, password, email) VALUES
('sipsip', '123456', 'sipsip@tech.com');