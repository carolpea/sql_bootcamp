CREATE VIEW v_generated_dates AS
    SELECT generate_series('2022-01-01', '2022-01-31', '1 day'::interval)::date AS generated_date
ORDER BY 1;
