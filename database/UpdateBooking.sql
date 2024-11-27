DELIMITER @
DROP PROCEDURE IF EXISTS UpdateBooking;
CREATE PROCEDURE UpdateBooking(IN BookingID INT, IN BookingDate DATE)
BEGIN
UPDATE Bookings SET Bookings.BookingDate = BookingDate
WHERE Bookings.BookingID = BookingID;
SELECT CONCAT('Booking ', BookingID, ' was succesfully updated!') AS 'Confirmation';
END
@
CALL UpdateBooking(1,'2024-11-30');