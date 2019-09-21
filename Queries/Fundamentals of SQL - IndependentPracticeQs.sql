-- FIRST INDEPENDENT PRACTICE
-- #1 Which products come in packs larger than 12?
-- 1106 rows (999 if used DISTINCT)
SELECT item_description, pack
FROM products WHERE pack > 12
ORDER BY 2 ASC; 

-- Shows the pack configurations and the # of products in each
SELECT pack, COUNT(item_description)
FROM products
GROUP BY pack
ORDER BY pack;

-- (3814 rows) Using a nested query to generate the count
SELECT COUNT(*)
FROM (
	SELECT DISTINCT item_description, pack
	FROM products WHERE pack < 12) AS temp; 

-- #1b How many unique products have less than 12 in a pack?
-- (4433 unique rows by item_no, 1106 by item_description)
SELECT DISTINCT item_no, item_description 
FROM products WHERE pack < 12; 

SELECT DISTINCT ON(item_no) item_no, item_description 
FROM products WHERE pack < 12; 
-- Adding Distinct doesn't add any benefit here
-- Same output result

-- distinct items with pack size greater than 12
SELECT DISTINCT item_description 
FROM products WHERE pack>12; 

SELECT COUNT(DISTINCT item_description) 
FROM products WHERE pack>12;  
-- Solution Output: 897

-- Adding Distinct On
SELECT DISTINCT ON (item_description) item_description, pack
FROM products WHERE pack < 12
ORDER BY item_description ASC; 

--#2 Which products have a case price of less than $70
--(2863 rows using DISTINCT; 3938 without DISTINCT)
SELECT item_description, case_cost
FROM products WHERE case_cost < 70
ORDER BY case_cost; 

SELECT DISTINCT ON(item_description) item_description, case_cost
FROM products WHERE case_cost < 70
ORDER BY item_description; 

-- #3 Which products come in packs larger than 12 AND have a case_cost of less than $70?
-- (553 rows using DISTINCT ON(item_description) and 603 without)
SELECT DISTINCT ON(item_description) item_description, case_cost, pack
FROM products WHERE case_cost < 70 AND pack > 12; 

-- #4 Which types of products have a proof of 85 or more?
--Problem: proof is a text field (must match data types)
--1524 rows returned
SELECT item_description, CAST(proof AS numeric) AS proof_number
FROM products 
WHERE CAST(proof AS numeric) >= 85
ORDER BY proof_number ASC;

--(1146 rows)
SELECT DISTINCT item_description, CAST(proof AS numeric) AS proof_number
FROM products 
WHERE CAST(proof AS numeric) >= 85
ORDER BY proof_number ASC;

SELECT DISTINCT item_description FROM products WHERE CAST(proof AS integer) >= 85; --(1152 rows)
SELECT DISTINCT item_no FROM products WHERE CAST(proof AS integer) >= 85; --(1524 rows)

SELECT COUNT(DISTINCT item_description)
FROM products 
WHERE CAST(proof AS numeric) >= 85;

-- #5 Which products are scotch whiskies OR are over 85 proof? This version allows us to check output results.
 
SELECT item_description, CAST(proof AS numeric) AS proof_number 
FROM products 
WHERE CAST(proof AS numeric) >85 OR category_name ilike 'SCOTCH WHISKIES'
ORDER BY proof_number DESC;  -- (1733 rows)

-- #6 How many stores are active (using store_status)? Inactive? 
SELECT COUNT(STORE) AS store_count 
FROM stores 
WHERE store_status = 'A'; 
--Solution output = 1425 

SELECT COUNT(STORE) AS store_count 
FROM stores 
WHERE store_status = 'I'; 
--Solution output = 548 
--To create a query to reveals the store count for each status in one query, 
--use GROUP BY as shown by the following sample query (Results I:548; A:1425):
 
SELECT store_status, COUNT(*) AS store_count 
FROM stores 
GROUP BY store_status;

-- Example of count of products in each category
SELECT category_name, COUNT(item_no) AS qty_items
FROM products
GROUP BY category_name 
ORDER BY category_name;
