-- !!! dobrą praktyką jest stosowanie WIELKICH LITER w komendach !!!
-- SHOW tables; /* -- komentarz wyłączający wiersz */
-- DESCRIBE Classes; /* zawartość tabeli Classes - wielkość liter ma znaczenie :) */
-- SELECT * FROM Classes; /* pobranie wszystkich danych dla tabeli Classes */
-- DESCRIBE Students; /* zawartość tabeli Students */
SELECT *
FROM Students; /* ad.1 wszystkie dane studentów z tabeli Students */
SELECT * FROM Students
WHERE name LIKE 'De%' AND class_id = 11; /* szuka imienia wg wzorca zaczynającego się na frazę "De" i należy do klasy o id równym 11 */
SELECT * FROM Students
WHERE class_id = 1 OR class_id = 2; /* studenci z klas o id=1 oraz id=2  */
SELECT * FROM Students
ORDER BY surname ASC, name ASC; /* sortowanie wg nazwisk i imion - rosnąco */
SELECT name, surname
FROM Students; /* ad.2 imiona i nazwiska studentów z tabeli Students */
-- describe Teachers; /* zawartość tabeli Teachers */
SELECT *
FROM Teachers; /* ad.3 wszystkie dane nauczycieli z tabeli Teachers */