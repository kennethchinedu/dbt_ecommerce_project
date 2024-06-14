WITH 
    suppliers AS (
        SELECT 
            s_suppkey,
            s_name,
            s_address,
            s_nationkey,
            s_phone,
            s_acctbal
        from {{ ref("sc_supplier")}}
        ),
    partsupp AS (
        SELECT 
            ps_partkey,
            ps_suppkey,
            ps_availqty,
            ps_supplycost
        from {{ ref("src_partsupp")}}
        ),
    part AS (
        SELECT 
            p_partkey,
            p_name,
            P_MFGR,
            p_brand,
            p_type,
            p_container,
            p_retailprice
        from {{ ref("src_part")}}   
    )
    

SELECT 
    distinct s.s_suppkey ,
    s.s_name AS supplier_name,
    p.p_name AS part_name,
    ps.ps_availqty AS avail_qty,
    p.P_MFGR AS MFGR,
    p.p_brand AS brand,
    p.p_type AS type,
    p.p_container,
    ps.ps_supplycost AS supply_cost,
    p.p_retailprice,
    (p.p_retailprice - ps.ps_supplycost)  AS profit

from 
    suppliers s
left join  partsupp ps 
    on s.s_suppkey = ps.ps_suppkey
left join part p 
    on p.p_partkey = ps.ps_partkey

