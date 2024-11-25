PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE CustomerID = ?';
SET @CustomerID = 1;
EXECUTE GetOrderDetail USING @CustomerID;