SELECT piz.name, piz.rating
FROM person_visits
    RIGHT OUTER JOIN pizzeria AS piz ON pizzeria_id = piz.id
WHERE pizzeria_id IS NULL;
