DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER @
CREATE PROCEDURE CancelBooking(IN BookingID INT)
BEGIN
 DELETE FROM Bookings
 WHERE Bookings.BookingID = BookingID;
 SELECT CONCAT('Booking ', bookingID, ' is cancelled.') AS 'Confirmation';
END@
DELIMITER ;
