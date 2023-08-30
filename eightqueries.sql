
-- Query to show 5th round of Formula 1 championship season every year.SELECT Races.RaceName, Circuits.Location, Circuits.Country
FROM Races
INNER JOIN Circuits ON Races.CircuitID = Circuits.CircuitID
WHERE Races.Round = 5;

-- Query listing all the constructors with with their respective number of race wins in F1.
SELECT Constructor.ConstructorName, COUNT(*) AS wins
FROM Constructor
INNER JOIN Results ON Constructor.ConstructorID = Results.ConstructorID
WHERE Results.position = 1
GROUP BY Constructor.ConstructorName
ORDER BY wins DESC;

--Query showing results of US GP 2022.
SELECT Drivers.FirstName, Drivers.LastName, Constructor.ConstructorName, Results.position
FROM Results
JOIN Races ON Races.RaceID = Results.RaceID
JOIN Drivers ON Drivers.DriverID = Results.DriverID
JOIN Constructor ON Constructor.ConstructorID = Results.ConstructorID
WHERE Races.Date = '2022-10-23';

-- Query showing circuit names and the number of times they have hosted a race
SELECT Circuits.CircuitName, COUNT(Races.RaceID) as NumberOfRaces
FROM Circuits
JOIN Races ON Races.CircuitID = Circuits.CircuitID
GROUP BY Circuits.CircuitID
ORDER BY NumberOfRaces DESC


-- Some Insert, Delete and Update Queries.
INSERT INTO Constructors (ConstructorID, ConstructorName, Nationality)
VALUES (1, 'Mercedes', 'German');

UPDATE Circuits
SET Country = 'Spain'
WHERE CircuitName = 'Circuit de Barcelona-Catalunya';

DELETE FROM Drivers
WHERE FirstName = 'Lewis' AND LastName = 'Hamilton';

INSERT INTO Races (RaceID, Date, Round, CircuitID, RaceName)
VALUES (1, '2023-06-18', 9, 2, 'French Grand Prix');

UPDATE Results
SET points = 10
WHERE ResultID = 1;

DELETE FROM Constructors
WHERE ConstructorID = 2;
