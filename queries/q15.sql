-- Kolik by bylo minimálně potřeba inzercí, aby každý makléř inzeroval každý druh nemovitosti alespoň jednou.

-- 14*21 = 294
select count(*) from 
(select distinct * from makler
cross join typ
order by id_makler asc, id_typ) as pocet;