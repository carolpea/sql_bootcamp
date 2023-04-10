CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop int default 10) returns table (fibonacci int) as $fibonacci$
        WITH Recursive Q(N,P) as (
            select 1,0
            union all
            select Q.N+Q.P,Q.N
            from Q
            where Q.N < pstop
        )
    select P from Q
    $fibonacci$ language sql volatile;


select * from fnc_fibonacci(100);
