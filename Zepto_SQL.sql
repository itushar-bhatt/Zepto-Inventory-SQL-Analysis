CREATE DATABASE zepto_db;
USE zepto_db;

-- we have imported another columns using python file

-- Lets start with data exploration

-- count total entries
SELECT count(*)
FROM zepto;

-- Sample Data
SELECT * FROM zepto
Limit 10;

-- different types of categories
SELECT DISTINCT category
FROM zepto
GROUP BY category
ORDER BY category;

-- checking null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
availableQuantity IS NULL 
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- Product is outofstock or available
SELECT outOfStock,
count(sku_id) AS 'Checking Stock'
FROM zepto
GROUP BY outOfStock;

-- product name present multiple times
SELECT name, count(sku_id) AS
'Number_of_SKUs'
FROM zepto
GROUP BY name
ORDER BY Number_of_SKUs DESC;

-- Now start Data Cleaning

-- Products with Price = 0
SELECT name, mrp, discountedSellingPrice
FROM zepto
WHERE mrp = 0 or discountedSellingPrice = 0;

-- There is only one data with zero mrp and discountedsellingprice,
-- Lets delete this row
DELETE FROM zepto
WHERE mrp = 0;

-- changing paisa into rupees
UPDATE zepto
SET mrp = mrp/100,
discountedSellingPrice =  discountedSellingPrice/100;


-- Solving Real world Business queries

-- Found top 10 best-value products based on discount percentage
SELECT name, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;


-- Identified high-MRP products that are currently out of stock
SELECT name, mrp, outOfStock
FROM zepto
WHERE mrp > 300 AND outOfStock = true
ORDER BY name;


-- Estimated potential revenue for each product category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS 'total_revenue'
FROM zepto
GROUP BY Category
ORDER BY total_revenue DESC;


-- Filtered expensive products (MRP > ₹500) with minimal discount
SELECT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY discountPercent DESC;


-- Ranked top 5 categories offering highest average discounts
SELECT Category,
ROUND(AVG(discountPercent),2) AS 'Avg_Discount'
FROM zepto
GROUP BY Category
ORDER BY Avg_Discount DESC
LIMIT 5;


-- Calculated price per gram to identify value-for-money products for products above 100g and sort by best value
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice / weightInGms,2) AS 'price_per_gram'
FROM zepto
WHERE weightInGms > 100
ORDER BY price_per_gram DESC;

-- Grouped products based on weight into Low, Medium, and Bulk categories
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
    ELSE 'Bulk'
    END AS 'weight_category'
FROM zepto;


-- Measured total inventory weight per product category
SELECT category,
SUM(weightInGms * availableQuantity) AS 'total_weight'
FROM zepto
GROUP BY Category
ORDER BY total_weight DESC;