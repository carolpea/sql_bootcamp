SELECT p.name, count(vis.visit_date) AS count_of_visits
           FROM person_visits AS vis
                    JOIN person AS p ON p.id = vis.person_id
           GROUP BY p.name
           ORDER BY 2 DESC, 1
           limit 4;

WITH a AS (SELECT p.name, count(vis.visit_date) AS count_of_visits
           FROM person_visits AS vis
                    JOIN person AS p ON p.id = vis.person_id
           GROUP BY p.name
           ORDER BY 2 DESC
           limit 4)
SELECT *
FROM a
ORDER BY 1;

