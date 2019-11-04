-- Vypi�te ro�n�k a pr�m�rn� v�k student� vka�d�m ro�n�ku.
SELECT Rocnik, AVG(Vek) as PrumVek FROM Student GROUP BY Rocnik


-- Vypi�te ro�n�k a pr�m�rn� v�k student� pro ka�d� ro�n�k krom� prvn�ho.
SELECT Rocnik, AVG(Vek) as PrumVek FROM Student WHERE Rocnik > 1 GROUP BY Rocnik  


-- Vypi�te n�zev oboru a pr�m�rn� v�k student� v jednotliv�ch oborech
SELECT Obor.Nazev, AVG(Student.Vek) as PrumVek FROM Obor
INNER JOIN Student ON Student.OborID = Obor.OborID
GROUP BY Obor.Nazev


-- Vypi�te seznam v�ech student�, kte�� se p�ihl�sili maxim�ln� na 2 p�edm�ty.
SELECT Student.KrestniJmeno, Student.Prijmeni, COUNT(Zapis.PredmetID) AS PocetPredmetu FROM Student
INNER JOIN Zapis ON Zapis.StudentID = Student.StudentID
-- WHERE COUNT(Zapis.PredmetID) < 2
GROUP BY Student.KrestniJmeno, Student.Prijmeni 


-- Zm��te v tabulce Student pole vek na RodneCislo a zapl�te ho �daji.
ALTER TABLE Student
ADD RodneCislo INT
UPDATE Student SET RodneCislo = 0011094169 WHERE StudentID = 6


-- P�idejte do tabulky Student pole DatumNastupua zapl�te ho �daji.
ALTER TABLE Student 
ADD DatumNastupu datetime
UPDATE Student SET DatumNastupu = '2016-09-17' WHERE DatumNastupu is null


-- Vypi�te seznam v�ech studentek -na z�klad� pole RodneCislo.
SELECT KrestniJmeno, Prijmeni FROM Student WHERE (RodneCislo - 50000000) > 0