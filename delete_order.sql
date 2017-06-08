
set @v_order_no = '17' ;

-- delete material related tables - dispatch result
delete from t_ibcp_material_dispatch_tu where dispatch_id in (select id from t_ibcp_material_dispatch where order_id in (select id from t_ibcp_order where order_no like concat(@v_order_no, '%') ) );
delete from t_ibcp_material_dispatch where order_id in (select id from t_ibcp_order where order_no like concat(@v_order_no, '%'));

-- delete material related tables - feed result
delete from t_ibcp_material_feed_detail where feed_id in (select id from t_ibcp_material_feed where order_id in (select id from t_ibcp_order where order_no like concat(@v_order_no, '%')));
delete from t_ibcp_material_feed where order_id in (select id from t_ibcp_order where order_no like concat(@v_order_no, '%'));

-- delete material related tables - weight result
delete from t_ibcp_weight_result where order_id in (select id from t_ibcp_order where order_no like concat(@v_order_no, '%'));




-- delete pv related tables - pv history
delete from t_ibcp_pv_history where pv_prac_id in( select id from t_ibcp_pv_practice where step_prac_id in( select id from t_ibcp_process_step_practice where workcenter_order_id in (select id from t_ibcp_workcenter_order where order_id in (select id from t_ibcp_order where order_no like concat(@v_order_no, '%'))) ) );

-- delete pv related tables - pv deviation
delete from t_ibcp_deviation_pv where pv_prac_id in( select id from t_ibcp_pv_practice where step_prac_id in( select id from t_ibcp_process_step_practice where workcenter_order_id in (select id from t_ibcp_workcenter_order where order_id in (select id from t_ibcp_order where order_no like concat(@v_order_no, '%'))) ) );

-- delete pv related tables - pv practice
delete from t_ibcp_pv_practice where step_prac_id in( select id from t_ibcp_process_step_practice where workcenter_order_id in (select id from t_ibcp_workcenter_order where order_id in (select id from t_ibcp_order where order_no like concat(@v_order_no, '%'))) );
-- delete pv related tables - process step practice
delete from t_ibcp_process_step_practice where workcenter_order_id in (select id from t_ibcp_workcenter_order where order_id in (select id from t_ibcp_order where order_no like concat(@v_order_no, '%')));



-- delete order related tables - workcenter_order
delete from t_ibcp_workcenter_order where order_id in (select id from t_ibcp_order where order_no like concat(@v_order_no, '%'));

-- delete order related tables - order_bom
delete from t_ibcp_order_bom where order_id in (select id from t_ibcp_order where order_no like concat(@v_order_no, '%'));

-- delete order related tables - deviation
delete from t_ibcp_deviation where order_id in (select id from t_ibcp_order where order_no like concat(@v_order_no, '%'));

-- delete order table
delete from t_ibcp_order where order_no like concat(@v_order_no, '%') ;