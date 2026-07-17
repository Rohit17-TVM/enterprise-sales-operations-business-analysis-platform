USE enterprise_sales_operations;

-- ==========================================================
-- Project  : Enterprise Sales Operations & Business Analysis Platform
-- Sprint   : Sprint 3
-- Story ID : ESOBA-17
-- Story    : Analyze Monthly Sales Trends
-- Author   : P.B. Rohit
-- ==========================================================

WITH Monthly_Sales AS
(
    SELECT
        YEAR(order_date) AS sales_year,
        MONTH(order_date) AS sales_month,
        MONTHNAME(order_date) AS month_name,

        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        SUM(quantity) AS total_quantity,
        AVG(discount) AS average_discount

    FROM sales_data

    GROUP BY
        YEAR(order_date),
        MONTH(order_date),
        MONTHNAME(order_date)
)

SELECT

    sales_year                              AS Sales_Year,
    sales_month                             AS Month_Number,
    month_name                              AS Month_Name,

    ROUND(total_sales,2)                    AS Total_Sales,
    ROUND(total_profit,2)                   AS Total_Profit,

    total_quantity                          AS Total_Quantity_Sold,

    ROUND(average_discount*100,2)           AS Average_Discount_Percentage,

    ROUND((total_profit/total_sales)*100,2) AS Profit_Margin_Percentage

FROM Monthly_Sales

ORDER BY
sales_year,
sales_month;