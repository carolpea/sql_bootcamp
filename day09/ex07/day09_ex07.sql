CREATE OR REPLACE FUNCTION func_minimum(variadic arr numeric[]) returns numeric as $func_min$
select min(arr[i]) from generate_subscripts(arr, 1) g(i);
$func_min$ language sql volatile;

SELECT func_minimum(VARIADIC arr => ARRAY[10, -20.0, 5.0, 4.4]);