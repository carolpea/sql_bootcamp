SELECT id,
       CASE
           when (age >= 10 and age <= 20) then 'interval #1'
           when (age > 20 and age < 24) then 'interval #2'
           else 'interval #3' end AS interval_info
FROM person
ORDER BY interval_info