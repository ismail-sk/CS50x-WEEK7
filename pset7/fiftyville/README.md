## Pset 7: Fiftyville
The instructions of Pset:
https://cs50.harvard.edu/x/2021/psets/7/fiftyville/


Emply files(used database is into this zip): https://cdn.cs50.net/2020/fall/psets/7/fiftyville/fiftyville.zip

### Answer is(log.sql):
```
-- Keep a log of any SQL queries you execute as you solve the mystery.
-- reaching the crime case
SELECT description FROM crime_scene_reports
WHERE year = 2020 AND month = 7 AND day = 28 AND street = "Chamberlin Street";

--find mentioned "courthouse" in interviews
SELECT name, transcript FROM interviews WHERE transcript LIKE "%courthouse%";

--- MAIN COMBINED COMMAND

SELECT * FROM people WHERE phone_number IN (
SELECT phone_number FROM people
JOIN bank_accounts ON bank_accounts.person_id = people.id
-- According to Eugene's statement: ATM transactions in Fifer Street
WHERE bank_accounts.account_number IN (SELECT account_numbe FROM atm_transactions WHERE
atm_location = "Fifer Street" AND transaction_type = "withdraw" AND year = 2020 AND month = 7 AND day = 28)

INTERSECT
-- According to Raymond's statement: Raymond seen thief called some one
SELECT caller FROM phone_calls WHERE year = 2020 AND month = 7 AND day = 28 AND duration < 60

INTERSECT
-- According to Raymond's heard phone talk: Find first flight the tomorrow
SELECT people.phone_number FROM people
JOIN passengers ON people.passport_number = passengers.passport_number
WHERE passengers.flight_id IN ( SELECT id FROM flights WHERE
origin_airport_id = (SELECT id FROM airports WHERE city = "Fiftyville")
AND year = 2020 AND month = 7 AND day = 29 ORDER BY hour,minute LIMIT 1)

INTERSECT
-- According to Ruth'S statement: park area in-out check
SELECT people.phone_number FROM people WHERE license_plate IN (
SELECT license_plate FROM courthouse_security_logs
WHERE month = 7 AND day = 28 AND activity IS 'exit' AND hour = 10 AND (minute < 25 AND minute >= 15)));

---



-- Which city the thief escaped to?
SELECT city FROM airports WHERE id = (
SELECT destination_airport_id FROM flights WHERE
origin_airport_id = (SELECT id FROM airports WHERE city = "Fiftyville")
AND year = 2020 AND month = 7 AND day = 29 ORDER BY hour,minute LIMIT 1);

-- Who accomplice of thief?
SELECT name FROM people WHERE phone_number IN (
SELECT receiver FROM phone_calls WHERE year = 2020 AND month = 7 AND day = 28 AND duration < 60 AND caller = (
SELECT phone_number FROM people WHERE name IS 'Ernest'));
```
