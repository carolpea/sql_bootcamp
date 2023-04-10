SELECT generated_date
FROM v_generated_dates AS gen
    LEFT JOIN person_visits AS viz ON viz.visit_date = gen.generated_date
WHERE visit_date IS NULL
ORDER BY 1;