CREATE TABLE IF NOT EXISTS tb_auctions(
    id UUID NOT NULL UNIQUE,
    slug TEXT UNIQUE,
    title TEXT,
    description TEXT,
    max_participants integer,
    participants_number integer,
    starts_at date,
    ends_at date,
    PRIMARY KEY(id),
    organizer_id integer REFERENCES tb_users(id) 
);



CREATE TABLE IF NOT EXISTS tb_participants(
    auction_id UUID REFERENCES tb_auctions(id),
    user_id integer REFERENCES tb_users(id)
);
