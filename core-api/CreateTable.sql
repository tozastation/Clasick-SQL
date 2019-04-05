CREATE TABLE artist (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 1
    genre_id INT, -- 1
    name VARCHAR(50), -- 乃木坂48
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp
    CONSTRAINT fk_artist_genre_id -- 外部キー制約
        FOREIGN KEY (genre_id) 
        REFERENCES genre (id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE genre (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 1
    name VARCHAR(50), -- アイドル
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp
)

CREATE TABLE music (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    artist_id INT, 
    genre_id INT, -- 1
    name VARCHAR(50), -- 裸足でSUMMER
    m3u8_path VARCHAR(50),
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp
    CONSTRAINT fk_music_genre_id -- 外部キー制約
        FOREIGN KEY (genre_id) 
        REFERENCES genre (id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
    CONSTRAINT fk_artist_music_id -- 外部キー制約
        FOREIGN KEY (artist_id) 
        REFERENCES artist (id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE user (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 1
    name VARCHAR(50), -- tozastation
    password VARCHAR(50), -- sduhuiwefnejai
    access_token VARCHAR(255), --CYDJSSSDHUSINJKJNJ
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp
)

CREATE TABLE playlist (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 1
    name VARCHAR(50), -- ジム用
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp
)

CREATE TABLE user_playlist (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 1
    user_id INT,
    playlist_id INT,
    CONSTRAINT fk_user_playlist_id -- 外部キー制約
        FOREIGN KEY (playlist_id) 
        REFERENCES playlist (id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
    CONSTRAINT fk_playlist_user_id -- 外部キー制約
        FOREIGN KEY (user_id) 
        REFERENCES user (id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE playlist_music (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 1
    playlist_id INT,
    music_id INT,
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp
    CONSTRAINT fk_playlist_music_id -- 外部キー制約
        FOREIGN KEY (music_id) 
        REFERENCES music (id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
    CONSTRAINT fk_music_playlist_id -- 外部キー制約
        FOREIGN KEY (playlist_id) 
        REFERENCES playlist (id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
)