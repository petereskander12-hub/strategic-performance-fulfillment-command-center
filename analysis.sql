
--Query 1: Cross-Border Shipping Cost & Delay Breakdown by Corridor AVG 
-- Purpose: Calculates the average order value and delay rate for each shipping corridor 
-- between origin and destination countries, rounded for executive reporting.

SELECT Origin_Country, Destination_Country, 
ROUND(AVG(Order_Value), 2) AS Avg_Order_Value,
ROUND(AVG(Delay_Status), 2) AS Delay_Rate
FROM cross_border_supply_chain_dataset cbscd 
GROUP BY Destination_Country , Origin_Country
ORDER BY Destination_Country  DESC , Origin_Country DESC

-- Query 2: Fulfillment & Inventory Risk Matrix Aggregation AVG
-- Purpose: Smashes 5,000+ raw transaction rows down to 49 unique warehouses, 
-- calculating clean, rounded averages for stock levels, reorder points, and utilization 
-- so you can spot bottlenecks instantly on a scatter plot.

SELECT Warehouse_ID, 
ROUND(AVG(Stock_Level),2) AS Stock_Level,
ROUND(AVG(Reorder_Point), 2) AS Reorder_Point, 
ROUND(AVG(Warehouse_Utilization), 2) AS Warehouse_Utilization
FROM cross_border_supply_chain_dataset cbscd 
GROUP BY Warehouse_ID
ORDER BY Warehouse_ID DESC;

-- Query 3: Customer Segment & Category Revenue Rankings
-- Purpose: Groups orders by segment and category to rank 
-- performance, highlighting top earners to cut lower segments.

SELECT Customer_Segment, Product_Category,
COUNT(Order_ID) AS Total_Orders,
ROUND(SUM(Order_Value),2) AS Total_Revenue,
ROUND(AVG(Order_Value), 2 )AS Avg_Order_Value
FROM cross_border_supply_chain_dataset cbscd 
GROUP BY Customer_Segment, Product_Category
ORDER BY Total_Revenue DESC ;

--- Query Name: Customs Clearance Impact Analysis
--What it does: Aggregates total orders and average delivery lead times 
--grouped by customs clearance times, sorted in ascending order to track 
--how border delays impact overall speed.

SELECT Customs_Clearance_Time,
COUNT(Order_ID) AS Total_Orders,
ROUND(AVG(Delivery_Lead_Time), 2) AS Avg_Lead_Time
FROM cross_border_supply_chain_dataset cbscd
GROUP BY Customs_Clearance_Time
ORDER BY Customs_Clearance_Time ASC; 