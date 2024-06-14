WITH 
    orders As (
        SELECT 
            O_ORDERKEY,
            o_custkey,
            o_orderstatus AS order_status,
            o_totalprice AS total_price,
            o_orderdate AS order_date,
            {{extract_month('o_orderdate')}} AS order_month,
            {{ dbt_date.day_name("o_orderdate", short=false) }} as order_day,
            o_orderpriority AS order_priority,
            o_clerk AS clerk,
            o_shippriority AS shippriority, 
            o_comment AS order_comment
        from {{ ref("src_orders")}}
            ),
    items AS (
        SELECT  
            l_orderkey, 
            l_partkey
        from {{ ref("src_lineitem")}}
    )

select * 
    from orders o 
left join items s 
    on o.o_orderkey = s.l_orderkey