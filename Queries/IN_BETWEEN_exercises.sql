-- Using IN()
-- Which products either Single Malt Scotch or Canadian Whiskies
-- returned 682 rows
SELECT category_name, item_description
FROM products
WHERE category_name ILIKE 'SINGLE MALT SCOTCH' 
	OR category_name ILIKE 'CANADIAN WHISKIES'
ORDER BY category_name, item_description;

SELECT category_name, item_description
FROM products
WHERE category_name IN('SINGLE MALT SCOTCH', 'CANADIAN WHISKIES')
ORDER BY category_name, item_description;

SELECT category_name, item_description
FROM products
WHERE LOWER(category_name) IN('single malt scotch', 'canadian whiskies')
ORDER BY category_name, item_description;

-- ILIKE products of Whiskies using category_name
-- 1606 rows returned; 8254 NOT ILIKE
SELECT category_name, item_description
FROM products
WHERE category_name NOT ILIKE '%whisk%'
ORDER BY category_name, item_description;

-- BETWEEN exercises
-- Which products have a shelf price between 4 and 10?
-- 2701 rows returned
SELECT item_description, shelf_price
FROM products
WHERE shelf_price BETWEEN 4 AND 10
ORDER BY shelf_price ASC;

--Which products have a bottle price between 4 and 10?
--4011 rows returned
SELECT item_description, bottle_price
FROM products
WHERE CAST(bottle_price AS DEC) BETWEEN 4 AND 10
ORDER BY bottle_price ASC;