# SQL_ASSIGNMENT_SARAH
#SQL_ASSIGNMENT of SARAH, CANTEK

# E-commerce Database

This database is designed for managing e-commerce data, including customers, products, orders, and order items.

## Tables

1. **Customers:** Stores customer information.
2. **Products:** Contains product details.
3. **Orders:** Manages order information.
4. **Order_Items:** Tracks individual items in an order.

## Views

1. **Order_Summary:** Provides a summary of orders with customer names.

## Queries

1. **Get order details with customer names:**
    SELECT * FROM order_summary;
    

2. **Get total sales:**
    SELECT SUM(subtotal) AS total_sales FROM order_items;
    

## How to Use

1. Execute the `ecommerce_database.sql` script in your database management tool to create tables, views, and sample data.
2. Then use the provided queries to retrieve useful information.
3. If anyone want to update the database, they can do it by adding more data or modifying existing records as needed.
