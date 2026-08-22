USE ecommerce_sales_analysis;

-- =====================================================
-- 3. ORDERS AND BUSINESS PERFORMANCE ANALYSIS
-- =====================================================


-- Q1- Calculating total revenue , Delivered , Returned , Cancelled and Pending Revenues 

SELECT  ROUND(SUM(Unit_Price * Quantity *(1-`Discount_%`/100)),2) AS Total_revenue_Generated , 
       SUM(CASE WHEN Order_Status='Delivered' THEN ROUND(Unit_Price * Quantity *(1-`Discount_%`/100),2)  ELSE 0 END) AS Delivered_revenue , 
       SUM(CASE WHEN Order_Status='Cancelled' THEN ROUND(Unit_Price * Quantity *(1-`Discount_%`/100),2) ELSE 0 END) AS Revenue_loss_from_Cancelled_orders , 
       SUM(CASE WHEN Order_Status='Returned' THEN ROUND(Unit_Price * Quantity *(1-`Discount_%`/100),2) ELSE 0 END) AS  Revenue_loss_from_Returned_orders , 
       SUM(CASE WHEN Order_Status = 'Pending' THEN ROUND(Unit_Price * Quantity *(1-`Discount_%`/100),2) ELSE 0 END ) AS Revenue_loss_from_Pending_orders 
       FROM finalecommerce ;
       


-- Q2	Compare Delivered ,Cancelled , Returned and pending order by count and percentage


SELECT
    Order_Status,
    COUNT(DISTINCT Order_ID) AS Order_Count,
    ROUND(
        COUNT(DISTINCT Order_ID) * 100.0 /
        (SELECT COUNT(DISTINCT Order_ID) FROM finalecommerce),
        2
    ) AS Order_Percentage
FROM finalecommerce
WHERE Order_Status IN ('Delivered', 'Cancelled', 'Returned', 'Pending')
GROUP BY Order_Status
ORDER BY Order_Count DESC;




-- Q3 Month Orders Trends

SELECT 
    YEAR(Order_Date) AS Years ,
    MONTH(Order_Date) AS Months , 
    MONTHNAME(Order_Date ) as Month_name , 
    COUNT(DISTINCT Order_Id) as Order_Count 
    FROM 
    finalecommerce WHERE Order_Status='Delivered'
    GROUP BY 
    YEAR(Order_date) , 
    MONTH(Order_date) , 
    MONTHNAME(Order_Date) 
    ORDER BY Order_Count DESC 
    LIMIT 1 ;

