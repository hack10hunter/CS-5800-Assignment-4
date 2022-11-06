
CREATE TABLE forum.instrument (
                name VARCHAR NOT NULL,
                pitch VARCHAR NOT NULL,
                CONSTRAINT instrument_pk PRIMARY KEY (name)
);


CREATE TABLE forum.address (
                addressID INTEGER NOT NULL,
                number INTEGER NOT NULL,
                street1 VARCHAR NOT NULL,
                street2 VARCHAR NOT NULL,
                city VARCHAR NOT NULL,
                state VARCHAR NOT NULL,
                zipCode VARCHAR NOT NULL,
                telephone VARCHAR NOT NULL,
                CONSTRAINT address_pk PRIMARY KEY (addressID)
);


CREATE TABLE forum.musician (
                ssn INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                addressID INTEGER NOT NULL,
                CONSTRAINT musician_pk PRIMARY KEY (ssn)
);


CREATE TABLE forum.plays (
                name VARCHAR NOT NULL,
                ssn INTEGER NOT NULL,
                CONSTRAINT plays_pk PRIMARY KEY (name, ssn)
);


CREATE TABLE forum.album (
                albumID INTEGER NOT NULL,
                ssn INTEGER NOT NULL,
                title VARCHAR NOT NULL,
                release_date DATE NOT NULL,
                format VARCHAR NOT NULL,
                age INTEGER NOT NULL,
                CONSTRAINT album_pk PRIMARY KEY (albumID, ssn)
);


CREATE TABLE forum.song (
                title VARCHAR NOT NULL,
                length INTEGER NOT NULL,
                albumID INTEGER NOT NULL,
                ssn INTEGER NOT NULL,
                CONSTRAINT title PRIMARY KEY (title)
);


CREATE TABLE forum.accompanies (
                name VARCHAR NOT NULL,
                title VARCHAR NOT NULL,
                CONSTRAINT accompanies_pk PRIMARY KEY (name, title)
);


CREATE TABLE forum.performs (
                ssn INTEGER NOT NULL,
                title VARCHAR NOT NULL,
                CONSTRAINT performs_pk PRIMARY KEY (ssn, title)
);


ALTER TABLE forum.plays ADD CONSTRAINT instrument_plays_fk
FOREIGN KEY (name)
REFERENCES forum.instrument (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.accompanies ADD CONSTRAINT instrument_accompanies_fk
FOREIGN KEY (name)
REFERENCES forum.instrument (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.musician ADD CONSTRAINT address_musician_fk
FOREIGN KEY (addressID)
REFERENCES forum.address (addressID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.performs ADD CONSTRAINT musician_performs_fk
FOREIGN KEY (ssn)
REFERENCES forum.musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.song ADD CONSTRAINT musician_song_fk
FOREIGN KEY (ssn)
REFERENCES forum.musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.album ADD CONSTRAINT musician_album_fk
FOREIGN KEY (ssn)
REFERENCES forum.musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.plays ADD CONSTRAINT musician_plays_fk
FOREIGN KEY (ssn)
REFERENCES forum.musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.song ADD CONSTRAINT album_song_fk
FOREIGN KEY (albumID)
REFERENCES forum.album (albumID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.performs ADD CONSTRAINT song_performs_fk
FOREIGN KEY (title)
REFERENCES forum.song (title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE forum.accompanies ADD CONSTRAINT song_accompanies_fk
FOREIGN KEY (title)
REFERENCES forum.song (title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
