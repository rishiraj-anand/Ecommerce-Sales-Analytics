USE ecommerce_sales_analysis;

-- =====================================================
-- 05 PRODUCT & CATEGORY ANALYSIS
-- =====================================================



-- TOP 10 Product by Quantity Sold

SELECT 
      Product_Name , 
      SUM(Quantity) AS Total_Quantity_Sold ,
      ROUND(SUM(Unit_Price *Quantity*(1-`Discount_%`/100)),2) AS Net_revenue
      FROM 
      finalecommerce  WHERE Order_Status='Delivered'
      GROUP BY Product_Name
      ORDER BY Total_Quantity_Sold DESC 
      LIMIT 10 ;



-- TOP10 Products by Delivered revenue


      WITH Revenue AS (
               SELECT * , 
               ROUND(Unit_Price * Quantity *(1-`Discount_%`/100),2) AS revenue 
               FROM finalecommerce
               WHERE Order_Status='Delivered'
      ),
      Product_revenue AS(
              SELECT Product_Name , 
              ROUND(SUM(revenue),2) AS Net_revenue , 
              ROUND(SUM(revenue)*100.0/(
              SELECT SUM(revenue) FROM Revenue
              ),2) AS revenue_contribution_pct 
              FROM Revenue 
              GROUP BY Product_Name 
      ),
      Product_rank AS (
           SELECT * , 
           RANK() OVER(ORDER BY Net_revenue DESC) AS revenue_rank 
           FROM Product_revenue
      )
      SELECT * FROM Product_rank 
      WHERE revenue_rank <=10;
      



-- TOP 3 PRODUCTS IN EACH CATEGORY BY REVENUE


       WITH Revenue AS (
          SELECT * , 
          ROUND(Unit_Price * Quantity *(1-`Discount_%`/100),2) AS revenue 
          FROM finalecommerce
          WHERE Order_Status='Delivered'
       ),
       c AS (
          SELECT 
          Category , Product_Name , 
          ROUND(SUM(revenue),2) AS Net_revenue 
          FROM Revenue 
          GROUP BY Category , 
				Product_Name
       ),
       r  AS (
             SELECT * , 
             DENSE_RANK() OVER(PARTITION BY Category ORDER BY Net_revenue DESC ) AS rn 
             FROM c
       )
       SELECT * FROM r 
                 WHERE rn<=3 ;




-- Category Performance — Orders, Quantity, Revenue, AOV & Discount


       WITH Clean_Data AS (
       SELECT * , 
       ROUND(Unit_Price * Quantity *(1-`Discount_%`/100),2) AS revenue 
       FROM finalecommerce 
       WHERE Order_Status='Delivered'
       ),
	category_performance AS (
             SELECT 
                Category , 
                COUNT( DISTINCT Order_ID ) AS Total_Orders , 
                SUM(Quantity) AS Total_Quantity_Sold , 
                ROUND(AVG(`Discount_%`),2) AS Avg_Discount,
                ROUND(SUM(revenue),2) AS Net_revenue , 
                ROUND(SUM(revenue)/COUNT(DISTINCT Order_ID),2) AS AOV 
                FROM Clean_Data 
                GROUP BY Category
    ),
    r AS (
          SELECT * , 
          RANK() OVER( ORDER BY Net_revenue DESC ) AS revenue_rank 
          FROM Category_Performance
          )
	SELECT * FROM r ;




