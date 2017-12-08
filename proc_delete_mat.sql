
set @v_mat_no = '000000423' ;


-- 删除条码
select * from t_ibcp_barcode where id in ( select lab_id from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%') ) ;

-- 删除原料件称量件对应关系
select * from t_ibcp_material_weight_tu where tu_id in ( select id from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%') ) 

-- 删除原料件的称量件
select * from t_ibcp_weight_result where id in ( select weight_result_id from t_ibcp_material_weight_tu where tu_id in ( select id from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%') )  )

-- 删除原料件的称量件的条码
select * from t_ibcp_barcode where id in ( select barcode_id from t_ibcp_weight_result where id in ( select weight_result_id from t_ibcp_material_weight_tu where tu_id in ( select id from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%') ) ) );


-- 删除原料件
select * from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%') ;


-- 删除转移指令明细
select * from t_ibcp_material_transport where tu_id in (select id from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%') );




set @v_mat_no = '000000172' ;

-- 称量件标签
select * from t_ibcp_barcode where id in ( select barcode_id from t_ibcp_weight_result where id in ( select weight_result_id from t_ibcp_material_weight_tu where tu_id in ( select id from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%') ) ) );

-- 称量件信息
select * from t_ibcp_weight_result where id in ( select weight_result_id from t_ibcp_material_weight_tu where tu_id in ( select id from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%') )  ) ;

-- 原料件-称量件关系表
select * from t_ibcp_material_weight_tu where tu_id in ( select id from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%') ) ;

-- 原料件标签
select * from  t_ibcp_barcode where id in ( select lab_id from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%') ) ;


-- 配方mfc投入产出关系
select * from t_ibcp_material_transport_relation where out_id in ( select id from t_ibcp_material_transport where tu_id in (select id from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%')) ) ;
select * from t_ibcp_material_transport_relation where in_id  in ( select id from t_ibcp_material_transport where tu_id in (select id from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%')) ) ;

-- mfc流转明细表
select * from t_ibcp_material_transport where tu_id in (select id from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%')) ;


-- 原料件信息
select * from t_ibcp_material_package where tu_no like concat(@v_mat_no, '%') ;



