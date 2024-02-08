-- Create tables
CREATE TABLE IF NOT EXISTS customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Pending'
);

CREATE TABLE IF NOT EXISTS order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL
);

-- Create views
CREATE VIEW order_summary AS
    SELECT o.order_id, c.first_name || ' ' || c.last_name AS customer_name, o.order_date, o.status
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id;

-- Sample data
INSERT INTO customers (first_name, last_name, email, phone_number) VALUES
    ('John', 'Doe', 'john.doe@email.com', '123-456-7890');

INSERT INTO products (name, description, price) VALUES
    ('Laptop', 'High-performance laptop with SSD', 999.99),
    ('Smartphone', 'Latest smartphone model', 599.99);

INSERT INTO orders (customer_id) VALUES (1);

INSERT INTO order_items (order_id, product_id, quantity, subtotal) VALUES
    (1, 1, 2, 1999.98),
    (1, 2, 1, 599.99);

-- Queries
-- 1. Get order details with customer names
SELECT * FROM order_summary;

-- 2. Get total sales
SELECT SUM(subtotal) AS total_sales FROM order_items;