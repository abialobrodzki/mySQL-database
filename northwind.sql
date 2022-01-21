/* northwind */
-- ćwiczenia
# 8 styczeń 2022 // modyfikacja: 20.01.2022

#Przykład:
SELECT *
FROM customers; #słowa kluczowe wielkimi literami i w jednej linijce

-- PRO TIPS:
# błyskawica ze znacznikiem - wykonanie tylko tego kodu, gdzie znajduje się kursor/znacznik
# po lewej w SCHEMAS są ikonki dla tabel: 'i'(informacje); 'klucza' (ustawienia); 'tabelka'(szybkie generowanie całej tabelki)
# kliknięcie nazwy kolumny 2xLPM przeniesienie do kodu !!! (nie trzeba wpisywać z "palca")
# w przypadku, gdy w nazwie ma być więcej niż jeden wyraz to stosować "cudzysłów" i oddzielać spacjami 
# tylko tekst umieszczamy w "cudzysłowie" lub 'apostrofach'


-- POBIERANIE DANYCH
-- SELECT
#1 Wszystkie dane o pracownikach.
SELECT *
FROM employees;
#2 Kod i nazwa wszystkich produktów.
SELECT CategoryID /*product_code*/, ProductName /*product_name*/ #inna wersja bazy
FROM products;
#3 Wszystkie dane adresowe dostawców.
SELECT *
FROM suppliers;

-- WHERE
#4 Wszystkie dane o pracownikach, którzy mieszkają w Redmond.
SELECT *
FROM employees
WHERE City = "Redmond";
#5 Kod, nazwa i kategoria wszystkich produktów, które nie należą do kategorii: Napoje.
SELECT CategoryID /*product_code*/, ProductName /*product_name*/, CategoryID /*category*/
FROM products
WHERE CategoryID /*category*/ != "1" /*"Beverages"*/; #inna wersja bazy - albo łączyć tabele lub podać numer kategorii
#6 Wszystkie dane produktów, których koszt zakupu jest większy niż 12.0000.
SELECT *
FROM products
WHERE UnitPrice /*standard_cost*/ > 12.000; #inna wersja bazy
#7 Miasto, adres dostawy i opłata za przewóz zamówienia, którego opłata za przewóz mieści się w przedziale 20.0000 a 78.1223.
SELECT ShipCity, ShipAddress, Freight #inna wersja bazy
FROM orders
WHERE Freight BETWEEN 20.0000 AND 78.1223;
#8 Wszystkie informacje o produktach, które mają określona minimalną liczbę zamówienia.
SELECT *
FROM products
WHERE ReorderLevel /*minimum_reorder_quantity*/ IS NOT NULL; #inna wersja bazy
#9 Wszystkie informacje o produktach, które mają określona minimalną liczbę zamówienia i ich koszt jest mniejszy niż 10.0000.
SELECT *
FROM products
WHERE ReorderLevel /*minimum_reorder_quantity*/ IS NOT NULL AND UnitPrice /*standard_cost*/ < 10.000; #inna wersja bazy
#10 Imię, nazwisko i miasto zamieszkania pracowników, których miasto zamieszkania kończy się na "nd".
SELECT FirstName, LastName, City
FROM employees
WHERE City LIKE "%nd";
#11 Imię, nazwisko i miasto zamieszkania pracowników, których miasto zamieszkania kończy się na "nd" i nie jest to Redmond.
SELECT FirstName, LastName, City
FROM employees
WHERE City LIKE "%nd" AND City != "Redmond";
#12 Informacje o klientach, którzy nie są menadżerami.
SELECT *
FROM customers
WHERE ContactTitle LIKE "%Manager%";
#13 Informacje o klientach, których imię zaczyna się na J lub nazwisko zawiera literę o i są menadżerami.
SELECT * #inna wersja bazy - brak podziału na imię i nazwisko klienta
FROM customers
WHERE (first_name LIKE 'J%' OR last_name LIKE '%o%') AND job_title LIKE '%Manager%'; -- nawiasy grupują warunki wg kolejności
#14 Informacje o produktach, których id dostawcy równa się 4 lub 6 lub 7.
SELECT *
FROM products
-- WHERE supplier_ids = 4 OR supplier_ids = 6 OR supplier_ids =7; -- "ids" wg zasady taka końcówka dla kluczy obcych 
WHERE SupplierID /*supplier_ids*/ IN (4,6,7); #inna wersja bazy

