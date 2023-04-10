SELECT t1::date AS missing_date
        FROM generate_series('2022-01-01', '2022-01-10', '1 day'::interval) AS t1
         LEFT JOIN (SELECT person_id, visit_date
                    FROM person_visits
                    WHERE (visit_date BETWEEN '2022-01-01' AND '2022-01-10')
                      AND (person_id = 1 OR person_id = 2)) AS t2
                   ON t1 = t2.visit_date
            WHERE t2.visit_date IS NULL
ORDER BY 1;


