USE ecommerce_sales_analysis;

-- =====================================================
-- 08.ADVANCE SQL
-- =====================================================


-- Question: Calculate each customer's cumulative revenue over time and identify the top 10 highest cumulative-revenue records.


  WITH Revenue AS (
        SELECT * , 
        ROUND(Unit_Price * Quantity *(1-`Discount_%`/100),2) AS revenue 
        FROM finalecommerce
        WHERE Order_Status='Delivered'
  ),
  Customer_revenue AS (
          SELECT Customer_ID , 
          Order_Date,
          ROUND(SUM(revenue),2) AS Net_revenue 
          FROM 
          Revenue
          GROUP BY Customer_ID , Order_Date
  ),
  Cumulative AS(
     SELECT * , 
     ROUND(SUM(Net_revenue) OVER( PARTITION BY Customer_ID ORDER BY Order_Date 
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW),2) AS Cumulative_revenue 
                         FROM Customer_revenue 
	)
    SELECT * FROM Cumulative 
           ORDER BY Cumulative_revenue DESC 
           LIMIT 10 ;
           
           
           
-- TOP 3 CUSTOMERS IN EACH REGIONS


    WITH Revenue AS (
         SELECT * , 
         ROUND(Unit_Price * Quantity *(1-`Discount_%`/100),2) AS revenue 
         FROM finalecommerce
         WHERE Order_Status='Delivered'
    ),
    Customer_revenue AS (
             SELECT 
                 Customer_ID , 
                 Region , 
                 ROUND(SUM(revenue),2) AS Net_revenue 
                 FROM Revenue 
                 GROUP BY Customer_ID , Region 
    ),
    r AS (
        SELECT * , 
        RANK() OVER(PARTITION BY Region ORDER BY Net_revenue DESC ) AS revenue_rank 
        FROM Customer_revenue
    )
    SELECT * FROM r 
		WHERE revenue_rank <=3;
        


    
    
    
    
    