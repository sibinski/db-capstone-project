USE LittleLemonDB;
SELECT c.CustomerID AS 'Customer ID', 
c.FullName AS 'Full Name', 
o.OrderID AS 'Order ID', 
o.TotalCost AS 'Total Cost',
m.MenuName AS 'Menu Name', mi.CourseName AS 'Course Name', mi.StarterName AS 'Starter Name'
FROM Orders o
INNER JOIN Customers c on c.CustomerID = o.CustomerID
INNER JOIN Menus m on m.MenuID = o.MenuID
INNER JOIN MenuItems mi on m.MenuID = mi.MenuItemsID
WHERE o.TotalCost > 150
ORDER BY
o.TotalCost ASC;