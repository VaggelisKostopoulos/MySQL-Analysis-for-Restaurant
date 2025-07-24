USE restaurant_db;

-- 1. View the menu_items table.
SELECT * FROM menu_items;

-- 2. Find the number of items in the menu.
SELECT COUNT(menu_item_id) FROM menu_items;

-- 3. What are the least and most expensive items on the menu?
SELECT  item_name, price 
FROM menu_items 
ORDER BY price ASC LIMIT 1;

-- We found the least expensive item, now we are going to find the most expensive one but with a different solution

SELECT item_name, price 
FROM menu_items
WHERE price = (SELECT MAX(price) FROM menu_items);

-- 4. How many Italian dishes are on the menu?
SELECT COUNT(*) 
FROM menu_items
WHERE category = 'Italian';

-- 5. What are the least and most expensive Italian dishes on the menu?
SELECT  item_name, price 
FROM menu_items 
WHERE category = "Italian"
ORDER BY price DESC LIMIT 1;

SELECT item_name, price 
FROM menu_items
WHERE price = (SELECT MIN(price) FROM menu_items WHERE category = "Italian") AND category = "Italian";


-- 6. How many dishes are in each category?
SELECT category,COUNT(*) as number_of_dishes
FROM menu_items 
GROUP BY category;

-- 7. What is the average dish price within each category
SELECT category, AVG(price)
FROM menu_items 
GROUP BY category;