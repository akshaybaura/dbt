{{ config(materialized='table') }}

with cte as (
    select eventid, venueid, dateid, eventname, starttime, b.* from {{ source('jaffle_shop','event') }} a
    join {{ source('jaffle_shop', 'category') }} as b
    on a.catid=b.catid
)
select * from cte