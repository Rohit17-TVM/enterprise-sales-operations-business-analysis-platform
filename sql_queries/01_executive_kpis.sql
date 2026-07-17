USE enterprise_sales_operations;
SELECT
    ROUND(SUM(sales),2) AS Total_Sales,
    ROUND(SUM(profit),2) AS Total_Profit,
    SUM(quantity) AS Total_Quantity_Sold,
    ROUND(AVG(discount)*100,2) AS Average_Discount_Percentage,
    ROUND((SUM(profit)/SUM(sales))*100,2) AS Profit_Margin_Percentage
FROM sales_data;