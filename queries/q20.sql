-- Vypočti provizi u všech prodejů. Provize bude činit 5 % z ceny nemovitosti.

begin;

update prodej p
set provize = (
    select n.ohodnoceni from nemovitost n
    join inzerce using (id_nemovitost) join zajem z using (id_inzerce)
    where z.id_zajem = p.id_zajem
) * 0.05;

commit;