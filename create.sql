-- Remove conflicting tables
DROP TABLE IF EXISTS byt CASCADE;
DROP TABLE IF EXISTS dum CASCADE;
DROP TABLE IF EXISTS inzerce CASCADE;
DROP TABLE IF EXISTS majitel CASCADE;
DROP TABLE IF EXISTS makler CASCADE;
DROP TABLE IF EXISTS mesto CASCADE;
DROP TABLE IF EXISTS nemovitost CASCADE;
DROP TABLE IF EXISTS pozemek CASCADE;
DROP TABLE IF EXISTS pravnik CASCADE;
DROP TABLE IF EXISTS prodej CASCADE;
DROP TABLE IF EXISTS typ CASCADE;
DROP TABLE IF EXISTS ulice CASCADE;
DROP TABLE IF EXISTS zajem CASCADE;
DROP TABLE IF EXISTS zajemce CASCADE;
-- End of removing

CREATE TABLE byt (
    id_nemovitost INTEGER NOT NULL,
    podlazi INTEGER NOT NULL,
    pocet_pokoju INTEGER NOT NULL
);
ALTER TABLE byt ADD CONSTRAINT pk_byt PRIMARY KEY (id_nemovitost);

CREATE TABLE dum (
    id_nemovitost INTEGER NOT NULL,
    pocet_podlazi INTEGER NOT NULL,
    pocet_pokoju INTEGER NOT NULL,
    velikost_zahrady INTEGER NOT NULL,
    velikost_zastavene_plochy INTEGER NOT NULL
);
ALTER TABLE dum ADD CONSTRAINT pk_dum PRIMARY KEY (id_nemovitost);

CREATE TABLE inzerce (
    id_inzerce SERIAL NOT NULL,
    id_makler INTEGER NOT NULL,
    id_nemovitost INTEGER NOT NULL
);
ALTER TABLE inzerce ADD CONSTRAINT pk_inzerce PRIMARY KEY (id_inzerce);

CREATE TABLE majitel (
    id_majitel SERIAL NOT NULL,
    krestni_jmeno VARCHAR(256) NOT NULL,
    prijmeni VARCHAR(256) NOT NULL,
    datum_narozeni DATE NOT NULL,
    email VARCHAR(256) NOT NULL,
    telefonni_cislo VARCHAR(256) NOT NULL
);
ALTER TABLE majitel ADD CONSTRAINT pk_majitel PRIMARY KEY (id_majitel);

CREATE TABLE makler (
    id_makler SERIAL NOT NULL,
    krestni_jmeno VARCHAR(256) NOT NULL,
    prijmeni VARCHAR(256) NOT NULL,
    datum_zacatku_pp DATE NOT NULL,
    email VARCHAR(256) NOT NULL,
    telefonni_cislo VARCHAR(256) NOT NULL,
    uspesnost INTEGER NOT NULL
);
ALTER TABLE makler ADD CONSTRAINT pk_makler PRIMARY KEY (id_makler);

CREATE TABLE mesto (
    id_mesto SERIAL NOT NULL,
    mesto VARCHAR(256) NOT NULL
);
ALTER TABLE mesto ADD CONSTRAINT pk_mesto PRIMARY KEY (id_mesto);

CREATE TABLE nemovitost (
    id_nemovitost SERIAL NOT NULL,
    id_majitel INTEGER NOT NULL,
    id_typ INTEGER NOT NULL,
    id_ulice INTEGER NOT NULL,
    ohodnoceni INTEGER NOT NULL,
    velikost_v_m2 INTEGER NOT NULL
);
ALTER TABLE nemovitost ADD CONSTRAINT pk_nemovitost PRIMARY KEY (id_nemovitost);

CREATE TABLE pozemek (
    id_nemovitost INTEGER NOT NULL
);
ALTER TABLE pozemek ADD CONSTRAINT pk_pozemek PRIMARY KEY (id_nemovitost);

CREATE TABLE pravnik (
    id_pravnik SERIAL NOT NULL,
    krestni_jmeno VARCHAR(256) NOT NULL,
    prijmeni VARCHAR(256) NOT NULL
);
ALTER TABLE pravnik ADD CONSTRAINT pk_pravnik PRIMARY KEY (id_pravnik);

CREATE TABLE prodej (
    id_zajem INTEGER NOT NULL,
    id_pravnik INTEGER,
    delka_prodeje INTEGER NOT NULL,
    provize INTEGER,
    stav VARCHAR(256) NOT NULL
);
ALTER TABLE prodej ADD CONSTRAINT pk_prodej PRIMARY KEY (id_zajem);

