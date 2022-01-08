-- TWORZENIE NOWEJ TABELI
CREATE TABLE Students_Tabela_Adriana
(
student_id int(10),
name varchar(64),
surname varchar(128),
email varchar(255) UNIQUE, #adresy nie mogą się powtarzać
class_id int(10)
); -- PPM na schemacie SCHOOL --> Refresh All (po odświeżeniu tabela będzie widoczna)

-- DODAWANIE REKORDÓW
INSERT INTO Students_Tabela_Adriana (student_id, name, surname, email, class_id)
VALUES 
(1, 'Vladimir', 'Putin', 'v.putin@gov.rus', 1),
(2, 'Joe', 'Biden', 'j.biden@gov.us', 1),
(3, 'Xi', 'Jinping', 'x.pingn@gov.china', 1),
(4, 'Andrzej', 'Duda', 'a.dudan@gov.pl', 3),
(5, 'Milos', 'Zeman', 'm.zeman@gov.cz', 3);

INSERT INTO Students_Tabela_Adriana (student_id, name, surname, email, class_id)
VALUES 
(6, 'Angela', 'Merkel', 'a.merkel@gov.de', 4);

-- AKTUALIZACJA REKORDÓW
UPDATE Students_Tabela_Adriana
SET 
name = "Adrian",
email = "a.duda@gov.pl"
WHERE student_id = 4;

INSERT INTO Students_Tabela_Adriana (student_id, name, surname, email, class_id)
VALUES 
(7, 'Angela', 'Merkel', 'e.merkel@gov.de', 4);

-- USUWANIE REKORDÓW
DELETE FROM Students_Tabela_Adriana
WHERE email = 'e.merkel@gov.de';

-- MODYFIKOWANIE TABELI 
DESCRIBE Students_Tabela_Adriana; -- informacje o typie zmiennych w tabeli
ALTER TABLE Students_Tabela_Adriana ADD CITY varchar(255); -- (dodanie nowej kolumny)
ALTER TABLE Students_Tabela_Adriana DROP COLUMN CITY; -- usunięcie kolumny
ALTER TABLE Students_Tabela_Adriana ADD city varchar(255);
ALTER TABLE Students_Tabela_Adriana MODIFY COLUMN city varchar(64); -- zmiana typu zmiennej

UPDATE Students_Tabela_Adriana
SET city = 'Moscow'
WHERE student_id = 1;

UPDATE Students_Tabela_Adriana
SET 
-- city = 'Washington'
-- city = 'Beijing'
-- city = 'Warsaw'
-- city = 'Praque'
city = 'Berlin'
WHERE 
-- student_id = 2;
-- student_id = 3;
-- student_id = 4;
-- student_id = 5;
student_id = 6;

SELECT* FROM Students_Tabela_Adriana;

