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
            l_partkey,
            l_suppkey,
            l_linenumber,
            l_quantity,
            l_extendedprice,
            l_discount,
            l_tax,
            l_returnflag,
            l_linestatus,
            l_shipdate,
            l_commitdate,
            l_receiptdate,
            l_shipinstruct,
            l_shipmode
        from {{ ref("src_lineitem")}}
            ),
    parts AS (
        SELECT 
            p_partkey, 
            p_name, 
            p_mfgr, 
            p_brand,
            p_type,
            p_size,
            p_container,
            p_retailprice
        from {{ ref("src_part")}}
    )


select 
    DISTINCT {{generate_unique_key("s.l_shipdate", "o.order_date", "p.p_name", "p.p_type")}} AS unique_key,
    o.O_ORDERKEY,
    o.order_date,
    o.order_status,
    o.order_priority,
    o.shippriority,
    s.l_shipdate,
    p.p_name,
    p.p_mfgr,
    p.p_brand,
    p.p_type,
    p.p_size,
    s.l_quantity,
    p.p_retailprice,
    s.l_extendedprice,
    o.total_price

from orders o 
left join items s 
    on o.o_orderkey = s.l_orderkey
left join parts p 
    on p.p_partkey = s.l_partkey