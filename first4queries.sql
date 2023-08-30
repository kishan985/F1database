-- Constructors with race wins.
SELECT constructor.constructorname as Constructor, constructor.Nationality
FROM constructor
WHERE constructor.constructorid in (SELECT constructor.constructorid 
						 			FROM results
						 			INNER JOIN constructor on results.constructorid = constructor.constructorid
						 			WHERE results.position = 1);
									
-- Drivers with race wins.
SELECT drivers.firstname, drivers.lastname, drivers.nationality
FROM drivers
WHERE drivers.driverid in (SELECT drivers.driverid
						   FROM results
						   INNER JOIN drivers on results.driverid = drivers.driverid
						   WHERE results.position = 1);
						   
-- Fernando Alonso's race wins.
SELECT races.racename, circuits.circuitname, races.date, results.grid as StartPosition, constructor.constructorname
FROM results
INNER JOIN drivers on results.driverid = drivers.driverid
INNER JOIN constructor on results.constructorid = constructor.constructorid
INNER JOIN races on results.raceid = races.raceid
INNER JOIN circuits on races.circuitid = circuits.circuitid
WHERE results.position = 1 and drivers.firstname = 'Fernando' and drivers.lastname = 'Alonso'
ORDER BY races.date;

-- Top 10 F1 Race Winners.
SELECT drivers.firstname, drivers.lastname, drivers.nationality, COUNT(*) as RaceWins
FROM results
INNER JOIN drivers on results.driverid = drivers.driverid
WHERE results.position = 1
GROUP BY drivers.driverid
ORDER BY COUNT(*) DESC
LIMIT 10;