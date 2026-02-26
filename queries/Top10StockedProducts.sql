SELECT
    TOP 10 Products.product_name,
    SUM(Stocks.quantity) AS TotalQuantity,
    ROUND(SUM(Products.list_price * Stocks.quantity), 2) AS TotalValue
FROM
    Products
    INNER JOIN Stocks ON Products.product_id = Stocks.product_id
GROUP BY
    Products.product_name
ORDER BY
    SUM(Stocks.quantity) DESC;