-- show tables; /* -- komentarz wyłączający wiersz */
-- describe Classes; /* zawartość tabeli Classes - wielkość liter ma znaczenie :) */
-- select * from Classes; /* pobranie wszystkich danych dla tabeli Classes */
-- describe Students; /* zawartość tabeli Students */
select *
from Students; /* ad.1 wszystkie dane studentów z tabeli Students */
select * from Students
where name like 'De%' and class_id = 11; /* szuka imienia wg wzorca zaczynającego się na frazę "De" i należy do klasy o id równym 11 */
select * from Students
where class_id = 1 or class_id = 2; /* studenci z klas o id=1 oraz id=2  */
select * from Students
order by surname asc, name asc; /* sortowanie wg nazwisk i imion - rosnąco */
select name, surname
from Students; /* ad.2 imiona i nazwiska studentów z tabeli Students */
-- describe Teachers; /* zawartość tabeli Teachers */
select *
from Teachers; /* ad.3 wszystkie dane nauczycieli z tabeli Teachers */