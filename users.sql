CREATE TABLE IF NOT EXISTS tb_users(
    id SERIAL NOT NULL UNIQUE,
    full_name VARCHAR(60),
    birth_date TIMESTAMP,
    phone_num VARCHAR(25),
    email TEXT,
    password TEXT,
    PRIMARY KEY (id)
);