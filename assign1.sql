SELECT * FROM prac_ta1.order_line;

-- Q1.)
-- select product_id ,sum(quantity) as Quantity_Sold from order_line group by product_id order by Quantity_Sold desc; 

select ol.product_id, sum(ol.quantity) as Quantity_Sold , (pr.PRICE_IN_RS * sum(ol.quantity)) as Total_Sales
from order_line as ol, product as pr
where ol.product_id = pr.product_id
group by product_id order by Total_Sales desc ;

-- Q2.)
select ol.product_id, sum(ol.quantity) as Quantity_Sold , (pr.PRICE_IN_RS * sum(ol.quantity)) as Total_Sales
from order_line as ol, product as pr
where ol.product_id = pr.product_id
group by product_id order by Total_Sales desc limit 5;

-- Q3.)
select o.CUSTOMER_ID ,c.CUSTOMER_NAME , ol.ORDER_ID , count(ORDER_LINE_ID) as total_orders
from order_line as ol join orders as o on ol.ORDER_ID = o.ORDER_NO
join customer as c on o.CUSTOMER_ID = c.CUSTOMER_ID
group by order_id order by total_orders desc;



