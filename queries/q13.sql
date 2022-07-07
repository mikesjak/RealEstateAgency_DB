-- Makléři, kteří prodávají jak byty, tak domy, tak pozemky.
  
-- RA

/*
{{makler<*{inzerce*nemovitost*byt}}
∩
{makler<*{inzerce*nemovitost*dum}}}
∩
{makler<*{inzerce*nemovitost*pozemek}}
*/

(select m.* from makler m
join inzerce i on (m.id_makler=i.id_makler)
join nemovitost using (id_nemovitost)
join byt using (id_nemovitost))
intersect
(select m.* from makler m
join inzerce i on (m.id_makler=i.id_makler)
join nemovitost using (id_nemovitost)
join dum using (id_nemovitost))
intersect
(select m.* from makler m
join inzerce i on (m.id_makler=i.id_makler)
join nemovitost using (id_nemovitost)
join pozemek using (id_nemovitost));