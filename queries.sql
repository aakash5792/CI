CREATE TABLE IF NOT EXISTS user_structure_meta (
  meta_id int(11) NOT NULL AUTO_INCREMENT,
  field_name varchar(150) DEFAULT NULL,
  field_label varchar(150) DEFAULT NULL,
  field_type int(11) DEFAULT NULL,
  form_show tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  form_order tinyint(1) DEFAULT NULL COMMENT '1=search field',
  field_options varchar(255) DEFAULT NULL,
  field_col_sm_ varchar(150) DEFAULT NULL,
  field_validations varchar(255) DEFAULT NULL,
  form_app_show tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  form_import_show tinyint(1) DEFAULT NULL COMMENT '1-show, 2-hide',
  onchange varchar(250) DEFAULT NULL,
  dependon varchar(250) DEFAULT NULL,
  field_property varchar(250) DEFAULT NULL,
  PRIMARY KEY (meta_id)
);

INSERT INTO user_structure_meta(
  
  field_name, 
  field_label, 
  field_type, 
  field_col_sm_, 
  form_show,
  form_app_show, 
  form_import_show, 
  form_order
  )
SELECT 
column_name as  field_name
,REPLACE(CONCAT(UCASE(MID(column_name,1,1)),MID(column_name,2)),'_',' ') as field_label
,case when EXTRA='auto_increment' then 12 else field_id end as field_type
,'4' as field_col_sm_
,'2' as form_show
,'1' as form_app_show
,'1' as form_import_show
,ORDINAL_POSITION as form_order
FROM  information_schema.columns as isf join (select @row:=0) as a
LEFT JOIN sample.field_master as sfm ON (isf.data_type = sfm.type)
and (isf.CHARACTER_MAXIMUM_LENGTH = sfm.constraint)
WHERE table_name = 'user_structure'
and table_schema = 'apps'
 order by ORDINAL_POSITION


 ------------------------------------------
UPDATE user_structure_meta SET 
form_show='2'
WHERE 
form_show='1'

 -------------------------------

SELECT distinct table_schema
FROM  information_schema
select distinct CONCAT(table_schema,'-',table_schema) as options
from information_schema.columns

SELECT '' AS menu_id,
menu_category_name AS menu_text,
'0' AS menu_parent_id,
'#' AS menu_navigate_url,
@row:=1+@row AS menu_sequence,
'attendance' AS menu_product,
'U001' AS user_created_by,
NOW() AS user_created_date,
'U001' AS user_modified_by,
NOW() AS user_modified_date
FROM menu_category,(select @row :=0 ) as a
where menu_category_name not in (select menu_text from menu_master)
union all
SELECT '' AS menu_id,
menu_sub_category_name AS menu_text,
menu_category_id AS menu_parent_id,
menu_sub_category_url AS menu_navigate_url,
menu_sub_category_seq AS menu_sequence,
'attendance' AS menu_product,
'U001' AS user_created_by,
NOW() AS user_created_date,
'U001' AS user_modified_by,
NOW() AS user_modified_date

FROM menu_sub_category,(select @row :=0 ) as a
  where menu_sub_category_name not in (select menu_text from menu_master)


INSERT INTO user_role_master(
  role_name, role_code, role_url, role_menu_ids,
   role_menu_insert, role_menu_update, role_menu_delete,
    role_menu_export, user_created_by,
 user_created_date, user_modified_by, user_modified_date)
SELECT  
'Super Admin' role_name,
'SU' role_code,
'admin/usermaster' role_url, 
menu_id role_menu_ids,
'Y'  role_menu_insert,
'Y' role_menu_update, 
'Y'  role_menu_delete, 
'Y' role_menu_export,
'U001'   user_created_by,
    user_created_date, 
'U001'    user_modified_by,
  NOW()   user_modified_date FROM menu_master


  INSERT INTO client_branch(client_branch_id,
 client_code, 
 client_branch_code, 
 client_branch_name, 
 client_branch_latitude, 
 client_branch_longitude, 
 client_branch_address ,
 client_branch_accuracy,
  client_branch_radius, 
  user_created_by, 
  user_created_date, 
  user_modified_by, user_modified_date) 
 SELECT 
client_branch_id,
 client_name as client_code, 
 client_branch_code, 
 client_branch_name, 
 client_latitude,
  client_longitude, 
  client_address,  
  client_accuracy,
   client_radius,
    user_created_by, 
    user_created_date,
     user_modified_by, 
     user_modified_date
FROM client_branch_master