-- 1. Combine the menu_items and order_detailstables into a single table
SELECT * FROM order_details LEFT JOIN menu_items
ON menu_items.menu_item_id = order_details.item_id;

-- 2. What are the least and most ordered items? What categories are they in?
SELECT  item_name, COUNT(order_id)
FROM order_details 
LEFT JOIN menu_items
	ON menu_items.menu_item_id = order_details.item_id
GROUP BY item_name
ORDER BY COUNT(order_id) DESC;

SELECT  item_name, category, COUNT(order_id)
FROM order_details 
LEFT JOIN menu_items
	ON menu_items.menu_item_id = order_details.item_id
GROUP BY item_name, category
ORDER BY COUNT(order_id) ASC;

-- 3. What are the top 5 orders that spent the most money?
SELECT order_id, SUM(price)
FROM order_details 
LEFT JOIN menu_items
	ON menu_items.menu_item_id = order_details.item_id
GROUP BY order_id
ORDER BY SUM(price) DESC
LIMIT 5;

-- 4. View the details of the highest spend order. What insights can you gather from the results?
SELECT * FROM order_details 
LEFT JOIN menu_items
	ON menu_items.menu_item_id = order_details.item_id
WHERE order_id = 440;

SELECT category, COUNT(item_id) FROM order_details 
LEFT JOIN menu_items
	ON menu_items.menu_item_id = order_details.item_id
WHERE order_id = 440
GROUP BY category;

#We can see that they bought a lot of Italian food compared to the other categories
-- 5. View the details of the top 5 highest spend orders. What insights can you gather from the results?
SELECT order_id, category, COUNT(item_id) FROM order_details 
LEFT JOIN menu_items
	ON menu_items.menu_item_id = order_details.item_id
WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY order_id,category;

#We can see that the highest spenders spent a lot in Italian food
#even though they are more expensive than other dishes
#So we should keep them in the menu!