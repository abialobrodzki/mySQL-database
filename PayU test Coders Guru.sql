# Realizacja płatności PayU dla strony Coders Guru
# wykonano: 03.02.2022

SHOW tables;
-- SELECT *
-- FROM user WHERE email =("private1@gmail.com" "private3@gmail.com" "company2@gmail.com");

SELECT * FROM user WHERE email like "private1@gmail.com"; -- zapamiętać "user_id"
SELECT * FROM payment WHERE user_id = 6116; -- wyszukiwanie po "used_id"
UPDATE payment SET STATUS = "COMPLETED" WHERE slot_id='10094'; -- zmiana statusu na COMPLETED po "slot_id"
SELECT * FROM codersguru.users_slots WHERE user_id = '6116'; -- tutaj na tym etapie nie powinno być wskazanego "user_id" i "slot_id"
INSERT INTO users_slots values('6116', '10094'); -- połączenie dwóch informacji po "user_id" - po wykonaniu polecenia nastąpi połączonie "user_id" i "slot_id"

SELECT * FROM slot WHERE id='10094'; -- "slot_id" pokazuje jaka jest aktualna sytuacja z zamówieniem, w tym jego status
/*  Statusy zamówienia: 
	oczekujące: completed=0 paid=0
	opłacone: completed=0 paid=1
	zarchiwizowane: completed=1 paid=1 */
UPDATE slot SET paid = 1 WHERE id = '10094';
UPDATE slot SET completed = 1 WHERE id = '10094';