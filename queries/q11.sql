-- Seznam inzercí, které spravuje Griffy Byneth.

-- RA
/*
{inzerce<*makler(krestni_jmeno='Griffy' and prijmeni='Byneth')}[id_inzerce, id_nemovitost]
*/

select id_inzerce, id_nemovitost 
from inzerce
join makler using(id_makler)
where krestni_jmeno = 'Griffy' and prijmeni = 'Byneth';