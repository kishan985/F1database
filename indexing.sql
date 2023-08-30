CREATE INDEX idx_circuitid ON Races (CircuitID);
CREATE INDEX idx_raceid ON Results (RaceID);
CREATE INDEX idx_driverid ON Results (DriverID);
CREATE INDEX idx_constructorid ON Results (ConstructorID);
CREATE INDEX idx_dnationality ON Drivers USING bitmap (Nationality);
CREATE INDEX idx_cnationality ON Constructor USING bitmap (Nationality);