-- ORDER BY
#15. Imię, nazwisko i miasto zamieszkania pracowników, których miasto zamieszkania konczy się na 'nd' i nie jest to Redmond. Wyniki posortuj od Z do A względem imienia.
SELECT FirstName /*first_name*/, LastName /*last_name*/, city
FROM employees
WHERE city LIKE '%nd' AND city NOT LIKE '%Redmond%'
ORDER BY FirstName /*first_name*/ DESC; #inna wersja bazy
SELECT FirstName /*first_name*/, LastName /*last_name*/, city
FROM employees
WHERE city LIKE '%Redmond%'
ORDER BY FirstName /*first_name*/ DESC; #pracownicy mieszkający w Redmond
#16. Wszystkie produkty posortowane od najmniejszej ceny zakupu (standard_cost).
SELECT *
FROM products
ORDER BY UnitPrice ASC;
#17. Wszystkie produkty posortowane od najmniejszej ceny zakupu (standard_cost) i największej ceny sprzedaży (list_price).
SELECT *
FROM products
ORDER BY standard_cost ASC,  list_price DESC; #inna wersja bazy - brak informacji o cenach

-- DISTINCT
#18. Lista zawodów (nie mogą się powtarzać), jakie posiadają nasi klienci.
SELECT DISTINCT ContactTitle
FROM customers; #inna wersja bazy - brak zawodów
#19. Lista kategorii produktów, które posiadamy w bazie (nie mogą się powtarzać). Posortuj po nazwie kategorii malejąco.
SELECT DISTINCT CategoryName /*category*/
FROM categories/*products*/
ORDER BY CategoryName /*category*/ DESC; #inna wersja bazy

-- AS 
#20. Raport dla dyrekcji, który będzie zawierał następujące kolumny: Imie_Pracownika, Nazwisko_Pracownika, Miasto. Na raporcie umieść tylko pracowników z Seattle.
SELECT FirstName /*FIRST_NAME*/ AS Imie_Pracownika, LastName /*LAST_NAME*/ AS "Nazwisko_Pracownika", CITY AS Miasto
FROM employees
WHERE city LIKE '%Seattle%'; #inna wersja bazy
#21. Raport, który będzie zawierał miasto, adres dostawy i opłatę za przewóz zamówienia, którego opłata za przewóz mieści się w przedziale 19.1256 a 78.1999.
SELECT ShipCity /*SHIP_CITY*/ AS "Miasto", ShipAddress /*SHIP_ADDRESS*/ AS "Adres", Freight /*SHIPPING_FEE*/ AS "Opłata"
FROM orders
WHERE Freight /*SHIPPING_FEE*/ BETWEEN 19.1256 AND 78.1999; #inna wersja bazy

-- COUNT
#22. Zlicz liczbę wszystkich zamówień.
SELECT COUNT(*)
FROM orders
WHERE OrderID IS NOT NULL;
#23. Zlicz liczbę wszystkich zamówień opłaconych kartami kredytowymi.
SELECT COUNT(payment_type)
FROM orders
WHERE payment_type = 'Credit Card'; #inna wersja bazy - brak metody płatności
#24. Zlicz liczbę wszystkich nieopłaconych zamówień.
SELECT COUNT(*) #inna wersja bazy - brak info o opłaconych zamówieniach
FROM orders
WHERE payment_type IS NULL; -- konieczna gwiazdka żeby zliczyć wartości NULL

-- MAX() MIN() SUM() AVG()
#25. Maksymalna opłata za transport zamówienia.
SELECT MAX(Freight /*shipping_fee*/)
FROM orders; #inna wersja bazy
#26. Wartość najtańszego produktu od dostawcy ID = 1.
SELECT MIN(UnitPrice /*standard_cost*/)
FROM products
WHERE SupplierID /*supplier_ids*/ = '1'; #inna wersja bazy
#27. Średnia opłata za przesyłkę w złożonych zamówieniach, uwzględniając tylko opłatę większą niż 0.
SELECT AVG(Freight /*shipping_fee*/)
FROM orders
WHERE Freight /*shipping_fee*/ > 0; #inna wersja bazy
#28. Łączne zamówienia produktu "Northwind Traders Coffee" (id=43).
SELECT SUM(quantity) #inna wersja bazy - brak produktu
FROM order_details
WHERE product_id = "43"; 

-- GROUP BY()
#29. Minimalny koszt produktu w danej kategorii.
SELECT MIN(UnitPrice /*standard_cost*/), CategoryID /*category*/
FROM products
GROUP BY CategoryID /*category*/; #inna wersja bazy
#30. Zawody jakie wykonują klienci oraz ile osób zadeklarowało dany zawód.
SELECT COUNT(ContactTitle /*job_title*/) AS "Suma", ContactTitle /*job_title*/
FROM customers
GROUP BY ContactTitle /*job_title*/ #inna wersja bazy
-- ORDER BY COUNT(job_title) DESC
;


