CREATE TABLE IF NOT EXISTS tb_lots(
    id SERIAL,
    title TEXT,
    description TEXT,
    start_price integer,
    params JSONB,
    auction_id UUID REFERENCES tb_auctions(id)
);
