---Какой клиент сколько машин заказал
SELECT c.id as client_id,
       c.full_name as full_name,
       COUNT(*) as count_cars
    FROM clients c
        JOIN orders o
            on c.id = o.client_id
    GROUP BY c.id,
             c.full_name
    ORDER BY c.id;


---Как много заказали красных машин
SELECT COUNT(*) as count_cars
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
    ORDER BY count(*) DESC
    LIMIT 1;


---В каком месяце больше всего заказывают машин
SELECT extract(MONTH FROM o.order_date) as month
    FROM orders o
    GROUP BY month
    ORDER BY count(*) DESC
    LIMIT 1;