CREATE TABLE typ (
    id_typ SERIAL NOT NULL,
    typ VARCHAR(256) NOT NULL
);
ALTER TABLE typ ADD CONSTRAINT pk_typ PRIMARY KEY (id_typ);

CREATE TABLE ulice (
    id_ulice SERIAL NOT NULL,
    id_mesto INTEGER NOT NULL,
    nazev VARCHAR(256) NOT NULL,
    cislo_popisne VARCHAR(256),
    evidencni_cislo VARCHAR(256)
);
ALTER TABLE ulice ADD CONSTRAINT pk_ulice PRIMARY KEY (id_ulice);

CREATE TABLE zajem (
    id_zajem SERIAL NOT NULL,
    id_inzerce INTEGER NOT NULL,
    id_zajemce INTEGER NOT NULL
);
ALTER TABLE zajem ADD CONSTRAINT pk_zajem PRIMARY KEY (id_zajem);

CREATE TABLE zajemce (
    id_zajemce SERIAL NOT NULL,
    krestni_jmeno VARCHAR(256) NOT NULL,
    prijmeni VARCHAR(256) NOT NULL,
    email VARCHAR(256) NOT NULL,
    telefonni_cislo VARCHAR(256) NOT NULL
);
ALTER TABLE zajemce ADD CONSTRAINT pk_zajemce PRIMARY KEY (id_zajemce);

ALTER TABLE byt ADD CONSTRAINT fk_byt_nemovitost FOREIGN KEY (id_nemovitost) REFERENCES nemovitost (id_nemovitost) ON DELETE CASCADE;

ALTER TABLE dum ADD CONSTRAINT fk_dum_nemovitost FOREIGN KEY (id_nemovitost) REFERENCES nemovitost (id_nemovitost) ON DELETE CASCADE;

ALTER TABLE inzerce ADD CONSTRAINT fk_inzerce_makler FOREIGN KEY (id_makler) REFERENCES makler (id_makler) ON DELETE CASCADE;
ALTER TABLE inzerce ADD CONSTRAINT fk_inzerce_nemovitost FOREIGN KEY (id_nemovitost) REFERENCES nemovitost (id_nemovitost) ON DELETE CASCADE;

ALTER TABLE nemovitost ADD CONSTRAINT fk_nemovitost_majitel FOREIGN KEY (id_majitel) REFERENCES majitel (id_majitel) ON DELETE CASCADE;
ALTER TABLE nemovitost ADD CONSTRAINT fk_nemovitost_typ FOREIGN KEY (id_typ) REFERENCES typ (id_typ) ON DELETE CASCADE;
ALTER TABLE nemovitost ADD CONSTRAINT fk_nemovitost_ulice FOREIGN KEY (id_ulice) REFERENCES ulice (id_ulice) ON DELETE CASCADE;

ALTER TABLE pozemek ADD CONSTRAINT fk_pozemek_nemovitost FOREIGN KEY (id_nemovitost) REFERENCES nemovitost (id_nemovitost) ON DELETE CASCADE;

ALTER TABLE prodej ADD CONSTRAINT fk_prodej_zajem FOREIGN KEY (id_zajem) REFERENCES zajem (id_zajem) ON DELETE CASCADE;
ALTER TABLE prodej ADD CONSTRAINT fk_prodej_pravnik FOREIGN KEY (id_pravnik) REFERENCES pravnik (id_pravnik) ON DELETE CASCADE;

ALTER TABLE ulice ADD CONSTRAINT fk_ulice_mesto FOREIGN KEY (id_mesto) REFERENCES mesto (id_mesto) ON DELETE CASCADE;
ALTER TABLE ulice ADD CONSTRAINT check_ulice CHECK( (cislo_popisne is NULL and evidencni_cislo is not NULL) OR (cislo_popisne is not NULL and evidencni_cislo is NULL) );

ALTER TABLE zajem ADD CONSTRAINT fk_zajem_inzerce FOREIGN KEY (id_inzerce) REFERENCES inzerce (id_inzerce) ON DELETE CASCADE;
ALTER TABLE zajem ADD CONSTRAINT fk_zajem_zajemce FOREIGN KEY (id_zajemce) REFERENCES zajemce (id_zajemce) ON DELETE CASCADE;