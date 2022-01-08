/* nortwind */
-- ćwiczenia
# 8 styczeń 2022

#Przykład:
SELECT *
FROM customers; #słowa kluczowe wielkimi literami i w jednej linijce

-- PRO TIPS:
#blyskawica ze znacznikiem - wykonanie tylko tego kodu gdzie jest kursor/znacznik
#po lewej w SCHEMAS są ikonki dla tabel: 'i'(informacje); 'klucza' (ustawienia); 'tabelki'(szybkie generowanie całej tabelki)
#kliknięcie nazwy kolumny 2xLPM przeniesienie do kodu !!!

#1 Wszystkie dane o pracownikach
SELECT *
FROM employees;
#2 Kod i nazwa wszystkich produktów
SELECT product_code, product_name
FROM products;
#3 Wszystkie dane adresowe dostawców
SELECT *
FROM suppliers;
#5 Kod, nazwa i kategoria wszystkich produktów, które nie należą do kategorii: Napoje.
SELECT product_code, product_name, category
FROM products
WHERE category != "Beverages";
#6 Wyświetl wszystkie dane produktów, których koszt zakupu jest większy niż 12.0000.
SELECT *
FROM products
WHERE standard_cost > 12;
#8 Wyświetl wszystkie informacje o produktach, które mają określona minimalną liczbę zamówienia.
SELECT *
FROM products
WHERE minimum_reorder_quantity IS NOT NULL;
#9 Wyświetl wszystkie informacje o produktach, które mają określona minimalną liczbę zamówienia i ich koszt jest mniejszy niż 10.0000.
SELECT *
FROM products
WHERE minimum_reorder_quantity IS NOT NULL AND standard_cost < 10;
#13 Wyświetl informacje o klientach, których imię zaczyna się na J lub nazwisko zawiera literę o i są menadżerami.
SELECT *
FROM customers
WHERE (first_name LIKE 'J%' OR last_name LIKE '%o%') AND job_title LIKE '%Manager%'; -- nawiasy grupują warunki wg kolejności
#14 Wyświetl informacje o produktach, których id dostawcy równa się 4 lub 6 lub 7.
SELECT *
FROM products
-- WHERE supplier_ids = 4 OR supplier_ids = 6 OR supplier_ids =7; -- "ids" wg zasady taka końcówka dla kluczy obcych 
WHERE supplier_ids IN (4,6,7);
#15. Wyświetl imię, nazwisko i miasto zamieszkania pracowników, których miasto zamieszkania konczy się na 'nd' i nie jest to Redmond. Wyniki posortuj od Z do A względem imienia.
SELECT first_name, last_name, city
FROM employees
WHERE city LIKE '%nd' AND city NOT LIKE '%Redmond%'
ORDER BY first_name DESC;
--
SELECT first_name, last_name, city
FROM employees
WHERE city LIKE '%Redmond%'
ORDER BY first_name DESC;
#17. Zaprezentuj wszystkie produkty posortowane od najmniejszej ceny zakupu (standard_cost) i największej ceny sprzedaży (list_price).
SELECT *
FROM products
ORDER BY standard_cost ASC,  list_price DESC;

-- DISTINCT
#19. Wyświetl listę kategorii produktów, które posiadamy w bazie (nie mogą się powtarzać). Posortuj po nazwie kategorii malejąco.
SELECT DISTINCT category
FROM products
ORDER BY category DESC;

-- AS 
#jak chcemy więej niż jeden wyraz to cudzysłów oddzielony spacjami 
#20. Zaprezentuj raport dla dyrekcji, który będzie zawierał następujące kolumny: Imie_Pracownika, Nazwisko_Pracownika, Miasto. Na raporcie umieść tylko pracowników z Seattle.
SELECT FIRST_NAME AS Imie_Pracownika, LAST_NAME AS "Nazwisko_Pracownika", CITY AS Miasto
FROM employees
WHERE city LIKE '%Seattle%'; -- 5 ROWS
#21. Przedstaw przełożonemu raport, który będzie zawierał miasto, adres dostawy i opłatę za przewóz zamówienia, którego opłata za przewóz mieści się w przedziale 19.1256 a 78.1999.
SELECT SHIP_CITY AS MIASTO, SHIP_ADDRESS AS ADRES, SHIPPING_FEE AS OPŁATA
FROM orders
WHERE shipping_fee BETWEEN 19.1256 AND 78.1999; -- 8 ROWS

-- COUNT
#23. Zlicz liczbę wszystkich zamówień opłaconych kartami kredytowymi.
SELECT COUNT(payment_type)
FROM orders
WHERE payment_type = 'Credit Card';
#24. Zlicz liczbę wszystkich nieopłaconych zamówień.
SELECT COUNT(*)
FROM orders
WHERE payment_type IS NULL; -- konieczna gwiazdka żeby zliczyć wartości NULL

-- MAX() MIN() SUM() AVG()
#25. Wyświetl maksymalną opłatę za transport zamówienia.
SELECT MAX(shipping_fee)
FROM orders;
#26. Jaką wartość ma najtańszy produkt od dostawcy ID = 1.
SELECT MIN(standard_cost)
FROM products
WHERE supplier_ids = '1';
#27. Ile wynosi średnia opłata za przesyłkę w złożonych zamówieniach, uwzględniając tylko opłatę większą niż 0.
SELECT AVG(shipping_fee)
FROM orders
WHERE shipping_fee > 0;
#28. Ile łącznie zamówiono produktu Northwind Traders Coffee (id=43).
SELECT SUM(quantity)
FROM order_details
WHERE product_id = "43"; -- tylko teskt w cudzysłowie lub apostrofach

