-- Pohled makléřů, prodávajících a kupujících v ukočených prodejích sežazen podle provize.

begin;
-- zajisteni provizi

update prodej p
set provize = (
    select n.ohodnoceni from nemovitost n
    join inzerce using (id_nemovitost) join zajem z using (id_inzerce)
    where z.id_zajem = p.id_zajem
) * 0.05;

create or replace view inzeraty as
select distinct prodej.provize,
                makler.krestni_jmeno as krestni_jmeno_makler,
                makler.prijmeni as prijmeni_makler,
                majitel.krestni_jmeno as krestni_jmeno_prodavajici,
                majitel.prijmeni as prijmeni_prodavajici,
                zajemce.krestni_jmeno as krestni_jmeno_kupujici,
                zajemce.prijmeni as prijmeni_kupujici
from inzerce z
join makler using (id_makler)   
join nemovitost using (id_nemovitost)
join majitel using (id_majitel)
join zajem using (id_inzerce)
join zajemce using (id_zajemce)
join prodej using (id_zajem)
where prodej.stav='Sold'
order by prodej.provize;

-- Makléři, kteří si jednou provizí vydělali alespoň 100000 kč.
select distinct krestni_jmeno_makler, prijmeni_makler
from inzeraty
where provize >= 100000;

rollback;
