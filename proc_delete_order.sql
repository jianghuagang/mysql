-- ----------------------------
-- Procedure structure for `proc_delete_order`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_delete_order`;
DELIMITER ;;
CREATE  PROCEDURE `proc_delete_order`(IN i_order_no varchar(20), OUT o_total_order int)
BEGIN
    DECLARE v_order_id 				int ;
	declare v_workcenter_order_id 	int ;
	declare v_pv_practice_id 		int ;
	declare v_
	
	
	/* ???? */
	DECLARE csr_order CURSOR FOR SELECT id FROM t_ibcp_order where order_no like concat(@i_order_no, '%' ) order by id ;
	
	
	
	
	
	
END
;;
DELIMITER ;