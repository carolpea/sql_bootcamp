CREATE VIEW v_symmetric_union AS
    ((SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-02'
    EXCEPT ALL
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-06')
    UNION ALL
    (SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-06'
    EXCEPT ALL
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-02')
    ORDER BY 1);
