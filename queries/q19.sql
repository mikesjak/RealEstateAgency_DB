-- Seznam makléřů, kteří inzerovali alespoň 1 dům a mají úspěšnost větší než 60 %.

-- RA
/*
{makler(uspesnost>60)<*{inzerce<*nemovitost<*dum}}[krestni_jmeno, prijmeni, uspesnost]
*/

select distinct m.krestni_jmeno, prijmeni, uspesnost 
from makler m join inzerce i using (id_makler)
where (
    ( select count(*) from nemovitost n join dum using (id_nemovitost) where i.id_nemovitost=n.id_nemovitost ) > 0
)
group by m.krestni_jmeno, prijmeni, uspesnost
having uspesnost > 60
order by uspesnost desc, krestni_jmeno, prijmeni;