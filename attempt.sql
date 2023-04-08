create table tb_attempt_requirements(
    id serial not null unique,
    auction_id UUID not null unique,
    approve_required integer default 0,
    enter_fee_required integer default 0,
    enter_fee_amount integer default null
);


create table tb_attempt_requests(
    id serial not null unique,
    auction_id UUID not null,
    user_id integer not null,
    approved integer default 0,
    enter_fee_payed integer default null
);