SELECT Student.KrestniJmeno, Student.Prijmeni, Predmet.Nazev, Zapis.Hodnoceni FROM Student 
INNER JOIN Zapis ON Student.StudentID=Zapis.StudentID 
INNER JOIN Predmet ON Predmet.PredmetID = Zapis.PredmetID

SELECT Student.KrestniJmeno, Student.Prijmeni, Predmet.Nazev FROM Student 
INNER JOIN Zapis ON Student.StudentID = Zapis.StudentID
INNER JOIN Predmet ON Predmet.PredmetID = Zapis.PredmetID
WHERE Predmet.Nazev='A1MAS'

SELECT Student.KrestniJmeno, Student.Prijmeni, Predmet.Nazev, Ucitel.Prijmeni FROM Student
INNER JOIN Zapis ON Student.StudentID = Zapis.StudentID
INNER JOIN Predmet ON Predmet.PredmetID = Zapis.PredmetID
INNER JOIN Ucitel ON Ucitel.UcitelID = Predmet.UcitelID
WHERE Ucitel.Jmeno='Karel' AND Ucitel.Prijmeni='Kantor'

SELECT Student.KrestniJmeno, Student.Prijmeni, Obor.Nazev, Predmet.Nazev, Ucitel.Prijmeni FROM Student
INNER JOIN Zapis ON Student.StudentID = Zapis.StudentID
INNER JOIN Predmet ON Predmet.PredmetID = Zapis.PredmetID
INNER JOIN Ucitel ON Ucitel.UcitelID = Predmet.UcitelID
INNER JOIN Obor ON Obor.OborID = Student.OborID
WHERE Obor.Nazev='SWI' OR Ucitel.Prijmeni='Kantor'

SELECT Predmet.Mistnost FROM Predmet
INNER JOIN Ucitel ON Ucitel.UcitelID = Predmet.UcitelID
WHERE Predmet.Nazev = 'A1MAS' AND Ucitel.Prijmeni = 'Chytrý'

SELECT Predmet.Nazev FROM Predmet
LEFT OUTER JOIN Zapis ON Zapis.PredmetID = Predmet.PredmetID
WHERE Zapis.StudentID is null

SELECT Student.KrestniJmeno, Student.Prijmeni, Student.Vek, Predmet.Nazev FROM Student
INNER JOIN Zapis ON Student.StudentID = Zapis.StudentID
INNER JOIN Predmet ON Predmet.PredmetID = Zapis.PredmetID
WHERE Student.Vek > 20 AND Predmet.Nazev='A1NVS' 


