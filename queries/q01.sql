-- Jaká je nejdražší inzerovaná nemovitost každého typu?

select typ, max(ohodnoceni) as "highest price"
from nemovitost
join typ using (id_typ)
group by id_typ;