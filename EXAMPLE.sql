CREATE TABLE Locations (LocationID int, LocName varchar(100))
 
CREATE TABLE LocationHist (LocationID int, ModifiedDate DATETIME)

INSERT INTO Locations(LocationID,LocName)VALUES(123,'VALLAH')
UPDATE Locations
SET LocName='PUNE'
WHERE LocationID=123
SELECT * FROM LocationHist

CREATE TRIGGER TR_UPD_Locations ON Locations
FOR UPDATE 
NOT FOR REPLICATION 
AS
 
BEGIN
  INSERT INTO LocationHist
  SELECT LocationID
    ,getdate()
  FROM inserted
END

CREATE TRIGGER TR_DEL_Locations ON Locations
INSTEAD OF DELETE
AS
BEGIN
  Select 'Sample Instead of trigger' as [Message]
END