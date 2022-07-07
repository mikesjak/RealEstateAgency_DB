-- Nemovitost, kterou inzerovali všichni makléři.

-- RA
/*
{inzerce[id_nemovitost, id_makler]÷makler[id_makler]}*>nemovitost
*/

select * from nemovitost n
where not exists ( -- nemovitost pro ktere neexistuje makler ->
    select id_makler from makler m 
    where not exists ( -- pro ktere neexistuje inzerce s dannou nemovitosti
        select id_makler from inzerce i
        where i.id_nemovitost = n.id_nemovitost and i.id_makler = m.id_makler 
    )
);