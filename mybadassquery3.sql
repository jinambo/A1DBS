-- 1.
CREATE TABLE PredmetZmena (
	PredmetZmenaID int identity(1,1) PRIMARY KEY,
	PredmetID int FOREIGN KEY REFERENCES Predmet(PredmetID),
	PuvodniNazev varchar(55),
	DatumZmeny date
)

-- 2.
CREATE PROCEDURE pMistnostiDlePredmetu
	@Predmet varchar(50)
AS
BEGIN
	SELECT Mistnost, Nazev FROM Predmet WHERE Nazev LIKE '%' + @Predmet + '%' 
END

-- volání procedury
EXEC pMistnostiDlePredmetu 'A1MAS'

-- 3. 
DECLARE @dopocitanaHodnota tinyint;

SELECT @dopocitanaHodnota =  YEAR(GETDATE()) - (1900 + LEFT(Student.RodneCislo, 2)) FROM Student;
PRINT @dopocitanaHodnota;

UPDATE Student SET Vek=@dopocitanaHodnota 

-- 4.
SELECT Student.KrestniJmeno, Student.Prijmeni, Student.Rocnik, Vyznamenani =
CASE
	WHEN Student.StudijniPrumer <= 1.49 THEN 'Ano'
	WHEN Student.StudijniPrumer >= 1.5 THEN 'Ne'
END
FROM Student
WHERE Rocnik = 3

-- 5.
SELECT DISTINCT Predmet.Nazev FROM Predmet
INNER JOIN Zapis ON Zapis.PredmetID = Predmet.PredmetID
INNER JOIN Student ON Student.StudentID = Zapis.StudentID
INNER JOIN Obor ON Obor.OborID = Student.OborID
WHERE Student.Vek > 25 AND Obor.Nazev = 'SWI'
