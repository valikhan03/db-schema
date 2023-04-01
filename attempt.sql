create table tb_attempt_requirements(
    id number not null unique,
    auction_id UUID not null unique,
    approve_required number default 0,
    enter_fee_required number default 0,
    enter_fee_amount number
);


create table tb_attempt_requests(
    id number not null unique,
    auction_id UUID not null,
    user_id number not null,
    approved number default 0,
    enter_fee_payed number default 0
);