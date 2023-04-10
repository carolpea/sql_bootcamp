WITH visits AS (SELECT p.name, count(vis.visit_date) AS count_of_visits
FROM person_visits AS vis
         JOIN person AS p ON p.id = vis.person_id
GROUP BY p.name HAVING count(vis.visit_date) > 3
ORDER BY 2 DESC, 1)
SELECT *
FROM visits
