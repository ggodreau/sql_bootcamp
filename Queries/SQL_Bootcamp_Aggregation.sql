/* WHERE FUNCTIONS */
-- IN()
SELECT category_name, item_description, case_cost
FROM products
WHERE UPPER(category_name) IN ('SINGLE MALT SCOTCH','CANADIAN WHISKIES')
ORDER BY category_name ASC;

/* WHERE CONDITION USING BETWEEN */
SELECT item_description, shelf_price, bottle_price
FROM products
WHERE shelf_price BETWEEN 4 AND 10
ORDER BY shelf_price ASC;
-- rows returned: 2701 

SELECT item_description, shelf_price, bottle_price
FROM products
WHERE CAST(bottle_price AS DEC) BETWEEN 4 AND 10
ORDER BY bottle_price ASC;
-- rows returned 4011

-- COMBINING LOGICAL OPERATORS
SELECT vendor, bottle_price, proof
FROM products
WHERE vendor = 305
	AND (CAST(bottle_price AS numeric) < 5
		 OR CAST(proof AS numeric) > 100)
ORDER BY bottle_price ASC;
-- 29 rows returned

-- Largest Transaction Total in the Sales Table
SELECT MAX(total)
FROM sales;
-- +$94k

-- Average state bottle cost in the sales table
SELECT CAST(AVG(CAST(state_btl_cost as DEC)) AS MONEY) as avg_state_bottle_cost 
FROM sales;

-- AGGREGATION PRACTICE
-- Q #1
SELECT vendor, vendor_name, 
	   ROUND(AVG(CAST(bottle_price AS DEC)),2) AS avg_price
FROM products
GROUP BY vendor, vendor_name
ORDER BY 3 DESC;
--271 ROWS
				
-- Q #2			
SELECT vendor_name, MAX(bottle_price) AS max_cost, 
       MIN(bottle_price) AS min_cost
FROM products
GROUP BY vendor_name
HAVING ROUND(MIN(CAST(bottle_price AS DEC)),2) > 10
ORDER BY 2 DESC
LIMIT 20;

