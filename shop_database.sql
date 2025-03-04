USE Shop_Database

select * from Customers, Orders

select Customers.Name from Customers, Orders where Customers.CustomerID=Orders.CustomerID


select Customers.Name , Orders.OrderID from Customers left join Orders on Customers.CustomerID=Orders.CustomerID

select Customers.Name , Orders.OrderID from Customers right join Orders on Customers.CustomerID=Orders.CustomerID

select Customers.Name , Orders.OrderID from Customers full join Orders on Customers.CustomerID=Orders.CustomerID

select * from Customers as c1 , Customers as c2 where c1.Name=c2.Name and c1.CustomerID<>c2.CustomerID


select Customers.Name from Customers, Orders where Customers.CustomerID=Orders.CustomerID and Orders.Amount>500


select  Customers.Name , sum(Amount) from Customers inner join Orders on Customers.CustomerID=Orders.CustomerID group by Customers.Name


select  Customers.Name , count(Orders.OrderID) from Customers inner join Orders on Customers.CustomerID=Orders.CustomerID group by Customers.Name

UPDATE Orders
SET Orders.Amount = Orders.Amount * 10
FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.Name = 'John Doe';


select Customers.Name  from Customers  where Customers.CustomerID not in
(select distinct Customers.CustomerID from Customers, Orders where  Customers.CustomerID=Orders.CustomerID )

delete from Orders where  Orders.CustomerID not in
(select Customers.CustomerID from Customers )