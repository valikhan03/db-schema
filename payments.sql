create table tb_bids(
    id serial,
    lot_id integer REFERENCES tb_lots(id),
    user_id integer REFERENCES tb_users(id),
    bid float
);



