-- ZADANIA SQL TESTLAB

-- 1. Przygotuj listę pracowników, którzy są mężczyznami, a ich imię zaczyna się na G lub nazwisko zawiera literę a.
SELECT *
FROM employees
WHERE gender="M" AND first_name LIKE "G%" OR last_name LIKE "%a%";
-- sprawdzenie:
SELECT * FROM employees WHERE gender = "M" AND (first_name LIKE "G%" OR last_name LIKE "%a%");

-- 2. Policz, ile w firmie pracuje kobiet, których imię kończy się na a.
SELECT COUNT(*)
FROM employees
WHERE gender="F" AND first_name LIKE "%a";
-- sprawdzenie:
SELECT count(*) FROM employees WHERE gender = "F" AND first_name LIKE "%a";

-- 3. Policz, jaka jest średnia pensja pracownika o id (emp_no) = 36567.
SELECT AVG(salary)
FROM salaries
WHERE emp_no="36567";
-- sprawdzenie:
SELECT avg(salary) FROM salaries WHERE emp_no = 36567;

-- 4. Wyświetl listę wszystkich pracowników zawierającą informacje: imię pracownika, nazwisko pracownika, nazwę stanowiska (title).
SELECT first_name, last_name, title
FROM employees
JOIN titles ON titles.emp_no=employees.emp_no;
-- sprawdzenie:
SELECT first_name, last_name, title FROM employees JOIN titles ON titles.emp_no = employees.emp_no;

-- 5. Policz, ilu jest pracowników, którzy mają nazwę stanowiska Staff.
SELECT COUNT(*)
FROM employees
JOIN titles ON titles.emp_no=employees.emp_no
WHERE title="Staff";
-- sprawdzenie:
SELECT count(emp_no) FROM titles WHERE title = 'Staff';

-- 6. Wyświetl listę pracowników urodzonych po 1960 roku. Posortuj pracowników od najmłodszego do najstarszego.
SELECT *
FROM employees
WHERE birth_date>'1960-01-01'
ORDER BY birth_date DESC;
-- sprawdzenie:
SELECT * FROM employees WHERE birth_date>'1960-01-01' ORDER BY birth_date DESC;

-- 7. Policz, jaka jest średnia pensja każdego pracownika.
SELECT AVG(salary), emp_no
FROM salaries
GROUP BY emp_no;
-- sprawdzenie:
SELECT AVG(salary), emp_no FROM salaries GROUP BY emp_no;

-- 8. Wyświetl imię i nazwisko pracowników zatrudnionych po 1990.
SELECT first_name, last_name
FROM employees
WHERE hire_date>'1990-01-01'
ORDER BY last_name ASC;
-- sprawdzenie:
SELECT first_name, last_name FROM employees WHERE hire_date > '1990-01-01';

-- 9. Zlicz, ile w firmie jest kobiet zatrudnionych po 1 marca 1985 roku.
SELECT COUNT(*)
FROM employees
WHERE gender='F' AND hire_date>'1985-03-01';
-- sprawdzenie:
SELECT count(gender) FROM employees WHERE gender = "F" AND hire_date > '1985-03-01';

-- 10. Wyświetl listę pracowaników: imię, naziwsko, nazwa stanowiska, których imię zaczyna się na A i nazwisko zawiera literę a.
SELECT first_name, last_name, title
FROM employees
JOIN titles ON titles.emp_no=employees.emp_no
WHERE first_name LIKE "A%" AND last_name LIKE "%a%";
-- sprawdzenie:
SELECT first_name, last_name, title FROM employees JOIN titles ON titles.emp_no = employees.emp_no WHERE first_name LIKE "A%" AND last_name LIKE "%a%";

-- 11. Wyświetl maksymalną pensję dla każdego z pracowników.
SELECT MAX(salary), emp_no
FROM salaries
GROUP BY emp_no;
-- sprawdzenie:
SELECT max(salary), emp_no FROM salaries GROUP BY emp_no;

