DROP TABLE stocks;
DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists (
  id serial4 primary key,
  name VARCHAR(255),
  genre VARCHAR(255),
  UNIQUE (name)
);

CREATE TABLE albums (
  id serial4 primary key,
  name VARCHAR(255),
  artist_id int4 references artists(id) ON DELETE CASCADE,
  UNIQUE (name)
);

CREATE TABLE stocks (
  id serial4 primary key,
  album_id int4 references albums(id) ON DELETE CASCADE,
  stock_level int4,
  buy_price int4,
  sell_price int4
);
