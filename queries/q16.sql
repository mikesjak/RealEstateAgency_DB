-- Seznam makléřů podle abecedy. U každého uveďte jméno, příjmení, telefon a počet inzercí.

select prijmeni, krestni_jmeno, telefonni_cislo, (
    select count(*) from inzerce i
    where i.id_makler = m.id_makler
)
from makler m
order by prijmeni, krestni_jmeno;