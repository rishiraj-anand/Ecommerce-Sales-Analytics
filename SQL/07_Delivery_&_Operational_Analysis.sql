USE ecommerce_sales_analysis;


-- =====================================================
-- 07.DELIVERY & OPERATIONAL ANALYSIS
-- =====================================================


-- AVG DELIVERY TIME IN DAYS FOR DELIVERED ORDERS

SELECT 
     ROUND(AVG(DATEDIFF(Delivery_Date , Order_Date)),2) AS Avg_Delivery_Days 
     FROM finalecommerce
     WHERE Order_Status='Delivered'
     AND Delivery_Date IS NOT NULL;
     
     
     
     
-- Which cities have the highest average delivery time for delivered orders?

  SELECT 
       City , 
       COUNT(DISTINCT Order_ID) AS Total_Delivered_Orders , 
       ROUND(AVG(DATEDIFF(Delivery_Date , Order_Date)),2) AS Avg_Delivery_Days 
       FROM finalecommerce
       WHERE Order_Status='Delivered'
       AND Delivery_Date  IS NOT NULL 
       GROUP BY City  
       ORDER BY Avg_Delivery_Days DESC ;
       
       
       