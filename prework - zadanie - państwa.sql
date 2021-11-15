-- show tables;
-- describe country;
select * from country
where Name like 'Po%' order by Name asc; /* ad.1 wszystkie informacje o krajach zaczynających się od frazy "Po" */
select Code, Name from country
where Continent = "Europe" order by Name asc; /* ad.2 lista krajów w Europie: skrót i nazwa */
select Name, Continent, HeadOfState from country
where HeadOfState like 'K%' or HeadOfState is null; /* ad.6 lista z nazwą kraju, kontynentem, władcą kraju - nie ma go lub zaczyna się na "K" */
-- describe city;
select * from city
where CountryCode = "ARG" and Population > 190000 order by Population desc; /* ad.4 wszystkie informacje o miasta w Argentynie powyżej 190 tys. mieszkańców */
select Name from city
where Population < 10000 order by Population asc; /* ad.5 lista miast z populacją poniżej 10 tys. */
-- describe countrylanguage;
select CountryCode from countrylanguage
where Language = "Polish" and IsOfficial = "F" order by CountryCode asc; /* ad.3 kod kraju w którym polski występuje, ale nie jest oficjalnym językiem */