 delimiter //

CREATE TRIGGER add_authenticate BEFORE INSERT ON teacher
FOR EACH ROW 
BEGIN
	INSERT INTO authenticate VALUES(new.tid,"123456","teacher");
END //

delimiter ;




delimiter //

CREATE TRIGGER delete_authenticate BEFORE DELETE ON teacher
FOR EACH ROW 
BEGIN
	DELETE FROM authenticate WHERE uname = old.tid;
END //

delimiter ;


