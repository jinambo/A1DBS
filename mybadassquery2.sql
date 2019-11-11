-- Vypi�te abecedn� se�azen� studenty, dle p��jmen� a jm�na, a k nim p�i�azeny n�zvy p�edm�t�, na kter� jsou zapsan� a jejich garanty.
SELECT student.KrestniJmeno, student.Prijmeni, Predmet.Nazev, Ucitel.Jmeno, Ucitel.Prijmeni FROM Student 
LEFT JOIN Zapis ON Student.StudentID = Zapis.StudentID 
JOIN Predmet ON Zapis.PredmetID = Predmet.PredmetID
JOIN Ucitel ON Ucitel.UcitelID = Predmet. UcitelID

-- Vypi�te seznam v�ech student�, kte�� nejsou zapsan� na ��dn� p�edm�t.
SELECT student.KrestniJmeno, student.Prijmeni, Zapis.PredmetID AS Predmety FROM Student 
LEFT JOIN Zapis ON Student.StudentID = Zapis.StudentID 
WHERE Zapis.PredmetID IS NULL

-- Vypi�te studenty s nejlep��m studijn�m pr�m�rem.
SELECT KrestniJmeno, Prijmeni, StudijniPrumer FROM Student
WHERE StudijniPrumer = (SELECT min(Student.StudijniPrumer) FROM Student)

-- Vypi�te po�et u�eben v jednotliv�ch bloc�ch budovy A, B...(nebo 51, 52...).
SELECT LEFT(Mistnost, 2) AS Budova, COUNT(Mistnost) as PocetMistnosti FROM Predmet 
GROUP BY LEFT(Mistnost, 2)

-- Vypi�te po�et p�edm�t�, kter� se vyu�uj� na libovoln� u�ebn� v bloku A (51).
SELECT Mistnost, COUNT(PredmetID) as PocetPredemetu FROM Predmet WHERE Mistnost LIKE '51%'
GROUP BY Mistnost

-- Vypi�te seznam v�ech student�, kte�� jsou zaps�ni v maxim�ln�m po�tu p�edm�t�.
SELECT Student.KrestniJmeno, Student.Prijmeni, COUNT(Zapis.PredmetID) as PocetPredmetu FROM Student
JOIN Zapis on Student.StudentID = Zapis.StudentID
GROUP BY Student.KrestniJmeno, Student.Prijmeni
HAVING COUNT(Zapis.PredmetID) = --MAX(Zapis.PredmetID)
