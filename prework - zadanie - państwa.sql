-- !!! dobrą praktyką jest stosowanie WIELKICH LITER w komendach !!!
-- SHOW tables;
-- DESCRIBE country;
-- SELECT * FROM country WHERE Name LIKE 'Po%';
SELECT * FROM country
WHERE Name LIKE 'Po%' ORDER BY Name ASC; /* ad.1 wszystkie informacje o krajach zaczynających się od frazy "Po" */
-- SELECT Code, Name FROM country WHERE Continent = "Europe";
SELECT Code, Name FROM country
WHERE Continent = "Europe" ORDER BY Name ASC; /* ad.2 lista krajów w Europie: skrót i nazwa */
-- SELECT Name, Continent, HeadOfState FROM country WHERE HeadOfState LIKE 'K%' OR HeadOfState IS NULL;
SELECT Name, Continent, HeadOfState FROM country
WHERE HeadOfState LIKE 'K%' OR HeadOfState IS NULL ORDER BY Name; /* ad.6 lista z nazwą kraju, kontynentem, władcą kraju - nie ma go lub zaczyna się na "K" */
-- DESCRIBE city;
-- SELECT * FROM city WHERE CountryCode = "ARG" AND Population > 190000 ORDER BY Population DESC;
SELECT * FROM city
WHERE CountryCode = "ARG" AND Population > 190000 ORDER BY Population DESC; /* ad.4 wszystkie informacje o miasta w Argentynie powyżej 190 tys. mieszkańców */
-- SELECT Name FROM city WHERE Population < 10000 ORDER BY Population ASC;
SELECT Name FROM city
WHERE Population < 10000 ORDER BY Population ASC; /* ad.5 lista miast z populacją poniżej 10 tys. */
-- DESCRIBE countrylanguage;
-- SELECT CountryCode FROM countrylanguage WHERE Language = "Polish" and IsOfficial = "F";
SELECT CountryCode FROM countrylanguage
WHERE Language = "Polish" AND IsOfficial = "F" ORDER BY CountryCode ASC; /* ad.3 kod kraju w którym polski występuje, ale nie jest oficjalnym językiem */