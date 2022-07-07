-- Makléři, kteří inzerují byty nebo domy, ale neprodávají prázdné pozemky.

-- RA

/*
{{makler<*{inzerce*nemovitost*byt}}
∪
{makler<*{inzerce*nemovitost*dum}}}
\
{makler<*{inzerce*nemovitost*pozemek}}
*/

((select m.* from makler m
join inzerce i on (m.id_makler=i.id_makler)
join nemovitost using (id_nemovitost)
join byt using (id_nemovitost))
union
(select m.* from makler m
join inzerce i on (m.id_makler=i.id_makler)
join nemovitost using (id_nemovitost)
join dum using (id_nemovitost)))
except
(select m.* from makler m
join inzerce i on (m.id_makler=i.id_makler)
join nemovitost using (id_nemovitost)
join pozemek using (id_nemovitost));