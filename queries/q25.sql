-- Vytvoř nemovitost, která bude mít náhodnou hodnotu do 10 mio, náhodného majitele, náhodnou velikost a náhodný typ.

begin;

insert into nemovitost (id_nemovitost, id_majitel, id_typ, id_ulice, ohodnoceni, velikost_v_m2) (
select (select max(id_nemovitost) from nemovitost ) + 1, -- id_nemovitost
(select id_majitel from majitel order by random() limit 1), -- id_majitel
(select id_typ from typ order by random() limit 1), -- id_typ
(select id_ulice from ulice order by random() limit 1),
(select ohodnoceni from nemovitost order by random() limit 1 % 10000000),
(select velikost_v_m2 from nemovitost order by random() limit 1)
);

rollback;
