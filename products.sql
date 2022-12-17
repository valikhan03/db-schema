CREATE TABLE IF NOT EXISTS products(
    id SERIAL,
    title TEXT,
    description TEXT,
    start_price integer,
    params JSONB,
    auction_id UUID REFERENCES auctions(auction_id)
);
