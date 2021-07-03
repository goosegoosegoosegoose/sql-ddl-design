-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL
);

CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY,
  star TEXT NOT NULL
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon TEXT NOT NULL
);

CREATE TABLE combos
(
  planet_id INTEGER NOT NULL REFERENCES planets,
  orbit_id INTEGER NOT NULL REFERENCES orbits_around,
  galaxy_id INTEGER NOT NULL REFERENCES galaxies,
  moon_id INTEGER REFERENCES moons
);

INSERT INTO planets
  (name, orbital_period_in_years)
VALUES
  ('Earth', 1.00),
  ('Mars', 1.88),
  ('Venus', 0.62),
  ('Neptune', 164.8),
  ('Proxima Centauri b', 0.03),
  ('Gliese 876 b', 0.23);

INSERT INTO orbits_around
  (star)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO galaxies
  (galaxy)
VALUES
  ('Milky Way');

INSERT INTO moons
  (moon)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');

INSERT INTO combos
  (planet_id, orbit_id, galaxy_id, moon_id)
VALUES
  (1, 1, 1, 1),
  (2, 1, 1, 2),
  (2, 1, 1, 3),
  (3, 1, 1, null),
  (4, 1, 1, 4),
  (4, 1, 1, 5),
  (4, 1, 1, 6),
  (4, 1, 1, 7),
  (4, 1, 1, 8),
  (4, 1, 1, 9),
  (4, 1, 1, 10),
  (4, 1, 1, 11),
  (4, 1, 1, 12),
  (4, 1, 1, 13),
  (4, 1, 1, 14),
  (4, 1, 1, 15),
  (4, 1, 1, 16),
  (4, 1, 1, 17),
  (5, 1, 1, null),
  (6, 1 , 1, null);