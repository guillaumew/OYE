/* Replace with your SQL commands */
DELETE FROM Places WHERE path_id = 2;
DELETE FROM Objects WHERE path_id = 2;
DELETE FROM Paths WHERE id = 2;
ALTER TABLE Paths DROP total_steps;