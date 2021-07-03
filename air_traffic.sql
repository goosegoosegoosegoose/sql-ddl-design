-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER NOT NULL REFERENCES passengers,
  airline_id INTEGER NOT NULL REFERENCES airlines,
  from_city_id INTEGER NOT NULL REFERENCES cities,
  from_country_id INTEGER NOT NULL REFERENCES countries,
  to_city_id INTEGER NOT NULL REFERENCES cities,
  to_country_id INTEGER NOT NULL REFERENCES countries
);

INSERT INTO passengers
  (first_name, last_name, seat, departure, arrival)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00');

INSERT INTO airlines
  (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO cities
  (city)
VALUES
  ('Washington DC'),
  ('Seattle'),
  ('Tokyo'),
  ('London'),
  ('Los Angeles'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Paris'),
  ('Casablanca'),
  ('Dubai'),
  ('Beijing'),
  ('New York'),
  ('Charlotte'),
  ('Cedar Rapids'),
  ('Chicago'),
  ('New Orleans'),
  ('Sao Paolo'),
  ('Santiago');

INSERT INTO countries
 (country)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO tickets
  (passenger_id, airline_id, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  (1, 1, 1, 1, 2, 1),
  (2, 2, 3, 2, 4, 3),
  (3, 3, 5, 1, 6, 1),
  (4, 3, 2, 1, 7, 4),
  (5, 4, 8, 5, 9, 6),
  (6, 5, 10, 7, 11, 8),
  (7, 1, 12, 1, 13, 1),
  (8, 6, 14, 1, 15, 1),
  (9, 6, 13, 1, 16, 1),
  (10, 7, 17, 9, 18, 10);
