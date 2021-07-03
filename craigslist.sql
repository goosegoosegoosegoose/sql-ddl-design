-- region
-- users
    -- preferred region
-- posts
-- catagories

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    pref_region INTEGER REFERENCES regions
);

CREATE TABLE catagories
(
    id SERIAL PRIMARY KEY,
    catagory TEXT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    txt TEXT NOT NULL,
    user_id INTEGER REFERENCES users,
    location TEXT NOT NULL,
    region_id INTEGER REFERENCES regions,
    catagory_id INTEGER REFERENCES catagories
);