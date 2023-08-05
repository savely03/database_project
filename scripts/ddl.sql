CREATE TABLE IF NOT EXISTS CLIENTS (
    id BIGSERIAL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    date_birthday DATE NOT NULL,
    gender INT CHECK ( gender >= 1 and gender <= 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS CARS (
    id BIGSERIAL PRIMARY KEY,
    model VARCHAR(50) NOT NULL,
    color VARCHAR(20) NOT NULL,
    engine_capacity DECIMAL NOT NULL,
    release_date DATE NOT NULL,
    price INT NOT NULL
);

CREATE TABLE IF NOT EXISTS ORDERS (
    id BIGSERIAL PRIMARY KEY,
    client_id BIGINT NOT NULL REFERENCES CLIENTS (id),
    car_id BIGINT NOT NULL REFERENCES CARS (id),
    order_date DATE NOT NULL
);

CREATE INDEX idx_car_color ON CARS(color);
