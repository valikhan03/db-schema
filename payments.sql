create table tb_bids(
    id serial,
    lot_id integer REFERENCES tb_lots(id),
    user_id integer REFERENCES tb_users(id),
    bid float
);


create table tb_invoices(
    id serial UNIQUE,
    user_id integer REFERENCES tb_users(id),
    product_type integer,
    product_id integer,
    product_name text,
    amount float,
    currency text,
    p_date_insert date,
    p_date_update date,
    p_is_payed integer default 0
);


create table tb_payments(
    id serial UNIQUE,
    user_id integer REFERENCES tb_users(id),
    invoice_id integer REFERENCES tb_invoices(id),
    payed_amount integer,
    currency text
);