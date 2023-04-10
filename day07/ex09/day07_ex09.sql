SELECT address,
       round(((max(age) - (min(age) / max(age)::float))::numeric), 2) as formula,
       round(avg(age), 2) as average,
       (CASE
            WHEN round(((max(age) - (min(age) / max(age)::float))::numeric), 2) > round(avg(age)::numeric, 2)
                THEN true
            ELSE false END) AS comparsion
FROM person
GROUP BY 1
ORDER BY 1;