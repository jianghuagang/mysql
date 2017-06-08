-- ----------------------------
-- Procedure structure for `proc_adder`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_adder`;
DELIMITER ;;
CREATE  PROCEDURE `proc_adder`(IN a int, IN b int, OUT sum int)
BEGIN
    #Routine body goes here...

    DECLARE c int;
    if a is null then set a = 0; 
    end if;
  
    if b is null then set b = 0;
    end if;

    set sum  = a + b;
END
;;
DELIMITER ;
¸´ÖÆ´úÂë