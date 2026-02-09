with cte as (
    select

    to_timestamp(started_at) as STARTED_AT,
    DATE(to_timestamp(started_at)) AS DATE_STARTED_AT,
    HOUR(to_timestamp(started_at)) AS HOUR_STARTED_AT,
    CASE WHEN DAYNAME(to_timestamp(started_at)) IN ('Sat','Sun') then 'WEEKEND' else 'BUSINESSDAY' end as day_type,

    CASE WHEN MONTH(to_timestamp(started_at)) in (12,1,2) then 'WINTER' 
        when MONTH(to_timestamp(started_at)) in (3,4, 5) then 'SPRING'
        when MONTH(to_timestamp(started_at)) in (6,7,8) then 'SUMMER'
        else 'AUTUMN'
        end as STATION_OF_YEAR


    from {{ source('demo', 'bike') }}
    where started_at!='started_at'
)

select * from cte