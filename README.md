E-Commerce Sales Analytics
📊 Project Overview
An end-to-end E-Commerce Sales Analytics project focused on analyzing sales performance, customer behavior, product performance, pricing, payment methods, and delivery operations.
The project follows a complete data analytics workflow, from data cleaning and validation to SQL analysis, Power BI dashboard development, business insights, and recommendations.
The final cleaned dataset contains 9,923 records.
________________________________________
🎯 Business Objectives
The primary objective of this project is to answer key business questions related to:
•	Revenue and sales performance
•	Customer acquisition and repeat purchasing
•	Customer revenue contribution
•	Product and category performance
•	Discount and pricing effectiveness
•	Payment method performance
•	Delivery efficiency
•	Regional and city-level performance
•	Opportunities to improve revenue, customer engagement, and operational performance
________________________________________
📁 Dataset
The dataset contains transaction-level e-commerce sales information covering:
•	Order and customer details
•	Order and delivery dates
•	Product and category information
•	Quantity and pricing
•	Discounts
•	Payment methods
•	Order status
•	Customer ratings
•	City, state, and regional information
Dataset Files
•	Ecommerce_Sales_Raw_Data.xlsx — Original dataset
•	Ecommerce_Sales_Cleaned_Data.xlsx — Cleaned and validated dataset
________________________________________
🧹 Data Cleaning & Preparation
Data cleaning and transformation were performed using Excel and Power Query before the dataset was used for SQL and Power BI analysis.
Key activities included:
•	Removing duplicate order records
•	Handling missing values
•	Standardizing customer information
•	Cleaning and standardizing city and state names
•	Standardizing categorical values
•	Cleaning payment method values
•	Handling missing product information
•	Validating date fields
•	Reviewing invalid quantity values
•	Standardizing discount values
•	Reviewing missing delivery dates
•	Validating the final dataset
The final cleaned dataset contains 9,923 records.
________________________________________
🗄️ SQL Analysis
The cleaned dataset was imported into MySQL Workbench for business-focused analysis.
More than 35 business questions were developed to evaluate different aspects of e-commerce performance and customer behavior.
SQL Techniques Used
•	Aggregations
•	CASE WHEN
•	Date functions
•	CTEs
•	Subqueries
•	Window functions
•	RANK()
•	DENSE_RANK()
•	LAG()
•	Conditional calculations
•	Customer-level analysis
•	Product-level analysis
•	Revenue and AOV calculations
Analysis Areas
1. Executive KPI Analysis
Analysis of major business KPIs including revenue, orders, customers, delivery performance, and order status.
2. Revenue Analysis
Analysis of revenue trends, regional revenue, city-level revenue, category performance, and product contribution.
3. Order & Business Performance
Analysis of delivered, cancelled, returned, and pending orders.
4. Customer Analysis
Analysis of customer purchasing behavior, repeat customers, customer revenue, cumulative revenue, and high-value customers.
5. Product & Category Analysis
Analysis of product and category sales performance, revenue contribution, quantity sold, and AOV.
6. Discount & Pricing Analysis
Analysis of discounted vs non-discounted revenue, discount bands, AOV, and product discount performance compared with category averages.
7. Delivery & Operational Analysis
Analysis of average delivery time, city-level delivery performance, and delivery-date validation.
8. Advanced Customer & SQL Analysis
Use of window functions and ranking techniques for cumulative customer revenue and regional customer ranking.
________________________________________
📈 Power BI Dashboard
The Power BI dashboard contains four analytical pages, designed to provide an interactive view of the business.
Page 1 — Executive Overview
Provides a high-level view of overall business performance.
•	Total Revenue
•	Total Orders
•	Delivered Orders
•	Repeat Customer Rate
•	AOV
•	Average Delivery Days
•	Revenue by Month
•	Revenue by Category
•	Order Status Distribution
________________________________________
Page 2 — Sales & Product Performance
Focuses on product and category performance.
•	Revenue by Category
•	Top 10 Products by Revenue
•	Top 10 Products by Quantity Sold
•	Category-wise AOV
•	Product and Category Performance
________________________________________
Page 3 — Customer Analytics
Focuses on customer value and purchasing behavior.
•	Total Customers
•	Repeat Customers
•	Repeat Customer Rate
•	Top Customers by Revenue
•	Revenue by Region
•	Top 3 Customers by Region
•	Customer Revenue Distribution
________________________________________
Page 4 — Pricing & Operations
Focuses on pricing effectiveness and operational performance.
•	Discounted vs Non-Discounted Revenue
•	Discount Band vs Revenue & AOV
•	Average Delivery Days
•	Delivery Time by City
•	Payment Method Performance
•	Key Operational Observations
________________________________________
🔍 Key Business Insights
Revenue & Category Performance
Revenue performance varies considerably across product categories, with Electronics emerging as a major revenue contributor.
Customer Value
Customer revenue is concentrated among a smaller group of high-value customers, highlighting the importance of customer retention and targeted engagement.
Regional Performance
Revenue and customer contribution vary across regions, providing opportunities for region-specific sales and retention strategies.
Discount & Pricing
Discounted orders contribute substantially to overall revenue. Comparing discount bands with AOV helps evaluate whether higher discounts are generating sufficient customer value.
Delivery Performance
The overall average delivery time for delivered orders is approximately 3.71 days, while delivery performance varies significantly across cities.
________________________________________
💡 Business Recommendations
1. Strengthen High-Value Customer Retention
Identify and prioritize high-revenue customers through targeted retention strategies, personalized offers, and loyalty initiatives.
2. Optimize Product & Category Strategy
Continue supporting high-performing categories and products while investigating weaker-performing areas for potential growth opportunities.
3. Improve Discount Effectiveness
Evaluate discounts using both revenue contribution and AOV rather than focusing only on sales volume. This can help reduce unnecessary discounting.
4. Improve Delivery Operations
Investigate cities with higher average delivery times to identify potential logistics, fulfillment, or operational bottlenecks.
5. Use Regional Customer Strategies
Develop region-specific strategies based on customer revenue contribution and high-value customer concentration.
6. Monitor Payment Method Performance
Track payment methods by order volume and revenue contribution to better understand customer preferences and identify opportunities to improve payment adoption.
________________________________________
🛠️ Tools & Technologies
Tool	Purpose
Excel	Data inspection and analysis
Power Query	Data cleaning and transformation
MySQL / MySQL Workbench	SQL-based business analysis
Power BI	Interactive dashboard development
DAX	KPI and analytical calculations
GitHub	Project documentation and version control
________________________________________
🔄 Project Workflow
Raw Data → Data Cleaning & Validation → SQL Business Analysis → DAX & Power BI → Business Insights → Recommendations
________________________________________
📂 Project Structure
Ecommerce-Sales-Analytics/
│
├── Data/
│   ├── Ecommerce_Sales_Raw_Data.xlsx
│   └── Ecommerce_Sales_Cleaned_Data.xlsx
│
├── SQL/
│   └── Ecommerce_Sales_Analysis.sql
│
├── PowerBI/
│   └── Ecommerce_Sales_Analytics_Dashboard.pbix
│
├── Report/
│   └── Ecommerce_Sales_Analytics_Project_Report.pdf
│
└── README.md
________________________________________
📄 Project Report
The detailed project report contains the methodology, SQL analysis, results, visualizations, business insights, recommendations, and conclusion.
Report: Report/Ecommerce_Sales_Analytics_Project_Report.pdf
________________________________________
📌 Project Outcome
This project demonstrates an end-to-end Data Analyst workflow by combining:
Data Cleaning → SQL → Business Analysis → DAX → Power BI → Insights → Recommendations
The project focuses not only on technical analysis but also on translating data into business-focused findings and actionable recommendations across revenue, customers, products, pricing, and operations.
________________________________________
👤 Author
Rishiraj Anand
Data Analytics | SQL | Power BI | Excel | Python
LinkedIn · GitHub

