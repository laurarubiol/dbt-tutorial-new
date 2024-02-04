with payments as (
    select * from {{ ref('stg_payments') }}
)

select 
    order_id,
    sum(amount) as total_amount
from payments

group by 1
having total_amount < 0  

-- También se puede poner having not(total_amount >=0)