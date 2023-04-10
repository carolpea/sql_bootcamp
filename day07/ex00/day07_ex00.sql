SELECT person_id, count(person_visits.visit_date) AS count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY 2 DESC, 1;
