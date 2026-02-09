with cte as (
    select

    to_timestamp(started_at) as STARTED_AT,
    DATE(to_timestamp(started_at)) AS DATE_STARTED_AT,
    HOUR(to_timestamp(started_at)) AS HOUR_STARTED_AT,

    {{day_type('started_at')}} end as day_type,  

    {{get_season('started_at')}} as SEASON_OF_YEAR

    from {{ source('demo', 'bike') }}
    where started_at!='started_at'
)

select * from cte