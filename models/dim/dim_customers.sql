WITH 
    customers AS (
        SELECT 
            c_custkey,
            c_name,
            c_acctbal,
            c_mktsegment,
            c_nationkey
        from {{ ref("src_customers")}}
        ),
    nation AS (
        SELECT 
            n_nationkey,
            n_name,
            n_regionkey
        from {{ ref("src_nation")}}
        ),
    region AS (
        select 
            r_regionkey,
            r_name
        from {{ ref("src_region")}}
    )


select 
    c.c_custkey,
    c.c_name,
    c.c_acctbal,
    c.c_mktsegment,
    n.n_name,
    r.r_name 
from 
    customers c 
left join nation n on c.c_nationkey = n.n_nationkey
left join region r on r.r_regionkey = n.n_regionkey