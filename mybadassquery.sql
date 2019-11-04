-- Vypište roèník a prùmìrný vìk studentù vkaždém roèníku.
SELECT Rocnik, AVG(Vek) as PrumVek FROM Student GROUP BY Rocnik


-- Vypište roèník a prùmìrný vìk studentù pro každý roèník kromì prvního.
SELECT Rocnik, AVG(Vek) as PrumVek FROM Student WHERE Rocnik > 1 GROUP BY Rocnik  


-- Vypište název oboru a prùmìrný vìk studentù v jednotlivých oborech
SELECT Obor.Nazev, AVG(Student.Vek) as PrumVek FROM Obor
INNER JOIN Student ON Student.OborID = Obor.OborID
GROUP BY Obor.Nazev


-- Vypište seznam všech studentù, kteøí se pøihlásili maximálnì na 2 pøedmìty.
SELECT Student.KrestniJmeno, Student.Prijmeni, COUNT(Zapis.PredmetID) AS PocetPredmetu FROM Student
INNER JOIN Zapis ON Zapis.StudentID = Student.StudentID
-- WHERE COUNT(Zapis.PredmetID) < 2
GROUP BY Student.KrestniJmeno, Student.Prijmeni 


-- Zmìòte v tabulce Student pole vek na RodneCislo a zaplòte ho údaji.
ALTER TABLE Student
ADD RodneCislo INT
UPDATE Student SET RodneCislo = 0011094169 WHERE StudentID = 6


-- Pøidejte do tabulky Student pole DatumNastupua zaplòte ho údaji.
ALTER TABLE Student 
ADD DatumNastupu datetime
UPDATE Student SET DatumNastupu = '2016-09-17' WHERE DatumNastupu is null


-- Vypište seznam všech studentek -na základì pole RodneCislo.
SELECT KrestniJmeno, Prijmeni FROM Student WHERE (RodneCislo - 50000000) > 0