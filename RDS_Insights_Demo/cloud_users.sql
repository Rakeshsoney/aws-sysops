CREATE TABLE cloud_users(
    id BIGINT GENERATED ALWAYS AS IDENTITY,
    PRIMARY KEY(id),
    hash_firstname TEXT NOT NULL,
    hash_lastname TEXT NOT NULL,
    gender VARCHAR(6) NOT NULL CHECK (gender IN ('male', 'female'))
);
INSERT INTO cloud_users(hash_firstname, hash_lastname, gender)
SELECT md5(RANDOM()::TEXT), md5(RANDOM()::TEXT),
CASE WHEN RANDOM() < 0.5 THEN 'male' ELSE 'female' END
FROM generate_series(1, 100000)
COMMIT;