-- 12. Zlicz, ile w firmie jest kobiet, których pensja jest pomiędzy 25000 a 50000.
SELECT COUNT(*)
FROM employees
JOIN salaries ON salaries.emp_no=employees.emp_no
WHERE gender='F' AND salary BETWEEN 25000 AND 50000;
-- sprawdzenie:
SELECT count(gender) FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no WHERE gender = "F" AND salary BETWEEN 25000 AND 50000;

-- 13. Zlicz, ilu jest w firmie mężczyzn zatrudnionych przed 1 lutym 1990 roku, których imię zaczyna się na K.
SELECT COUNT(*)
FROM employees
WHERE gender='M' AND hire_date<'1990-02-01' AND first_name LIKE "K%";
-- sprawdzenie:
SELECT count(gender) FROM employees WHERE gender = "M" AND hire_date < '1990-02-01' AND first_name like "K%";

-- 14. Oblicz jak jest różnica pomiędzy maksymalną a minimalną pensją w firmie (po słowie SELECT możesz dokonywać operacji matematycznych np. Select max(number) + min(number) ...).
SELECT MAX(salary)-MIN(salary)
FROM salaries;
-- sprawdzenie:
SELECT max(salary) - min(salary) FROM salaries;

-- 15. Oblicz ile wyniosło średnie miesięczne zatrudnienie pracowaników w roku 1987.
SELECT COUNT(*)/12
FROM employees
WHERE hire_date>'1987-01-01' AND hire_date<'1987-12-31';
-- sprawdzenie:
SELECT count(*)/12 FROM employees WHERE hire_date > '1987-01-01' AND hire_date < '1987-12-31';

-- 16. Wyświetl dane wszystkich pracowników zatrudnionych w departamencie d006.
SELECT *
FROM employees
JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
WHERE dept_no='d006';
-- sprawdzenie:
SELECT employees.* FROM employees JOIN dept_emp ON employees.emp_no = dept_emp.emp_no WHERE dept_no = "d006";

-- 17. Zlicz, ilu pracowników pracuje w każdym departamencie.
SELECT COUNT(*), dept_no
FROM employees
JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
GROUP BY dept_no;
-- sprawdzenie:
SELECT count(*), dept_no FROM employees JOIN dept_emp ON employees.emp_no = dept_emp.emp_no GROUP BY dept_no;

-- 18. Wyświetl imiona kobiet zatrudnionych w firmie (imiona nie mogą się powtarzać). Wyniki posortuj alfabetycznie od A do Z.
SELECT first_name
FROM employees
WHERE gender='F'
GROUP BY first_name
ORDER BY first_name ASC;
-- sprawdzenie:
SELECT DISTINCT first_name FROM employees WHERE gender = "F" ORDER BY first_name ASC;

-- 19. Zweryfikuj, ilu pracowników w firmie ma to samo nazwisko.
SELECT COUNT(*), last_name
FROM employees
GROUP BY last_name;
-- sprawdzenie:
SELECT last_name, count(last_name) FROM employees GROUP BY last_name;

-- 20. Stwórz zapytanie, które wskaże drugą największą pensję w firmie. (zweryfikuj jaka jest maksymalna pensja pracownika w firmie i użyj tej wartości w zapytaniu).
SELECT MAX(SALARY)
FROM salaries
WHERE salary<158220;
-- sprawdzenie:
SELECT max(salary) FROM salaries WHERE salary <> 158220;

-- 21. Zlicz, ilu jest w firmie pracowników, którzy posiadają tę samą nazwę stanowiska.
SELECT COUNT(*), title
FROM titles
GROUP BY title;
-- sprawdzenie:
SELECT title, count(*) FROM titles GROUP BY title;

-- 22. Zlicz, ile kobiet pracuje w firmie na stanowisku Manager.
SELECT COUNT(*)
FROM titles
JOIN employees ON titles.emp_no=employees.emp_no
WHERE title='Manager' AND gender='F';
-- sprawdzenie:
SELECT title, count(*) FROM titles JOIN employees on titles.emp_no = employees.emp_no WHERE gender = "F" AND title = "Manager" GROUP BY title;

