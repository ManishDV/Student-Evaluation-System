delimiter //

create procedure getAllDetailsOfUT(IN ut varchar(5),IN sid INT)
begin
SET @s=CONCAT('SELECT ',ut,' FROM student_gives_UT WHERE sid=',sid);
PREPARE stmt1 FROM @s;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1; 
end
//
