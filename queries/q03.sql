-- Jméno a příjmení majitelů, kteří vlastní nějakou nemovitost ve městě Ankola.

-- RA
/*
{{nemovitost*ulice*mesto(mesto='Ankola')}*>majitel}[krestni_jmeno, prijmeni]
*/

select distinct krestni_jmeno, prijmeni
from majitel
join nemovitost using (id_majitel)
join ulice using (id_ulice)
join mesto using (id_mesto)
where mesto='Ankola';