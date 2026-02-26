# SQL Data Analysis
This project contains a Microsoft Access database that analyzes a bike store's sales data. Queries include calculation the total sales per store, finding which stores have the highest sales, and listing the product names and quantity on hand for the 10 products with the most stock on hand.

## Project Goals
- Identify the top stores by total sales.
- Aggregate sales data across all orders and order items.
- Provide clear, rounded totals for reporting and analysis.

## Features
- Calculates total sales per store: `SUM((list_price * quantity) * (1 - discount))`
- Returns the top stores by total sales
- Results rounded to 2 decimal places for readability
- Built using Microsoft Access SQL with `INNER JOIN`s and aggregation

## Database Structure
- **Brands**: Contains brand information (`brand_id(PK)`, `brand_name`)
- **Categories**: Contains categpry information (`category_id(PK)`, `category_name`)
- **Customers**: Contains customer information (`customer_id(PK)`, `first_name`, `last_name`, `phone`, `email`, etc.)
- **Order_items**: Contains individual order item details (`order_id(PK, FK)`,`item_id`, `product_id(FK)`, `quantity`, `list_price`, `discount`)
- **Orders**: Contains individual order details (`order_id(PK)`,`customer_id(FK)`, `order_status`, `order_date`, etc.)
- **Products**: (`product_id(PK)`,`product_name`, `brand_id(FK)`, `category_id(FK)`, `model_year`, `list_price`, `discount`)
- **Staffs**: (`staff_id(PK)`,`first_name`, `last_name`, `email`, `store_id(FK)`, etc.)
- **Stocks**: (`store_id(PK, FK)`, `product_id(PK, FK)`, `quantity`)
- **Stores**: (`store_id(PK)`, `store_name`,  `phone`, `email`, etc.)

## Example Query
Adds the total value of the stock on hand to the list of the product_names and quantity on hand for the 10 products with the most stock on hand (multiplies price with quantity).
SELECT TOP 10 Products.product_name, Stocks.quantity, Sum(Products.list_price * Stocks.quantity) AS TotalValue
FROM Products INNER JOIN Stocks ON Products.product_id = Stocks.product_id
GROUP BY Products.product_name, Stocks.quantity
HAVING (((Stocks.quantity)>=(SELECT MIN(quantity)
FROM Stocks
)))
ORDER BY Stocks.quantity DESC;

Output:
<img width="975" height="696" alt="image" src="https://github.com/user-attachments/assets/3d3fc9d3-6b57-44b9-b306-8a8c02ddb985" />

Other Queries: See the queries/ folder for additional scripts.

## How to Use
1. Open the provided BikeStore.accdb file in Microsoft Access.
2. Navigate to the Queries section.
3. Open each of the queries to see the output

## Notes
- All calculations account for discounts on individual items.
- Totals are displayed with up to 2 decimal places.
- Query structure is optimized for readability and Access compatibility.

This project demonstrates relational database design, SQL aggregation, and query-based reporting to analyze store sales using Microsoft Access.
