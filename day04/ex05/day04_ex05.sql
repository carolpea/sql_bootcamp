CREATE VIEW v_price_with_discount AS
SELECT p.name, menu.pizza_name, menu.price,
       (price - price * 0.1)::int as discount_price
FROM person_order AS ord
JOIN person AS p ON ord.person_id = p.id
JOIN menu ON ord.menu_id = menu.id
ORDER BY 1, 2;
