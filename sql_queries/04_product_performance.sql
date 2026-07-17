USE enterprise_sales_operations;

-- ==========================================================
-- Project  : Enterprise Sales Operations & Business Analysis Platform
-- Sprint   : Sprint 3
-- Story ID : ESOBA-19
-- Story    : Analyze Product Performance
-- ==========================================================

WITH Product_Performance AS
(
    SELECT

        product_name,

        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        SUM(quantity) AS total_quantity,
        AVG(discount) AS average_discount

    FROM sales_data

    GROUP BY product_name
)

SELECT

    product_name AS Product_Name,

    ROUND(total_sales,2) AS Total_Sales,

    ROUND(total_profit,2) AS Total_Profit,

    total_quantity AS Total_Quantity_Sold,

    ROUND(average_discount * 100,2) AS Average_Discount_Percentage,

    ROUND((total_profit / total_sales) * 100,2) AS Profit_Margin_Percentage

FROM Product_Performance

ORDER BY Total_Sales DESC;