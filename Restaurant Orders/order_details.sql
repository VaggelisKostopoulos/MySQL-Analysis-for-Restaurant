-- 1. View the order_details table.
SELECT * FROM order_details;

-- 2. What is the date range of the table?
SELECT MIN(order_date) as 'First Day', MAX(order_date) as 'Last Day'
FROM order_details;

-- 3. How many orders were made within this date range?
SELECT COUNT(DISTINCT order_id) 
FROM order_details 
WHERE (order_date >= '2023-01-01') AND (order_date <= '2023-03-31');

-- 4. How many items were ordered within this date range?
SELECT COUNT(*) 
FROM order_details 
WHERE (order_date >= '2023-01-01') AND (order_date <= '2023-03-31');

-- 5. Which orders had the most number of items?
SELECT order_id, COUNT(item_id) as 'Number of Items'
FROM order_details
GROUP BY order_id
ORDER BY COUNT(item_id) DESC;

-- 6. How many orders had more than 12 items?

SELECT order_id, COUNT(item_id) as 'Number of Items'
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) > 12;

SELECT COUNT(*) FROM 
(SELECT order_id, COUNT(item_id)
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) > 12) AS orders;
