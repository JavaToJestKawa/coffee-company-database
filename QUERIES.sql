--Dane pracownikow, ktorzy uczestniczyli w poszczegolnych zbiorach.
SELECT e.Id AS Employee_Id, p.Name, p.SecondName, e.Salary, h.Id AS HARVESTID, h.DateBegin, h.DateEnd
FROM EMPLOYEE e
JOIN PERSON p ON e.Id = p.Id
JOIN HARVEST_EMPLOYEES he ON e.Id = he.Employee_Id
JOIN HARVEST h ON he.Harvest_Id = h.Id;

--Liczba zbiorow dla kazdego z gatunkow kawy.
SELECT c.Description, COUNT(h.Id) AS HarvestsCount
FROM HARVEST h
JOIN COFFEBEANTYPE c ON h.CoffeBeanType_Id = c.Id
GROUP BY c.Description;

--Pensje pracownikow; roczne pensje pracownikow.
SELECT e.Id, e.Salary, e.Salary * 12 AS AnnualSalary
FROM EMPLOYEE e;

--Klienci.
SELECT p.Name, p.SecondName
FROM PERSON p
WHERE p.Id IN (SELECT c.Id FROM Customer c);

--Dane przelozonych, ktorych pensja przewyzsza srednia pensje podwladnych.
SELECT e.Id, e.Salary
FROM EMPLOYEE e
WHERE e.Salary > (SELECT AVG(e2.Salary) FROM EMPLOYEE e2 WHERE e2.Supervisor_Id = e.Id);

--Pracownicy (wielkie litery).
SELECT e.Id, UPPER(p.Name) AS Name, UPPER(p.SecondName) AS SecondName
FROM EMPLOYEE e
JOIN PERSON p ON e.Id = p.Id;

--Klienci wraz z liczba zamowien i suma wydatkow.
SELECT p.Name, COUNT(*) AS CountOfOrders, SUM(s.Price) AS TotalSpent
FROM PERSON p
JOIN CUSTOMER c ON p.Id = c.Id
JOIN "Order" o ON c.Id = o.Customer_Id
JOIN SALE s ON o.Id = s.Order_Id
GROUP BY p.Name;

--Pracownicy wraz z liczba podwladnych.
SELECT p.Name, p.SecondName, 
       (SELECT COUNT(*) FROM Employee e WHERE e.Supervisor_Id = p.Id) AS CountOfSubordinates
FROM PERSON p
JOIN EMPLOYEE e ON p.Id = e.Id;

--Zbior wraz z plantacja i srednimi zarobkami pracownika bioracego udzial w zbiorze.
SELECT h.Id, h.Plantation_Id, 
       (SELECT AVG(Salary) FROM EMPLOYEE e JOIN Harvest_Employees he ON e.Id = he.Employee_Id WHERE he.Harvest_Id = h.Id) AS AverageEmployeeSalary
FROM HARVEST h;

--Sprzedaze wraz ze sattusami.
SELECT s.Order_Id, s.Product_Id, s.Price, s.Sale_Status_Name
FROM Sale s
JOIN Sale_Status ss ON s.Sale_Status_Name = ss.Name;
