
--serial
CREATE TABLE user (
    user_id serial PRIMARY KEY
);

--identity
CREATE TABLE user2 (
    user_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY
);

--identity con secuencia de 2 en 2 iniciando en el 100
CREATE TABLE user3 (
    user_id INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 100 INCREMENT BY 2) PRIMARY KEY
);
