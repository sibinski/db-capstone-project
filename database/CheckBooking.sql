DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER @
CREATE PROCEDURE CheckBooking(IN BookingDate DATE, IN TableNumber INT)
BEGIN
DECLARE BookingCount INT;
-- Check the number of bookings for particular date for the given table
SELECT COUNT(*) INTO BookingCount
FROM Bookings
WHERE Bookings.TableNumber = TableNumber AND Bookings.BookingDate = BookingDate;
-- Conditional logic based on booking count
IF
BookingCount > 0
THEN
SELECT CONCAT('Table ', TableNumber, ' is already booked!') AS 'Booking status';
ELSE
SELECT CONCAT('Table ', TableNumber, ' is available for booking!') AS 'Booking status';
END IF;
END@
DELIMITER ;