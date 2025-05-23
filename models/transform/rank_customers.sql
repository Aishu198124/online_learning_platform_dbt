select 
    t.customer_id,
    c.customername,
    sum(t.revenue) as total_revenue,
    rank() over (order by sum(t.revenue) desc) as customer_rank
from 
    {{ ref('stg_transactions') }} t
    join {{ ref('stg_customers') }} c
    on t.customer_id = c.customer_id
group by 
    t.customer_id,
    c.customername
order by
    total_revenue desc