# Realizacja płatności PayU dla strony Coders Guru
# wykonano: 22.01.2022

SHOW tables;
-- SELECT *
-- FROM user WHERE email =("private1@gmail.com" "private3@gmail.com" "company2@gmail.com");

SELECT * FROM user WHERE email like "company2@gmail.com"; -- zapamiętać "user_id"
SELECT * FROM payment WHERE user_id = 6121; -- wyszukiwanie po "used_id"
UPDATE payment SET STATUS = "COMPLETED" WHERE slot_id='10057'; -- zmiana statusu na COMPLETED po "slot_id"
SELECT * FROM codersguru.users_slots WHERE user_id = '6121'; -- tutaj na tym etapie nie powinno być wskazanego "user_id" i "slot_id"
INSERT INTO users_slots values('6121', '10057'); -- połączenie dwóch informacji po "user_id" - w tym momencie połączoni "user_id" i "slot_id"

SELECT * FROM slot WHERE id='10057'; -- "slot_id" pokazuje jaka jest aktualna sytuacja z zamówieniem
/* statusy zamówienia "completed' = 0 i "paid" = 0 to płatność oczekująca */
-- UPDATE slot SET paid = 0 WHERE id = '10057';
-- UPDATE slot SET completed = 0 WHERE id = '10057';
/* statusy zamówienia "completed' = 0 i "paid" = 1 to płatność opłacona */
UPDATE slot SET paid = 1 WHERE id = '10057';
UPDATE slot SET completed = 1 WHERE id = '10057';