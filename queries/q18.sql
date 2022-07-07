-- Seznam typů nemovitostí, které mají menší zastoupení než 5.

select typ, count(id_typ) from nemovitost join typ using (id_typ)
group by typ
having count(id_typ) < 5
order by typ;