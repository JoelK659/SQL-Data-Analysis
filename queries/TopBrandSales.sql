SELECT
    Brands.brand_name,
    Brands.brand_id,
    ROUND(
        Sum(
            (Order_items.list_price * quantity) * (1 - Order_items.discount)
        ),
        2
    ) AS TotalSalesofBrand
FROM
    Brands
    INNER JOIN (
        (
            Order_items
            INNER JOIN Orders ON Order_items.order_id = Orders.order_id
        )
        INNER JOIN Products ON Order_items.product_id = Products.product_id
    ) ON Brands.brand_id = Products.brand_id
GROUP BY
    Brands.brand_name,
    Brands.brand_id
ORDER BY
    Sum(
        (Order_items.list_price * quantity) * (1 - Order_items.discount)
    ) DESC;