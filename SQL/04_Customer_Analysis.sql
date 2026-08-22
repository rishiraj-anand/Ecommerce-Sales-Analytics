USE ecommerce_sales_analysis;


-- =====================================================
-- 4.CUSTOMER ANALYTICS
-- =====================================================


-- Question: First Delivered Order Date for every customers

SELECT 
      Customer_ID , 
      MIN(Order_Date) AS First_Order_Date 
      FROM 
			finalecommerce WHERE Order_Status='Delivered'
            GROUP BY Customer_ID ;
            
            
-- Questions: No of Customers acquired each month


WITH First_Order AS (
         SELECT Customer_ID , 
         MIN(Order_Date) AS First_Order_Date 
         FROM finalecommerce
         WHERE Order_Status='Delivered'
         GROUP BY Customer_ID
)
   SELECT 
        YEAR(First_Order_Date) AS years , 
        MONTH(First_Order_Date) AS Month_no , 
        MONTHNAME(First_Order_Date) AS Month_name ,
        COUNT(DISTINCT Customer_ID) AS New_Customers 
        FROM First_Order 
        GROUP BY 
        YEAR(First_Order_Date),
        MONTH(First_Order_Date),
        MONTHNAME(First_Order_Date)
        ORDER BY years, month_no ;





-- Question: Customers who placed more than one delivered order


SELECT 
     Customer_ID , 
     COUNT( DISTINCT Order_ID ) as Total_orders 
     FROM 
        finalecommerce WHERE Order_Status='Delivered'
        GROUP BY Customer_ID 
        HAVING COUNT( DISTINCT Order_ID)>1;


-- Questions: Repeat customer rate


WITH Customer_Orders AS (
    SELECT
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS Order_Count
    FROM finalecommerce
    WHERE Order_Status = 'Delivered'
    GROUP BY Customer_ID
)
SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Order_Count > 1 THEN 1 ELSE 0 END) AS Repeat_Customers,
    ROUND(
        SUM(CASE WHEN Order_Count > 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Repeat_Customer_Rate
FROM Customer_Orders;


-- Question:Find customers whose total revenue is above the average customer revenue



WITH Revenue AS (
          SELECT * , 
          ROUND(Unit_Price * Quantity*(1-`Discount_%`/100),2) as revenue 
          FROM finalecommerce
          WHERE Order_Status='Delivered'
),
Customer_revenue AS (
			SELECT Customer_ID , 
              SUM(revenue) AS Net_revenue , 
              ROUND(SUM(revenue)*100.0/(
              SELECT SUM(revenue) FROM Revenue
              ),2) AS revenue_contribution_pct 
              FROM Revenue
                   GROUP BY Customer_ID
)
SELECT * FROM Customer_revenue 
                    WHERE Net_revenue > (
           SELECT AVG(Net_revenue) 
           FROM Customer_revenue
                    );
                    
                    
                    
-- Customer-level purchase behavior: orders, quantity, revenue, and AOV


WITH Clean_Data  AS (
            SELECT * , 
            ROUND(Unit_Price * Quantity *(1-`Discount_%`/100),2) AS revenue 
            FROM finalecommerce
				WHERE Order_Status='Delivered'
),
Customer_analysis AS (
             SELECT Customer_ID , 
             COUNT( DISTINCT Order_ID) AS Total_Orders , 
             SUM(Quantity) AS Total_quantity_purchased , 
             ROUND(SUM(revenue),2) AS Net_revenue , 
             ROUND(SUM(revenue)/COUNT(DISTINCT Order_ID),2) AS AOV 
             FROM Clean_Data 
             GROUP BY Customer_ID
)
SELECT * FROM Customer_analysis 
  ORDER BY Net_revenue DESC 
  LIMIT 10;


