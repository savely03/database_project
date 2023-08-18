---Какой клиент сколько машин заказал
SELECT c.id        as client_id,
       c.full_name as full_name,
       COUNT(1)    as count_cars
FROM clients c
         JOIN orders o
              on c.id = o.client_id
GROUP BY c.id,
         c.full_name
ORDER BY c.id;


---Как много заказали красных машин
SELECT COUNT(1) as count_cars
FROM cars c
         JOIN orders o
              ON c.id = o.car_id
WHERE lower(c.color) = 'red';


---ФИО клиента, который заказал больше всего машин
SELECT c.full_name as full_name
FROM clients c
         JOIN orders o
              ON c.id = o.client_id
GROUP BY c.id
ORDER BY count(1) DESC
LIMIT 1;


---ФИО клиента, который заказал больше всего машин, с учётом, что таких клиентов может быть несколько
SELECT a.full_name as full_name
FROM (SELECT c.full_name                                as full_name,
             dense_rank() over (ORDER BY count(1) DESC) as rnk
      FROM clients c
               JOIN orders o
                    ON c.id = o.client_id
      GROUP BY c.id) as a
WHERE a.rnk = 1;


---В каком месяце больше всего заказывают машин
SELECT extract(MONTH FROM o.order_date) as month
FROM orders o
GROUP BY month
ORDER BY count(1) DESC
LIMIT 1;


---В каком месяце больше всего заказывают машин, с учетом, что таких месяцев может быть несколько
SELECT a.month as month
FROM (SELECT extract(MONTH FROM o.order_date)            as month,
             dense_rank() over (order by count(1) desc ) as rnk
      FROM orders o
      group by month) as a
WHERE a.rnk = 1;




