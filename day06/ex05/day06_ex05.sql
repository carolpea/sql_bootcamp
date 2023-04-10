COMMENT ON TABLE person_discounts IS 'Table of personal discounts for clients';
COMMENT ON COLUMN person_discounts.id IS 'This is ID number table';
COMMENT ON COLUMN person_discounts.person_id IS 'Person ID number';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria ID number';
COMMENT ON COLUMN person_discounts.discount IS 'Amount of discount (in percent %)';


SELECT count(*) = 5 AS check
FROM   pg_description
WHERE  objoid = 'person_discounts'::regclass