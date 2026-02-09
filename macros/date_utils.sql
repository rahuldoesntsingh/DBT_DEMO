{% macro get_season(x) %}

CASE WHEN MONTH(to_timestamp({{x}})) in (12,1,2) then 'WINTER' 
        when MONTH(to_timestamp({{x}})) in (3,4, 5) then 'SPRING'
        when MONTH(to_timestamp({{x}})) in (6,7,8) then 'SUMMER'
        else 'AUTUMN'
        end

{% endmacro%}



{% macro day_type(x) %}

CASE WHEN DAYNAME(to_timestamp({{x}})) IN ('Sat','Sun') then 'WEEKEND' else 'BUSINESSDAY'

{% endmacro%}