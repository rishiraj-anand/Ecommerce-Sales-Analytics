USE ecommerce_sales_analysis;
-- =====================================================
-- E-COMMERCE SALES ANALYSIS
-- =====================================================
-- =====================================================
-- 1. KPI ANALYSIS
-- =====================================================

-- Question 1: Total Orders , Delivered Orders , Cancelled , Returned , Pending Orders 

SELECT count(DISTINCT Order_ID ) as Total_orders_placed , 
SUM( CASE WHEN Order_Status='Delivered' THEN  1 ELSE 0 END) AS Total_delivered_orders , 
SUM( CASE WHEN Order_Status='Cancelled' THEN 1 ELSE 0 END)  AS Total_cancelled_orders ,
SUM(CASE WHEN Order_Status= 'Returned' THEN 1 ELSE 0 END) AS Total_returned_orders , 
SUM(CASE WHEN Order_Status ='Pending' THEN 1 ELSE 0 END) AS Total_pending_orders FROM 
finalecommerce;


-- Question 2: Orders Delivery rate , Cancellation , Returned , Pending rate 

SELECT ROUND(
(SUM(CASE WHEN Order_Status='Delivered' THEN 1 ELSE 0 END)*100.0)/COUNT(*),2) AS Delivery_rate_pct , 
ROUND( 
(SUM(CASE WHEN Order_Status='Cancelled' THEN 1 ELSE 0 END)*100.0)/COUNT(*),2) AS Cancellation_rate_pct , 
ROUND( 
(SUM(CASE WHEN Order_Status='Returned' THEN 1 ELSE 0 END)*100.0)/COUNT(*),2) AS Return_rate_pct , 
ROUND( 
(SUM(CASE WHEN Order_Status='Pending' THEN 1 ELSE 0 END)*100.0)/COUNT(*),2) AS Pending_rate_pct
from finalecommerce;


-- Questions 3: Total Quantity Sold , Total Unique Customers , AOV 

SELECT SUM(Quantity) AS Total_quantity_sold , 
COUNT(DISTINCT Customer_ID ) AS Total_unique_customers , 
ROUND(SUM(Unit_Price * Quantity*(1-`Discount_%`/100))/COUNT(DISTINCT Order_ID ),2) AS AOV FROM 
finalecommerce WHERE Order_Status='Delivered'


-- Question 4 : Gross Revenue , Net revenue , Discount Amount for Delivered orders 

SELECT ROUND(SUM(Unit_Price * Quantity),2) AS Gross_revenue , 
ROUND(SUM(Unit_Price * Quantity*`Discount_%`/100),2) AS Total_discount_amount,
ROUND(SUM(Unit_Price * Quantity*(1-`Discount_%`/100)),2) AS Net_revenue
FROM finalecommerce WHERE Order_Status='Delivered'


-- Question 5: Avg Selling Price (ASP) and Avg Discount Percentage

SELECT ROUND(SUM(Unit_Price * Quantity*(1-`Discount_%`/100))/SUM(Quantity),2) AS ASP , 
ROUND(AVG(`Discount_%`),2) AS Avg_Discount FROM 
finalecommerce WHERE Order_Status='Delivered'




