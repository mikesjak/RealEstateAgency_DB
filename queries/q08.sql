-- Nemovitosti, o kterou byl projeven zájem, ale nepodařily se prodat.
-- 3x same query

-- RA
/*
nemovitost<*{ inzerce*zajem*prodej(stav='Not sold') }
*/

select distinct n.* from nemovitost n
join inzerce using (id_nemovitost)
join zajem using (id_inzerce)
join prodej p using (id_zajem)
where p.stav='Not sold';

select n.* from nemovitost n
where exists (
    select * from inzerce i join zajem z using (id_inzerce)
    where n.id_nemovitost = i.id_nemovitost
)
and not exists (
    select * from inzerce i join zajem z using (id_inzerce) join prodej p using (id_zajem)
    where n.id_nemovitost = i.id_nemovitost and p.stav in ('Sold', 'Reserved')
);


(select distinct n.* from nemovitost n
join inzerce using (id_nemovitost)
join zajem using (id_inzerce))
except
(select distinct n.* from nemovitost n
join inzerce using (id_nemovitost)
join zajem z using (id_inzerce)
join prodej p using (id_zajem)
where p.stav in ('Sold','Reserved'))
