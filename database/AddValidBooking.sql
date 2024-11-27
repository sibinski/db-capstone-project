DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER @
CREATE PROCEDURE AddValidBooking(IN BookingDate DATE, IN TableNumber INT)
BEGIN
DECLARE BookingCount INT;
DECLARE CustomerID INT;

-- Check the number of bookings for particular date for the given table
SELECT COUNT(*) INTO BookingCount
FROM Bookings
WHERE Bookings.TableNumber = TableNumber AND Bookings.BookingDate = BookingDate;
-- Conditional logic based on booking count
IF
BookingCount = 0
THEN
START TRANSACTION;
SET CustomerID = FLOOR(RAND()*10+1);
INSERT INTO Bookings (BookingDate, TableNumber, CustomerID) VALUES (BookingDate, TableNumber, CustomerID);
SELECT CONCAT('Table ', TableNumber, ' successfully booked!') AS 'Booking status';
COMMIT;
ELSE
SELECT CONCAT('Table ', TableNumber, ' is already booked - booking cancelled!') AS 'Booking status';
ROLLBACK;
END IF;
END@
DELIMITER ;