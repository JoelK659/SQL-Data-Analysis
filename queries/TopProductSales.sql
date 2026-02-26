SELECT
    TOP 10 Products.product_name,
    Products.product_id,
    ROUND(
        Sum(
            (Order_items.list_price * quantity) * (1 - Order_items.discount)
        ),
        2
    ) AS TotalSalesofProduct
FROM
    (
        Products
        INNER JOIN Order_items ON Products.product_id = Order_items.product_id
    )
    INNER JOIN Orders ON Order_items.order_id = Orders.order_id
GROUP BY
    Products.product_name,
    Products.product_id
ORDER BY
    Sum(
        (Order_items.list_price * quantity) * (1 - Order_items.discount)
    ) DESC;