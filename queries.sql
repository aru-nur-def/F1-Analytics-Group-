-- Количество гонок в каждом сезоне
SELECT year, COUNT(*) AS total_races
FROM races
GROUP BY year
ORDER BY year ASC;

-- Количество побед (position = 1) у каждого гонщика
SELECT d.driverId, d.forename, d.surname, COUNT(*) AS wins
FROM results r
JOIN drivers d ON r.driverId = d.driverId
WHERE r.position = 1
GROUP BY d.driverId, d.forename, d.surname
ORDER BY wins DESC
LIMIT 10;

-- Количество побед у каждой команды (конструктора)
SELECT c.constructorId, c.name AS constructor, COUNT(*) AS wins
FROM results r
JOIN constructors c ON r.constructorId = c.constructorId
WHERE r.position = 1
GROUP BY c.constructorId, c.name
ORDER BY wins DESC
LIMIT 10;

-- Количество гонок на каждом автодроме
SELECT ci.circuitId, ci.name AS circuit, COUNT(*) AS total_races
FROM races ra
JOIN circuits ci ON ra.circuitId = ci.circuitId
GROUP BY ci.circuitId, ci.name
ORDER BY total_races DESC
LIMIT 10;

-- Среднее количество кругов на гонку по годам
SELECT ra.year, AVG(l.lap) AS avg_laps
FROM lap_times l
JOIN races ra ON l.raceId = ra.raceId
GROUP BY ra.year
ORDER BY ra.year ASC;

-- Топ-5 национальностей по количеству гонщиков
SELECT nationality, COUNT(*) AS driver_count
FROM drivers
GROUP BY nationality
ORDER BY driver_count DESC
LIMIT 5;

-- Среднее количество гонок на одного гонщика
SELECT AVG(race_count) AS avg_races_per_driver
FROM (
    SELECT driverId, COUNT(*) AS race_count
    FROM results
    GROUP BY driverId
) sub;

-- Первая и последняя гонка для каждого гонщика
SELECT d.driverId, d.forename, d.surname, MIN(ra.date) AS debut, MAX(ra.date) AS last_race
FROM results r
JOIN drivers d ON r.driverId = d.driverId
JOIN races ra ON r.raceId = ra.raceId
GROUP BY d.driverId, d.forename, d.surname
ORDER BY debut ASC
LIMIT 10;

-- Средняя позиция в гонках у каждого гонщика
SELECT d.driverId, d.forename, d.surname, AVG(r.position) AS avg_position
FROM results r
JOIN drivers d ON r.driverId = d.driverId
WHERE r.position > 0
GROUP BY d.driverId, d.forename, d.surname
ORDER BY avg_position ASC
LIMIT 10;

-- Топ-10 гонок по количеству участников
SELECT ra.raceId, ra.year, ra.name, COUNT(r.driverId) AS participants
FROM results r
JOIN races ra ON r.raceId = ra.raceId
GROUP BY ra.raceId, ra.year, ra.name
ORDER BY participants DESC
LIMIT 10;
