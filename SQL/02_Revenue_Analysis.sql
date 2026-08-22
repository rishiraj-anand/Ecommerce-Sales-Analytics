USE ecommerce_sales_analysis;
-- =====================================================
-- REVENUE ANALYSIS
-- =====================================================


-- Calculate monthly revenue and display it chronologically.

SELECT YEAR(Order_Date) AS years , 
MONTH(Order_Date) AS month_no , 
MONTHNAME(Order_Date) AS month_name , 
ROUND(SUM(Unit_Price * Quantity *(1-`Discount_%`/100)),2) AS Net_revenue 
FROM 
finalecommerce WHERE Order_Status='Delivered' 
GROUP BY YEAR(Order_Date) , MONTH(Order_Date) , MONTHNAME(Order_Date) 
ORDER BY years , month_no ;


-- Month-over-Month Revenue Growth
-- Question: Calculate the month-over-month revenue growth percentage.


WITH Monthly_revenue as (
SELECT YEAR(Order_Date) AS Years , 
MONTH(Order_Date) AS Month_no , 
MONTHNAME(Order_Date) AS Month_name , 
ROUND(SUM(Unit_Price * Quantity *(1-`Discount_%`/100)),2) AS Net_revenue 
from finalecommerce WHERE Order_Status='Delivered'
GROUP BY YEAR(Order_Date) , MONTH(Order_Date) , MONTHNAME(Order_Date)
)
SELECT Years , Month_no , Month_name , Net_revenue , 
LAG(Net_revenue,1,0) OVER(ORDER BY Years , Month_no ) AS previous_month_revenue , 
ROUND(Net_revenue - LAG(Net_revenue,1,0) OVER(ORDER BY Years , Month_no),2) AS MOM_Growth , 
ROUND((Net_revenue - LAG(Net_revenue,1,0) OVER(ORDER BY Years,Month_no))*100.0/
NULLIF(LAG(Net_revenue,1,0) OVER(ORDER BY Years , Month_no),0),2) AS Growth_pct FROM Monthly_revenue ;



-- Top 5 Cities by Revenue
-- Questions: Rank cities by delivered revenue and calculate
-- each top city's contribution to total delivered revenue


WITH Clean_Data as (
SELECT * , 
ROUND(Unit_Price * Quantity *(1-`Discount_%`/100),2) AS Revenue FROM 
finalecommerce WHERE Order_Status='Delivered'
),
City_revenue as (
SELECT City , ROUND(SUM(Revenue),2) AS Net_revenue , 
ROUND(SUM(Revenue)*100.0/(
SELECT SUM(Revenue) FROM Clean_Data
),2) AS Revenue_Contribution_pct FROM Clean_Data GROUP BY City
),
City_rank AS (
select * , 
RANK() OVER(ORDER BY Net_revenue DESC) AS Revenue_rank FROM City_revenue
)
SELECT * FROM City_rank WHERE Revenue_rank<=5;


-- Category Revenue Performance
-- Question: Calculate revenue by category, rank categories
-- by revenue, and determine each category's contribution
-- to total delivered revenue.


WITH Revenue AS (
SELECT * , 
ROUND(Unit_Price * Quantity *(1-`Discount_%`/100),2) as revenue FROM 
finalecommerce WHERE Order_Status='Delivered'
),
Category_revenue AS (
SELECT Category , ROUND(SUM(revenue),2) AS Net_revenue , 
ROUND(SUM(revenue)*100.0/(
SELECT SUM(revenue) FROM Revenue 
),2) AS revenue_contribution_pct FROM Revenue GROUP BY Category
),
Category_rank AS (
SELECT * , 
RANK() OVER(ORDER BY Net_revenue DESC) AS revenue_rank FROM Category_revenue
)
SELECT * from Category_rank ;



-- Top 10 Customers by Total Delivered Revenue
-- Question: Identify the top 10 customers based on total delivered revenue.

SELECT 
     Customer_ID , 
     Customer_Name , 
     ROUND(SUM(Unit_Price * Quantity *(1-`Discount_%`/100)),2) AS Net_revenue 
     FROM 
     finalecommerce WHERE Order_Status='Delivered'
     GROUP BY Customer_ID , Customer_Name 
     ORDER BY Net_revenue DESC 
     LIMIT 10 ;




