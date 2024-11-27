DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER @
CREATE PROCEDURE AddBooking(IN BookingID INT, IN BookingDate DATE, IN TableNumber INT, IN CustomerID INT)
BEGIN
DECLARE BookingCount INT;

-- Check the number of bookings for particular date for the given table
SELECT COUNT(*) INTO BookingCount
FROM Bookings
WHERE Bookings.TableNumber = TableNumber AND Bookings.BookingDate = BookingDate;
-- Conditional logic based on booking count
IF
BookingCount = 0
THEN
START TRANSACTION;
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID) VALUES (BookingID, BookingDate, TableNumber, CustomerID);
SELECT CONCAT('Table ', TableNumber, ' - new booking added!') AS 'Confirmation';
COMMIT;
ELSE
SELECT CONCAT('Table ', TableNumber, ' is already booked - booking cancelled!') AS 'Booking status';
ROLLBACK;
END IF;
END@
DELIMITER ;
CALL AddBooking(6, '2025-12-01', 2, 3);