SELECT menu.id
FROM menu
         LEFT JOIN person_order on menu.id = menu_id
WHERE menu_id IS NULL
ORDER BY 1;