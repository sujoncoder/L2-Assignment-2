-- Active: 1748187300908@@127.0.0.1@5432@conservation_db

-- -------------------DATABASE CREATION----------------
CREATE DATABASE conservation_DB;

-- -------------------TABLE CREATION----------------
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    region VARCHAR(250) NOT NULL
);

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(250) NOT NULL,
    scientific_name VARCHAR(250) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(100) CHECK (
        conservation_status IN (
            'Endangered',
            'Vulnerable',
            'Historic'
        )
    )
);

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers (ranger_id),
    species_id INT REFERENCES species (species_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(250) NOT NULL,
    notes TEXT
);

-- ---------------SIMPALE DATA INSERTION--------------
INSERT INTO
    rangers (name, region)
VALUES (
        'Alice Green',
        'Northern Hills'
    ),
    ('Bob White', 'River Delta'),
    (
        'Carol King',
        'Mountain Range'
    );

INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );

INSERT INTO
    sightings (
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );

------------------------PROBLEM - 1---------------------
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');

------------------------PROBLEM - 2---------------------
SELECT COUNT(DISTINCT species_id) as unique_species_count
FROM sightings;

------------------------PROBLEM - 3--------------------
SELECT * FROM sightings WHERE location LIKE '%Pass%';

------------------------PROBLEM - 4--------------------
SELECT r.name, COUNT(s.sighting_id) AS total_sighting
FROM rangers r
    JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY
    r.name
ORDER BY r.name;

------------------------PROBLEM - 5--------------------
SELECT common_name
FROM species
WHERE
    species_id NOT IN (
        SELECT species_id
        FROM sightings
    );

------------------------PROBLEM - 6--------------------
SELECT species.common_name, sightings.sighting_time, rangers.name
FROM
    sightings
    JOIN species ON sightings.species_id = species.species_id
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sightings.sighting_time DESC
LIMIT 2;

------------------------PROBLEM - 7--------------------
UPDATE species
SET
    conservation_status = 'Historic'
WHERE
    discovery_date < '1800-01-01';

------------------------PROBLEM - 8--------------------
SELECT
    sighting_id,
    CASE
        WHEN EXTRACT(
            HOUR
            FROM sighting_time
        ) < 12 THEN 'Morning'
        WHEN EXTRACT(
            HOUR
            FROM sighting_time
        ) >= 12
        AND EXTRACT(
            HOUR
            FROM sighting_time
        ) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings
ORDER BY sighting_id;

------------------------PROBLEM - 9--------------------
DELETE FROM rangers
WHERE
    ranger_id NOT IN (
        SELECT DISTINCT
            ranger_id
        FROM sightings
    );