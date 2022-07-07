-- Kontrola dotazu D1. (q05)

-- RA
/*
makler
\
{{inzerce[id_nemovitost, id_makler]÷makler[id_makler]*>nemovitost}*>inzerce*>makler}
*/

select id_nemovitost, count(distinct id_makler)
from inzerce
where id_nemovitost in (
---- dotaz D1
    select id_nemovitost from nemovitost n
    where not exists (
        select id_makler 
        from makler m 
        where not exists (
            select id_makler from inzerce i
            where i.id_nemovitost =n.id_nemovitost and i.id_makler = m.id_makler 
        )
    )
--- dotaz D1
)
group by id_nemovitost
having count(distinct id_makler) != (select count(*) from makler);