-- ŁĄCZENIE TABEL
-- INNER JOIN
#31. Wszystkie dane produktu oraz dane firmy, która go dostarcza.
SELECT *
FROM products
JOIN suppliers
ON products.SupplierID /*products.supplier_ids*/ = suppliers.SupplierID /*suppliers.id*/; #inna wersja bazy
#32. Nazwa produktu i nazwa firmy, która go dostarcza. Posortuj po nazwie firmy od A do Z.
SELECT ProductName /*product_name*/, CompanyName /*company*/
FROM products
JOIN suppliers
ON products.SupplierID /*products.supplier_ids*/ = suppliers.SupplierID /*suppliers.id*/ -- kolejność bez znaczenia
ORDER BY CompanyName /*company*/ ASC; #inna wersja bazy
#33. Dane klientów (imię, nazwisko, adres, miasto, kraj), którzy nie dokonali jeszcze płatności za zamówienie.
SELECT first_name AS "imię", last_name AS "nazwisko", address AS "adres", city AS "miasto", country_region AS "kraj", orders.paid_date
FROM customers
JOIN orders
ON customers.id = orders.customer_id
WHERE paid_date IS NULL; #inna wersja bazy
SELECT C.first_name AS "imię", C.last_name AS "nazwisko", C.address AS "adres", C.city AS "miasto", C.country_region AS "kraj", O.paid_date
FROM customers C
JOIN orders O
ON C.id = O.customer_id
WHERE paid_date IS NULL; #inna wersja bazy

-- LEFT JOIN
#34. Wszystkie dane o zamówieniach i firmach, które dostarczają dane zamówienie. Wszystkie zamówienia wraz z tymi bez określonego jeszcze dostawcy.
SELECT *
FROM northwind.`order details` O
LEFT JOIN products
ON O.ProductID = products.ProductID; #inna wersja bazy - trudno to jakoś sensownie powiązać
#35. Nazwy wszystkich klientów, którzy złożyli zamówienie wraz z datą zamówienia i datą wysłania zamówienia.
SELECT CompanyName /*company*/, OrderDate /*order_date*/, ShippedDate /*shipped_date*/
FROM customers
LEFT JOIN orders
ON customers.CustomerID /*customers.id*/ = orders.CustomerID /*orders.customer_id*/
WHERE OrderDate IS NOT NULL
ORDER BY ShippedDate /*shipped_date*/; #inna wersja bazy
#36. Wszystkie faktury, które zostały już opłacone. Przygotuj raport zawierający kolumny 'Data faktury' i 'Data płatności'.
SELECT paid_date AS "Data płatności", invoice_date AS "Data faktury", invoices.id
FROM invoices
LEFT JOIN orders
ON orders.id=invoices.order_id
ORDER BY paid_date; #inna wersja bazy - brak info o fakturach

-- RIGHT JOIN
#37. Pracownicy składający zamówienia. Raport powinien zawierać datę zamówienia, nazwisko pracownika i jego stanowisko pracy. Ilu pracowników nie złożyło zamówienia?
SELECT employees.LastName /*last_name*/ AS "nazwisko pracownika", employees.Title /*job_title*/ AS "stanowisko pracy", orders.OrderDate /*order_date*/ AS "data zamówienia"
FROM orders
RIGHT JOIN employees
ON orders.EmployeeID /*orders.employee_id*/ = employees.EmployeeID /*employees.id*/
WHERE OrderDate /*order_date*/ IS NOT NULL -- "IS NULL" wykaże pracowników bez zamówienia
ORDER BY OrderDate /*order_date*/; -- tabelka kolejność ma być zgodna zadaniem #inna wersja bazy
#38. Zestawienie zawierające dane: nazwa klienta, data zamówienia i data dostawy.
SELECT customers.CompanyName /*company*/ AS "nazwa klienta", customers.ContactName /*first_name, last_name*/, orders.OrderDate /*order_date*/ AS "data zamówienia", orders.ShippedDate /*shipped_date*/ AS "data dostawy"
FROM orders
RIGHT JOIN customers
ON orders.CustomerID /*orders.customer_id*/ = customers.CustomerID /*customers.id*/
WHERE (orders.OrderDate /*order_date*/ AND orders.ShippedDate /*shipped_date*/) IS NOT NULL; #inna wersja bazy
#39. Wszystkie wystawione faktury. Raport zawierający zamówienie bez wystawionej faktury kolumny 'Forma płatności', 'Data płatności' i 'Data faktury'.
SELECT payment_type AS "Forma płatności", paid_date AS "Data płatności", invoice_date AS "Data faktury", orders.id AS "Numer zamówienia"
FROM invoices
RIGHT JOIN orders
ON invoices.order_id = orders.id
WHERE invoice_date IS NULL; #inna wersja bazy - brak info o fakturach