-- 23. Wylicz średnią pensję mężczyzn w firmie.
SELECT AVG(salary)
FROM salaries
JOIN employees ON salaries.emp_no=employees.emp_no
WHERE gender='M';
-- sprawdzenie:
SELECT avg(salary) FROM salaries JOIN employees on salaries.emp_no = employees.emp_no WHERE gender = "M";

-- 24. Wskaż 4 najmniejszą pensję w firmie.
SELECT MIN(salary)
FROM salaries
WHERE salary>38786;
-- sprawdzenie:
SELECT min(salary) FROM salaries WHERE salary NOT IN (38623, 38735, 38786);

-- 25. Wyświetl imiona pracowników w kolejności alfabetycznej, którzy zostali zatrudnieni w latach 1980 - 1995.
SELECT first_name
FROM employees
WHERE hire_date>'1980-01-01' AND hire_date<'1995-12-31'
ORDER BY first_name ASC;
-- sprawdzenie:
SELECT first_name FROM employees WHERE hire_date > '1980-01-01' and hire_date < '1995-12-31' ORDER BY first_name ASC;

-- 26. Wypisz imię i płeć pracowników: mężczyzn, których imię zaczyna się na P i kobiet, których imię zaczyna się na A.
SELECT first_name, gender
FROM employees
WHERE (first_name LIKE 'P%' AND gender='M') OR (first_name LIKE 'A%' AND gender='F');
-- sprawdzenie:
SELECT first_name, gender FROM employees WHERE (gender = "M" and first_name LIKE "P%") OR (gender = "F" and first_name LIKE "A%");

-- 27. Wyświetl numer pracownika (emp_no), nazwę departamentu oraz zakres dat kiedy tam pracował. Wyniki posortuj względem numeru pracownika od najmniejszego.
SELECT emp_no, dept_name, from_date, to_date
FROM dept_emp
JOIN departments ON departments.dept_no=dept_emp.dept_no
ORDER BY emp_no ASC;
-- sprawdzenie:
SELECT dept_emp.emp_no, departments.dept_name, from_date, to_date FROM departments JOIN dept_emp ON departments.dept_no = dept_emp.dept_no ORDER By emp_no;

-- 28. Wyszukaj pracowników i wyświetl numer pracownika (emp_no), nazwę departamentu oraz zakres dat kiedy tam pracował, którzy zmienili choć raz stanowisko przed 1 stycznia 2000.
SELECT dept_emp.emp_no, departments.dept_name, from_date, to_date 
FROM departments 
JOIN dept_emp ON departments.dept_no=dept_emp.dept_no 
WHERE to_date<'2000-01-01';
-- sprawdzenie:
SELECT dept_emp.emp_no, departments.dept_name, from_date, to_date FROM departments JOIN dept_emp ON departments.dept_no = dept_emp.dept_no WHERE to_date < "2000-01-01";

-- 29. Zweryfikuj, czy jakiś z pracowników zmienił dział więcej niż 1 raz.
SELECT COUNT(dept_no), dept_emp.emp_no 
FROM employees 
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
GROUP BY dept_emp.emp_no 
ORDER BY COUNT(dept_no) DESC;
-- sprawdzenie:
SELECT count(dept_no), dept_emp.emp_no FROM employees JOIN dept_emp ON employees.emp_no = dept_emp.emp_no GROUP BY dept_emp.emp_no ORDER BY count(dept_no) DESC;

-- 30. Zlicz, ilu jest w firmie pracowników, którzy pracują na stanowiskach Engineer i Senior Engineer.
SELECT COUNT(*), title
FROM titles
WHERE title='Engineer' OR title='Senior Engineer'
GROUP BY title;
-- sprawdzenie:
SELECT title, count(*) FROM titles WHERE title IN ("Engineer", "Senior Engineer") GROUP BY title;
