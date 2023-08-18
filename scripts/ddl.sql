CREATE TABLE IF NOT EXISTS CLIENTS
(
    id            BIGSERIAL,
    full_name     VARCHAR(50) NOT NULL,
    date_birthday DATE        NOT NULL,
    gender        SMALLINT    NOT NULL
);

ALTER TABLE CLIENTS
    ADD CONSTRAINT clients_pk PRIMARY KEY (id),
    ADD CONSTRAINT clients_check_gender CHECK ( gender >= 1 and gender <= 2 );


CREATE TABLE IF NOT EXISTS CARS
(
    id              BIGSERIAL,
    model           VARCHAR(50) NOT NULL,
    color           VARCHAR(20) NOT NULL,
    engine_capacity DECIMAL     NOT NULL,
    release_date    DATE        NOT NULL,
    price           BIGINT      NOT NULL
);

ALTER TABLE CARS
    ADD CONSTRAINT cars_pk PRIMARY KEY (id);


CREATE TABLE IF NOT EXISTS ORDERS
(
    id         BIGSERIAL,
    client_id  BIGINT NOT NULL,
    car_id     BIGINT NOT NULL,
    order_date DATE   NOT NULL
);

ALTER TABLE ORDERS
    ADD CONSTRAINT orders_pk PRIMARY KEY (id),
    ADD CONSTRAINT orders_on_clients_fk FOREIGN KEY (client_id) REFERENCES CLIENTS (id),
    ADD CONSTRAINT orders_on_cars_fk FOREIGN KEY (car_id) REFERENCES CARS (id);


CREATE INDEX idx_car_color ON CARS (color);
