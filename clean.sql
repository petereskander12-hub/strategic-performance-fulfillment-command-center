-- View All Data
SELECT *
FROM cross_border_supply_chain_dataset cbscd;

-- Check Duplicate Order IDs
SELECT Order_ID, COUNT(*)
FROM cross_border_supply_chain_dataset
GROUP BY Order_ID
Having COUNT(*) > 1;

-- Check Duplicate Order Values
SELECT Order_Value, COUNT(*)
FROM cross_border_supply_chain_dataset
GROUP BY Order_Value
Having COUNT(*) > 1;

-- Check Duplicate Customer IDs
SELECT Customer_ID, COUNT(*)
FROM cross_border_supply_chain_dataset
GROUP BY Customer_ID
Having COUNT(*) > 1;

-- Check Date Range
SELECT MIN(Order_Date), MAX(Order_Date)
FROM cross_border_supply_chain_dataset;

-- Check Country Shipping Lanes
SELECT Origin_Country, Destination_Country, COUNT(*)
FROM cross_border_supply_chain_dataset cbscd
GROUP BY Origin_Country, Destination_Country;

-- Check Product Category Spelling
SELECT DISTINCT Product_Category
FROM cross_border_supply_chain_dataset;

-- Check Country Spelling
SELECT DISTINCT Origin_Country, Destination_Country
FROM cross_border_supply_chain_dataset;



