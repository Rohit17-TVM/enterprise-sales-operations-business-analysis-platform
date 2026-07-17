USE enterprise_sales_operations;

-- ==========================================================
-- Project  : Enterprise Sales Operations & Business Analysis Platform
-- Sprint   : Sprint 3
-- Story ID : ESOBA-21
-- Story    : SQL Query Optimization using CTEs
-- ==========================================================

WITH KPI_Summary AS
(
    SELECT
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        SUM(quantity) AS total_quantity,
        AVG(discount) AS average_discount
    FROM sales_data
)

SELECT

    ROUND(total_sales,2) AS Total_Sales,

    ROUND(total_profit,2) AS Total_Profit,

    total_quantity AS Total_Quantity_Sold,

    ROUND(average_discount * 100,2) AS Average_Discount_Percentage,

    ROUND((total_profit / total_sales) * 100,2) AS Profit_Margin_Percentage

FROM KPI_Summary;