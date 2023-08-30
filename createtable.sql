-- Below queries will create tables.

CREATE TABLE Constructor(
	ConstructorID INT,
	ConstructorName VARCHAR(100),
	Nationality VARCHAR(100),
	PRIMARY KEY(ConstructorID)
	);
	
CREATE TABLE Circuits(
	CircuitID INT,
	CircuitName VARCHAR(100),
	Location VARCHAR(100),
	Country VARCHAR(100),
	PRIMARY KEY(CircuitID)
	);
CREATE TABLE Drivers(
	DriverID INT,
	number INT,
	code VARCHAR(100),
	FirstName VARCHAR(100),
	LastName VARCHAR(100),
	Nationality VARCHAR(100),
	PRIMARY KEY(DriverID)
	);
CREATE TABLE Races(
	RaceID INT,
	Date DATE,
    Round  INT,
	CircuitID INT,
	RaceName VARCHAR(100),
	PRIMARY KEY(RaceID),
	FOREIGN KEY(CircuitID) REFERENCES Circuits
	);
CREATE TABLE Results(
	ResultID INT, 
	RaceID INT, 
	DriverID INT, 
	ConstructorID INT,
	grid INT,
	position INT,
	points decimal(5,2),
	laps INT,
	rank INT,
	PRIMARY KEY(ResultID),
	FOREIGN KEY(RaceID) REFERENCES Races,
	FOREIGN KEY(DriverID) REFERENCES Drivers,
	FOREIGN KEY(ConstructorID) REFERENCES Constructor
	);

-- Below queries will create b-tree indexes on the above table.
CREATE INDEX idx_circuitid 
ON Races (CircuitID);

CREATE INDEX idx_raceid 
ON Results (RaceID);

CREATE INDEX idx_driverid 
ON Results (DriverID);

CREATE INDEX idx_constructorid 
ON Results (ConstructorID);

CREATE INDEX idx_dnationality 
ON Drivers (Nationality);

CREATE INDEX idx_cnationality 
ON Constructor (Nationality);