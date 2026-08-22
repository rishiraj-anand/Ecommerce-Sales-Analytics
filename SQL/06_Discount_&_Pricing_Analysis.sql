USE ecommerce_sales_analysis;


-- =====================================================
-- 06. DISCOUNT AND PRICING ANALYSIS
-- =====================================================

-- Compare revenue and AOV between discounted and non-discounted delivered orders.

SELECT 
    CASE 
    WHEN `Discount_%` > 0 THEN 'Discounted'
    ELSE 
    'Non_Discounted'
END AS Order_type , 
        COUNT(DISTINCT Order_ID) AS Total_Orders , 
        ROUND(SUM(Unit_Price * Quantity *(1-`Discount_%`/100)),2) AS Net_revenue , 
        ROUND(SUM(Unit_Price * Quantity * (1-`Discount_%`/100))
        / COUNT(DISTINCT Order_ID),2) AS AOV 
        FROM finalecommerce
        WHERE Order_Status='Delivered'
        GROUP BY 
              CASE 
              WHEN `Discount_%` > 0 THEN 'Discounted'
              ELSE 
              'Non_Discounted'
              END
	ORDER BY Net_revenue DESC ;
    
    
    
-- Question: Analyze net revenue across different discount bands


    SELECT 
        CASE 
        WHEN `Discount_%`=0 THEN 'No_Discount'
        WHEN `Discount_%`> 0 AND `Discount_%` <=10 THEN '1-10%'
        WHEN `Discount_%`>10 AND `Discount_%`<=20 THEN '11-20%'
        WHEN `Discount_%` > 20 AND `Discount_%` <=30 THEN '21-30%'
        ELSE 
        'Above-30%'
	END AS Discount_Band , 
          COUNT(DISTINCT Order_ID ) AS Total_Orders , 
          ROUND(SUM(Unit_Price * Quantity *(1-`Discount_%`/100)),2) AS Net_revenue , 
          ROUND(SUM(Unit_Price * Quantity * (1-`Discount_%`/100))
          / COUNT(DISTINCT Order_ID),2) AS AOV 
          FROM 
          finalecommerce WHERE Order_Status='Delivered'
          GROUP BY 
                CASE 
                WHEN `Discount_%`=0 THEN 'No_Discount'
                WHEN `Discount_%`>0 AND `Discount_%`<=10 THEN '1-10%'
                WHEN `Discount_%`>10 AND `Discount_%`<=20 THEN '11-20%'
                WHEN `Discount_%`>20 AND `Discount_%` <=30 THEN '21-30%'
                ELSE 
                'Above-30%'
			END 
            ORDER BY 
            MIN(`Discount_%`);





-- Question: Identify products with discounts above their category average


WITH Product_Discount AS (
    SELECT
        Category,
        Product_Name,
        ROUND(AVG(`Discount_%`), 2) AS Product_Avg_Discount
    FROM finalecommerce
    WHERE Order_Status = 'Delivered'
    GROUP BY Category, Product_Name
),
Category_Discount AS (
    SELECT
        Category,
        ROUND(AVG(`Discount_%`), 2) AS Category_Avg_Discount
    FROM finalecommerce
    WHERE Order_Status = 'Delivered'
    GROUP BY Category
)
SELECT
    p.Category,
    p.Product_Name,
    p.Product_Avg_Discount,
    c.Category_Avg_Discount
FROM Product_Discount p
JOIN Category_Discount c
    ON p.Category = c.Category
WHERE p.Product_Avg_Discount > c.Category_Avg_Discount
ORDER BY p.Category, p.Product_Avg_Discount DESC;





          
    
    
    
    
    
    