SELECT
    TOP 10 Stores.store_name,
    Stores.store_id,
    ROUND(
        Sum(
            (Order_items.list_price * quantity) * (1 - Order_items.discount)
        ),
        2
    ) AS TotalSalesofProduct
FROM
    Stores
    INNER JOIN (
        Order_items
        INNER JOIN Orders ON Order_items.order_id = Orders.order_id
    ) ON Stores.store_id = Orders.store_id
GROUP BY
    Stores.store_name,
    Stores.store_id
ORDER BY
    Sum(
        (Order_items.list_price * quantity) * (1 - Order_items.discount)
    ) DESC;