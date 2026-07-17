-- ==========================================================
-- Project  : Enterprise Sales Operations & Business Analysis Platform
-- Sprint   : Sprint 3
-- Story ID : ESOBA-22
-- Story    : Dashboard Dataset Preparation
-- Author   : P.B. Rohit
-- Database : enterprise_sales_operations
-- ==========================================================

USE enterprise_sales_operations;

-- ==========================================================
-- Dataset 1 : Executive KPI Dashboard
-- ==========================================================

SELECT
    ROUND(SUM(sales),2) AS Total_Sales,
    ROUND(SUM(profit),2) AS Total_Profit,
    SUM(quantity) AS Total_Quantity_Sold,
    ROUND(AVG(discount)*100,2) AS Average_Discount_Percentage,
    ROUND((SUM(profit)/SUM(sales))*100,2) AS Profit_Margin_Percentage
FROM sales_data;

-- ==========================================================
-- Dataset 2 : Monthly Sales Dashboard
-- ==========================================================

SELECT
    YEAR(order_date) AS Sales_Year,
    MONTHNAME(order_date) AS Month_Name,
    ROUND(SUM(sales),2) AS Total_Sales,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales_data
GROUP BY YEAR(order_date), MONTH(order_date), MONTHNAME(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

-- ==========================================================
-- Dataset 3 : Regional Dashboard
-- ==========================================================

SELECT
    region,
    ROUND(SUM(sales),2) AS Total_Sales,
    ROUND(SUM(profit),2) AS Total_Profit,
    SUM(quantity) AS Total_Quantity_Sold
FROM sales_data
GROUP BY region
ORDER BY Total_Sales DESC;

-- ==========================================================
-- Dataset 4 : Product Dashboard
-- ==========================================================

SELECT
    product_name,
    ROUND(SUM(sales),2) AS Total_Sales,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales_data
GROUP BY product_name
ORDER BY Total_Sales DESC;

-- ==========================================================
-- Dataset 5 : Profitability Dashboard
-- ==========================================================

SELECT
    category,
    ROUND(SUM(sales),2) AS Total_Sales,
    ROUND(SUM(profit),2) AS Total_Profit,
    ROUND((SUM(profit)/SUM(sales))*100,2) AS Profit_Margin_Percentage
FROM sales_data
GROUP BY category
ORDER BY Total_Profit DESC;