-- GROUP BY()
#29. Wyświetl minimalny koszt produktu w danej kategorii.
SELECT MIN(standard_cost), category
FROM products
GROUP BY category;
#30. Wskaż jakie zawody wykonują klienci oraz ile osób zadeklarowało dany zawód.
SELECT COUNT(job_title) AS Suma, job_title
FROM customers
GROUP BY job_title
-- ORDER BY COUNT(job_title) DESC
;


/* zadania do zrobienia:
4 Wyświetl wszystkie dane o pracownikach, którzy mieszkają w Redmond.
7 Wyświetl miasto, adres dostawy i opłatę za przewóz zamówienia, którego opłata za przewóz mieści się w przedziale 20.0000 a 78.1223.
10 Wyświetl imię, nazwisko i miasto zamieszkania pracowników, których miasto zamieszkania kończy się na nd.
11 Wyświetl imię, nazwisko i miasto zamieszkania pracowników, których miasto zamieszkania kończy się na nd i nie jest to Redmond.
12 Wyświetl informacje o klientach, którzy nie są menadżerami.
16. Zaprezentuj wszystkie produkty posortowane od najmniejszej ceny zakupu (standard_cost).
18. Podaj listę zawodów (nie mogą się powtarzać), jakie posiadają nasi klienci.
22. Zlicz liczbę wszystkich zamówień.
*/

-- ŁĄCZENIE TABEL
-- INNER JOIN
#31. Wyświetl wszystkie dane produktu oraz dane firmy, która go dostarcza.
SELECT *
FROM products
JOIN suppliers
ON products.supplier_ids = suppliers.id;
#32. Wyświetl nazwę produktu i nazwę firmy, która go dostarcza. Posortuj po nazwie firmy od A do Z.
SELECT product_name, company
FROM products
JOIN suppliers
ON products.supplier_ids = suppliers.id -- koljność bez znaczenia
ORDER BY company ASC;
#33. Wyświetl dane klientów (imię, nazwisko, adres, miasto, kraj), którzy nie dokonali jeszcze płatności za zamówienie.
SELECT first_name AS imię, last_name AS nazwisko, address AS adres, city AS miasto, country_region AS kraj, orders.paid_date
FROM customers
JOIN orders
ON customer_id = orders.customer_id -- CHECK !!!!
WHERE paid_date IS NULL;
SELECT C.first_name AS imię, C.last_name AS nazwisko, C.address AS adres, C.city AS miasto, C.country_region AS kraj, O.paid_date
FROM customers C
JOIN orders O
ON C.id = O.customer_id
WHERE paid_date IS NULL;
-- LEFT JOIN
#35. Zweryfikuj czy wszyscy klienci złożyli już zamówienie. Wyświetl nazwy wszystkich klientów wraz z datą zamówienia i datą wysłania zamówienia.
SELECT company, order_date, shipped_date
FROM customers
LEFT JOIN orders
ON customers.id=orders.customer_id
ORDER BY shipped_date;
#36. Zweryfikuj dla księgowości czy wszystkie faktury zostały już opłacone. Przygotuj raport zawierający kolumny 'Data faktury' i 'Data płatności'.
SELECT paid_date AS "Data płatności", invoice_date AS "Data faktury", invoices.id
FROM invoices
LEFT JOIN orders
ON orders.id=invoices.order_id
ORDER BY paid_date;
-- RIGHT JOIN
#37. Dyrekcja prosi o przygotowanie raportu, który wykaże, czy wszyscy pracownicy składali zamówienia. Raport powinien zawierać datę zamówienia, nazwisko pracownika i jego stanowisko pracy. Ilu pracowników nie złożyło zamówienia?
SELECT last_name AS "nazwisko pracownika", job_title AS "stanowisko pracy", order_date AS "data zamówienia"
FROM orders
RIGHT JOIN employees
ON orders.employee_id=employees.id
WHERE order_date IS NULL
ORDER BY order_date; -- tebelka kolejność ma być zgodna zadaniem
#38. Przygotuj zestawienie, które będzie zawierało dane: nazwa klienta, data zamówienia i data dostawy.
SELECT company AS "nazwa klienta", first_name, last_name, order_date AS "data zamówienia", shipped_date AS "data dostawy"
FROM orders
RIGHT JOIN customers
ON orders.customer_id=customers.id
WHERE (order_date AND shipped_date) IS NOT NULL;
#39. Zweryfikuj dla księgowości czy wszystkie faktury zostały wystawione. Przygotuj raport zawierający zamówienie bez wystawionej faktury kolumny 'Forma płatności', 'Data płatności' i 'Data faktury'.
SELECT payment_type AS "Forma płatności", paid_date AS "Data płatności", invoice_date AS "Data faktury", orders.id AS "Numer zamówienia"
FROM invoices
RIGHT JOIN orders
ON invoices.order_id = orders.id
WHERE invoice_date IS NULL;


/*
34. Przygotuj raport, który zawiera wszystkie dane o zamówieniach i firmach, które dostarczają dane zamówienie. Raport powinien zawierać wszystkie zamówienia wraz z tymi bez określonego jeszcze dostawcy.



*/
