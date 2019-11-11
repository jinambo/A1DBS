-- Vypište abecednì seøazené studenty, dle pøíjmení a jména, a k nim pøiøazeny názvy pøedmìtù, na které jsou zapsaní a jejich garanty.
SELECT student.KrestniJmeno, student.Prijmeni, Predmet.Nazev, Ucitel.Jmeno, Ucitel.Prijmeni FROM Student 
LEFT JOIN Zapis ON Student.StudentID = Zapis.StudentID 
JOIN Predmet ON Zapis.PredmetID = Predmet.PredmetID
JOIN Ucitel ON Ucitel.UcitelID = Predmet. UcitelID

-- Vypište seznam všech studentù, kteøí nejsou zapsaní na žádný pøedmìt.
SELECT student.KrestniJmeno, student.Prijmeni, Zapis.PredmetID AS Predmety FROM Student 
LEFT JOIN Zapis ON Student.StudentID = Zapis.StudentID 
WHERE Zapis.PredmetID IS NULL

-- Vypište studenty s nejlepším studijním prùmìrem.
SELECT KrestniJmeno, Prijmeni, StudijniPrumer FROM Student
WHERE StudijniPrumer = (SELECT min(Student.StudijniPrumer) FROM Student)

-- Vypište poèet uèeben v jednotlivých blocích budovy A, B...(nebo 51, 52...).
SELECT LEFT(Mistnost, 2) AS Budova, COUNT(Mistnost) as PocetMistnosti FROM Predmet 
GROUP BY LEFT(Mistnost, 2)

-- Vypište poèet pøedmìtù, které se vyuèují na libovolné uèebnì v bloku A (51).
SELECT Mistnost, COUNT(PredmetID) as PocetPredemetu FROM Predmet WHERE Mistnost LIKE '51%'
GROUP BY Mistnost

-- Vypište seznam všech studentù, kteøí jsou zapsáni v maximálním poètu pøedmìtù.
SELECT Student.KrestniJmeno, Student.Prijmeni, COUNT(Zapis.PredmetID) as PocetPredmetu FROM Student
JOIN Zapis on Student.StudentID = Zapis.StudentID
GROUP BY Student.KrestniJmeno, Student.Prijmeni
HAVING COUNT(Zapis.PredmetID) = --MAX(Zapis.PredmetID)
