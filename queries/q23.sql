-- Smaž makléře, kteří mají nejmenší úspěšnost.

begin;

delete from makler
where uspesnost =
(
    select min(uspesnost)
from makler );

rollback;