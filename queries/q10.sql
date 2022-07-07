-- Který zájemce následně nic nekoupil ani nic nezarezervoval?

-- RA
/*
zajemce<*{zajem!<*prodej}
*/

select id_zajemce, krestni_jmeno, prijmeni, email, telefonni_cislo from zajemce z
where id_zajemce in (
-- Id_zajemce, ktery projevil zajem, ale nekoupil
(select distinct z.id_zajemce from zajem z)
except
(select distinct z.id_zajemce from zajem z join prodej using (id_zajem) ) 
);

