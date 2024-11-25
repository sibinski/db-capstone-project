DELIMITER @
CREATE PROCEDURE CancelOrder(IN OrderID INT)
BEGIN
DELETE FROM Orders
WHERE OrderID = OrderID;
SELECT CONCAT('Order ', OrderID, ' is cancelled') AS Confirmation;
END
@
DELIMITER ;