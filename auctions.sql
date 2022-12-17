CREATE TABLE IF NOT EXISTS auctions(
    id UUID NOT NULL UNIQUE,
    slug TEXT UNIQUE,
    title TEXT,
    description TEXT,
    max_participants integer,
    participants_number integer,
    status varchar(20)
    PRIMARY KEY (auction_id),
    organizer_id integer REFERENCES users(id) 
);



CREATE TABLE IF NOT EXISTS participants(
    auction_id UUID REFERENCES auctions(auction_id),
    user_id integer REFERENCES users(id)
);
