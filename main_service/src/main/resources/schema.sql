DROP TABLE IF EXISTS users, categories, locations, events, compilations, compilation_event CASCADE;

CREATE TABLE IF NOT EXISTS users (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (id),
    CONSTRAINT uq_user_name UNIQUE (name),
    CONSTRAINT uq_user_email UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS categories (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name VARCHAR NOT NULL,
    CONSTRAINT pk_category PRIMARY KEY (id),
    CONSTRAINT uq_category_name UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS locations (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    lat FLOAT(20) NOT NULL,
    lon FLOAT(20) NOT NULL,
    CONSTRAINT pk_location PRIMARY KEY (id),
    CONSTRAINT uq_location UNIQUE (lat, lon)
);

CREATE TABLE IF NOT EXISTS events (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    annotation VARCHAR,
    category_id BIGINT REFERENCES categories(id) ON DELETE RESTRICT,
    confirmed_requests INTEGER,
    created_on TIMESTAMP,
    description VARCHAR,
    event_date TIMESTAMP,
    initiator_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    location_id BIGINT REFERENCES locations(id) ON DELETE SET NULL,
    paid BOOLEAN,
    participant_limit INTEGER,
    published_on TIMESTAMP,
    request_moderation BOOLEAN,
    state VARCHAR,
    title VARCHAR,
    views INTEGER,
    CONSTRAINT pk_event PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS compilations (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    pinned BOOLEAN,
    title VARCHAR,
    CONSTRAINT pk_compilation PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS compilation_event (
    compilation_id BIGINT REFERENCES compilations(id) ON DELETE CASCADE,
    event_id BIGINT REFERENCES events(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS requests (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    created TIMESTAMP,
    event_id BIGINT REFERENCES events(id) ON DELETE CASCADE,
    requester_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
    status VARCHAR,
    CONSTRAINT pk_request PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS views (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    ip VARCHAR NOT NULL,
    event_id BIGINT REFERENCES events(id) ON DELETE CASCADE,
    CONSTRAINT pk_view PRIMARY KEY (id),
    CONSTRAINT uq_view UNIQUE (ip, event_id)
);

CREATE TABLE IF NOT EXISTS comments (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
    text VARCHAR(450) NOT NULL,
    event BIGINT REFERENCES events(id) ON DELETE CASCADE,
    author BIGINT REFERENCES users(id) ON DELETE CASCADE,
    modified BOOLEAN,
    updated_date TIMESTAMP,
    rating BIGINT,
    parent_id BIGINT REFERENCES comments(id) ON DELETE CASCADE,
    created TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS comment_like (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    user_id BIGINT REFERENCES users (id) ON DELETE CASCADE,
    comment_id BIGINT REFERENCES comments (id) ON DELETE CASCADE,
    CONSTRAINT pk_comment_like PRIMARY KEY (id)
);



