USE sakila;

-- polecenia testujące
SHOW FULL tables; -- row 23 in table
SELECT COUNT(*) FROM film; -- sprawdzenie count 1000
SELECT COUNT(*) FROM film_text; -- sprawdzenie count 1000

-- pro tips wg kolejności wywoływania
#SELECT <columns> 5. -- co wyszukujemy
#FROM <table> 1. -- skąd pobieramy dane (nazwa tabeli)
#WHERE <predicate on rows> 2. -- warunki do spełnienia przez wiersz
#GROUP BY <columns> 3. -- agregacja danych np. COUNT(), MAX(), MIN(), SUM(), AVG()
#HAVING <predicate on groups> 4. -- takie same działanie jak "where", ale dotyczy grup
#ORDER BY <columns> 6. -- sortowanie danych
#OFFSET=LIMIT (dla MySQL) 7. -- omijanie określonej liczby wierszy
#FETCH FIRST 8. -- pobieranie określonej liczby wierszy

SELECT 'Hello world o taki tekst'; -- wywołanie tekstu 'Hello world'

SELECT * FROM sakila.actor; -- cała zawartość tabeli 'actor'

SELECT * FROM sakila.actor
WHERE first_name = 'PENELOPE'; -- wszyscy aktorzy o imieniu 'Penelope'

SELECT actor_id #, first_name, last_name
FROM sakila.actor
ORDER BY first_name, last_name; -- sortowanie wg 'first_name' i pozniej 'last-name'

SELECT DISTINCT first_name  -- wybranie niepowtarzających się elementów (imion)
FROM SAKILA.actor
ORDER BY first_name ASC;

 SELECT DISTINCT first_name, last_name -- wyszukanie unikalnych kombinacji (imion i nazwisk)
 FROM sakila.actor;
 
 SELECT DISTINCT first_name
 FROM sakila.actor
 LIMIT 5; -- ograniczenie wyników do 5 pierwszych wieszy
 
 SELECT DISTINCT first_name
 FROM sakila.customer
 WHERE active = 1
 ORDER BY first_name DESC -- lista unikatowych imion aktywnych klientów w kolejności malejącej
 LIMIT 10;
 
 SELECT film_id, title, replacement_cost
 FROM sakila.film
 WHERE length > 68 AND rating = 'NC-17'; -- lista filmów NC-17 i dłuższych niż 68

SELECT film_id, title, replacement_cost
 FROM sakila.film
 WHERE length > 68 OR rating = 'NC-17'; -- lista filmów NC-17 lub dłuższych niż 68