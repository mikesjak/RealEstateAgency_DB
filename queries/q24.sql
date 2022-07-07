-- Jména prodávajících (majitel), jejichž nemovitost se prodala během jednoho měsíce (tj. 31 dní).

-- RA

/*
{prodej(delka_prodeje <= 31 ∧ stav = 'Sold')*>zajem*>inzerce*>nemovitost*>majitel}[krestni_jmeno, prijmeni]
*/

select m.krestni_jmeno, prijmeni from majitel m
join nemovitost using (id_majitel) 
join inzerce using (id_nemovitost)
join zajem using (id_inzerce)
join prodej p using (id_zajem)
where p.delka_prodeje <= 31
and p.stav = 'Sold';