--UUID v4
CREATE EXTENTION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users(
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_name VARCHAR(50) NOT NULL
);
