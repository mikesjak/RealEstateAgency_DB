-- Vyber jméno, příjmení a email makléře, který prodává POUZE domy ve městě Ankola.

-- RA
/*
{{makler<*{inzerce*nemovitost*ulice*mesto(mesto='Ankola')}}
\
{makler<*{inzerce*nemovitost*ulice*mesto(mesto!='Ankola')}}}[krestni_jmeno, prijmeni, email]
*/

-- makleri, kteri prodali neco v Ankola
(SELECT DISTINCT krestni_jmeno, prijmeni, email FROM makler
JOIN inzerce i USING (id_makler)
JOIN nemovitost n USING (id_nemovitost)
JOIN ulice u USING (id_ulice)
JOIN mesto m USING (id_mesto)
where m.mesto='Ankola')
except
-- makleri, kteri neprodali nic v Ankola
(SELECT DISTINCT krestni_jmeno, prijmeni, email FROM makler
JOIN inzerce i USING (id_makler)
JOIN nemovitost n USING (id_nemovitost)
JOIN ulice u USING (id_ulice)
JOIN mesto m USING (id_mesto)
where m.mesto!='Ankola');

