--llave primaria compuesta
CREATE TABLE usersDual(
    user_id INTEGER NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_id, user_name)
);