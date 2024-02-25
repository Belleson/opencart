-- BEGIN TRANSACTION

insert into [opencart3_db].api
select *
from [opencart22_db].api a1
where not exists (
	select 1
	from [opencart3_db].api a2
	where a1.api_id = a2.api_id);

insert into [opencart3_db].api_ip
select *
from [opencart22_db].api_ip a1
where not exists (
	select 1
	from [opencart3_db].api_ip a2
	where a1.api_ip_id = a2.api_ip_id);

insert into [opencart3_db].api_session (
	api_session_id,
	api_id,
	session_id,
	ip,
	date_added,
	date_modified)
select
	api_session_id,
	api_id,
	session_id,
	ip,
	date_added,
	date_modified
from [opencart22_db].api_session a1
where not exists (select 1 from [opencart3_db].api_session a2 where a1.api_session_id = a2.api_session_id);

insert into [opencart3_db].category (
	category_id,
	image,
	parent_id,
	top,
	`column`,
	sort_order,
	status,
	date_added,
	date_modified)
select
	category_id,
	image,
	parent_id,
	top,
	`column`,
	sort_order,
	status,
	date_added,
	date_modified
from [opencart22_db].category c1
where not exists (
	select 1
	from [opencart3_db].category c2
	where c1.category_id = c2.category_id);

insert into [opencart3_db].category_description
select *
from [opencart22_db].category_description cd1
where not exists (
	select 1
	from [opencart3_db].category_description cd2
	where cd2.category_id = cd1.category_id);

-- DELETE FROM [opencart3_db].category_path
insert into [opencart3_db].category_path
select *
from [opencart22_db].category_path cp1
where not exists
(
	select 1
	from [opencart3_db].category_path cp2
	where cp1.category_id = cp2.category_id
	and cp1.path_id = cp2.path_id);

insert into [opencart3_db].customer (
	customer_id,
	customer_group_id,
	store_id,
	language_id,
	firstname,
	lastname,
	email,
	telephone,
	fax,
	password,
	salt,
	custom_field,
	newsletter,
	ip,
	status,
	safe,
	token,
	code,
	date_added)
select customer_id
,customer_group_id
,store_id
,language_id
,firstname
,lastname
,email
,telephone
,fax
,password
,salt
,custom_field
,newsletter
,ip
,status
,safe
,token
,code
,date_added
from [opencart22_db].customer c1
where not exists (
	select 1
	from [opencart3_db].customer c2
	where c1.customer_id = c2.customer_id
	and c1.store_id = c2.store_id);

insert into [opencart3_db].product (
	`product_id`,
--	`master_id`,
	`model`,
	`sku`,
	`upc`,
	`ean`,
	`jan`,
	`isbn`,
	`mpn`,
	`location`,
--	`variant`,
--	`override`,
	`quantity`,
	`stock_status_id`,
	`image`,
	`manufacturer_id`,
	`shipping`,
	`price`,
	`points`,
	`tax_class_id`,
	`date_available`,
	`weight`,
	`weight_class_id`,
	`length`,
	`width`,
	`height`,
	`length_class_id`,
	`subtract`,
	`minimum`,
--	`rating`,
	`sort_order`,
	`status`,
	`date_added`,
	`date_modified`)
select
	`product_id`,
--	0, -- master_id
	`model`,
	`sku`,
	`upc`,
	`ean`,
	`jan`,
	`isbn`,
	`mpn`,
	`location`,
--	'', -- `variant`
--	'', -- `override`,
	`quantity`,
	`stock_status_id`,
	`image`,
	`manufacturer_id`,
	`shipping`,
	`price`,
	`points`,
	`tax_class_id`,
	`date_available`,
	`weight`,
	`weight_class_id`,
	`length`,
	`width`,
	`height`,
	`length_class_id`,
	`subtract`,
	`minimum`,
--	0,
	`sort_order`,
	`status`,
	`date_added`,
	`date_modified`
from `belleson_cart`.`product` p1
where not exists (
	select 1
	from [opencart3_db].product p2
	where p1.product_id = p2.product_id);

insert into [opencart3_db].product_to_category
select *
from [opencart22_db].product_to_category pc1
where not exists
(select 1 from [opencart3_db].product_to_category pc2
where pc1.product_id = pc2.product_id
and pc1.category_id = pc2.category_id);

insert into [opencart3_db].product_to_store
select *
from [opencart22_db].product_to_store ps1
where not exists (
	select 1
	from [opencart3_db].product_to_store ps2
	where ps1.product_id = ps2.product_id
	and ps1.store_id = ps2.store_id);

insert into [opencart3_db].product_attribute
select *
from [opencart22_db].product_attribute pa1
where not exists (
	select 1
	from [opencart3_db].product_attribute pa2
	where pa1.product_id = pa2.product_id
	and pa1.attribute_id = pa2.attribute_id);

insert into [opencart3_db].product_option
select *
from [opencart22_db].product_option po
where not exists (
	select 1
	from [opencart3_db].product_option po2
	where po.option_id = po2.option_id
	and po.product_id = po2.product_id);

insert into [opencart3_db].product_option_value
select *
from [opencart22_db].product_option_value pov
where not exists (
	select 1
	from [opencart3_db].product_option_value pov2
	where pov.product_option_id = pov2.product_option_id
	and pov.option_id = pov2.option_id
	and pov.product_id = pov2.product_id);

insert into [opencart3_db].product_related
select *
from [opencart22_db].product_related pr1
where not exists (
	select 1 from [opencart3_db].product_related pr2
	where pr1.product_id = pr2.product_id
	and pr1.related_id = pr2.related_id);

insert into [opencart3_db].product_attribute
select *
from [opencart22_db].product_attribute pa1
where not exists (
	select 1
	from [opencart3_db].product_attribute pa2
	where pa1.product_id = pa2.product_id
	and pa1.attribute_id = pa2.attribute_id);

insert into [opencart3_db].product_discount (
product_discount_id
,product_id
,customer_group_id
,quantity
,priority
,price
,date_start
,date_end)
select product_discount_id
,product_id
,customer_group_id
,quantity
,priority
,price
,date_start
,date_end
from [opencart22_db].product_discount pd1
where not exists (
	select 1
	from [opencart3_db].product_discount pd2
	where pd1.product_id = pd2.product_id
	and pd1.customer_group_id = pd2.customer_group_id);

-- DID NOT USE THIS INSERT, WILL DO IT MANUALLY
-- insert into [opencart3_db].product_image
-- select *
-- from [opencart22_db].product_image pi1
-- where not exists (
-- 	select 1
-- 	from [opencart3_db].product_image pi2
-- 	where pi1.product_image_id = pi2.product_image_id
-- 	and pi1.product_id = pi2.product_id);

insert into [opencart3_db].product_description (
	product_id
	,language_id
	,name
	,description
	,tag
	,meta_title
	,meta_description
	,meta_keyword)
select product_id
	,language_id
	,name
	,description
	,tag
	,meta_title
	,meta_description
	,meta_keyword
from [opencart22_db].product_description pd1
where not exists (
	select 1
	from [opencart3_db].product_description pd2
	where pd1.product_id = pd2.product_id);

insert into [opencart3_db].`address` (
	`address_id`
	,`customer_id`
	,`firstname`
	,`lastname`
	,`company`
	,`address_1`
	,`address_2`
	,`city`
	,`postcode`
	,`country_id`
	,`zone_id`
	,`custom_field`
-- 	,`default`
	)
select
	`address_id`
	,`customer_id`
	,`firstname`
	,`lastname`
	,`company`
	,`address_1`
	,`address_2`
	,`city`
	,`postcode`
	,`country_id`
	,`zone_id`
	,`custom_field`
-- 	,0 -- `default`
from [opencart22_db].address a1
where not exists (
	select 1
	from [opencart3_db].address a2
	where a1.address_id = a2.address_id
--	and a1.customer_id = a2.customer_id
);

insert into [opencart3_db].cart (
	cart_id
	,api_id
	,customer_id
	,session_id
	,product_id
	, recurring_id
-- 	,subscription_plan_id
	,`option`
	,quantity
-- 	,override
--  	,price
	,date_added)
select cart_id
	,1 -- api_id
	,customer_id
	,session_id
	,product_id
	, -1
-- 	,1 -- subscription_plan_id
	,`option`
	,quantity
--  	,override
--  	,price
	,date_added
from [opencart22_db].cart c1
where not exists (
	select 1 from [opencart3_db].cart c2
	where c1.cart_id = c2.cart_id
--	and c1.api_id = c2.api_id
	and c1.customer_id = c2.customer_id);
	
insert into [opencart3_db].`order` (
`order_id`
-- ,`subscription_id`
,`invoice_no`
,`invoice_prefix`
-- ,`transaction_id`
,`store_id`
,`store_name`
,`store_url`
,`customer_id`
,`customer_group_id`
,`firstname`
,`lastname`
,`email`
,`telephone`
,fax
,`custom_field`
-- ,`payment_address_id`
,`payment_firstname`
,`payment_lastname`
,`payment_company`
,`payment_address_1`
,`payment_address_2`
,`payment_city`
,`payment_postcode`
,`payment_country`
,`payment_country_id`
,`payment_zone`
,`payment_zone_id`
,`payment_address_format`
,`payment_custom_field`
,`payment_method`
,`payment_code`
-- ,`shipping_address_id`
,`shipping_firstname`
,`shipping_lastname`
,`shipping_company`
,`shipping_address_1`
,`shipping_address_2`
,`shipping_city`
,`shipping_postcode`
,`shipping_country`
,`shipping_country_id`
,`shipping_zone`
,`shipping_zone_id`
,`shipping_address_format`
,`shipping_custom_field`
,`shipping_method`
,`shipping_code`
,`comment`
,`total`
,`order_status_id`
,`affiliate_id`
,`commission`
,`marketing_id`
,`tracking`
,`language_id`
-- ,`language_code`
,`currency_id`
,`currency_code`
,`currency_value`
,`ip`
,`forwarded_ip`
,`user_agent`
,`accept_language`
,`date_added`
,`date_modified`)
select 
`order_id`
-- , -1 -- subscription_id
,`invoice_no`
,`invoice_prefix`
-- , -1 -- transaction_id
,`store_id`
,`store_name`
,`store_url`
,`customer_id`
,`customer_group_id`
,`firstname`
,`lastname`
,`email`
,`telephone`
,`fax`
,`custom_field`
-- , -1 -- payment_address_id
,`payment_firstname`
,`payment_lastname`
,`payment_company`
,`payment_address_1`
,`payment_address_2`
,`payment_city`
,`payment_postcode`
,`payment_country`
,`payment_country_id`
,`payment_zone`
,`payment_zone_id`
,`payment_address_format`
,`payment_custom_field`
,`payment_method`
,`payment_code`
-- , -1 -- shipping_address_id
,`shipping_firstname`
,`shipping_lastname`
,`shipping_company`
,`shipping_address_1`
,`shipping_address_2`
,`shipping_city`
,`shipping_postcode`
,`shipping_country`
,`shipping_country_id`
,`shipping_zone`
,`shipping_zone_id`
,`shipping_address_format`
,`shipping_custom_field`
,`shipping_method`
,`shipping_code`
,`comment`
,`total`
,`order_status_id`
,`affiliate_id`
,`commission`
,`marketing_id`
,`tracking`
,`language_id`
-- , -1 -- language_code
,`currency_id`
,`currency_code`
,`currency_value`
,`ip`
,`forwarded_ip`
,`user_agent`
,`accept_language`
,`date_added`
,`date_modified`
from [opencart22_db].`order` o1 
where not exists (
	select 1 from [opencart3_db].`order` o2
	where o1.order_id = o2.order_id);


insert into [opencart3_db].`order_product` (order_product_id
,order_id
,product_id
-- ,master_id
,`name`
,model
,quantity
,price
,total
,tax
,reward)
select order_product_id
,order_id
,product_id
-- ,-1
,`name`
,model
,quantity
,price
,total
,tax
,reward
from [opencart22_db].`order_product` op1
where not exists (
	select 1
	from [opencart3_db].order_product op2
	where op1.order_product_id = op2.order_product_id
 	and op1.order_id = op2.order_id
 	and op1.product_id = op2.product_id
	);

insert into [opencart3_db].order_status
select * from [opencart22_db].order_status os1
where not exists (
	select 1
	from [opencart3_db].order_status  os2
	where os1.order_status_id = os2.order_status_id);

insert into [opencart3_db].order_history
select * from [opencart22_db].order_history oh1
where not exists (
	select 1
	from [opencart3_db].order_history oh2
	where oh1.order_id = oh2.order_id
	and oh1.order_status_id = oh2.order_status_id);

insert into [opencart3_db].order_option
select * from [opencart22_db].order_option oo1
where not exists (
	select 1
	from [opencart3_db].order_option oo2
	where oo1.order_id = oo2.order_id
	and oo1.order_product_id = oo2.order_product_id
	and oo1.product_option_id = oo2.product_option_id
	and oo1.product_option_value_id = oo2.product_option_value_id);

insert into [opencart3_db].order_total (order_total_id
,order_id
-- ,extension
,code
,title
,value
,sort_order)
select order_total_id
,order_id
-- ,''
,code
,title
,value
,sort_order
from [opencart22_db].order_total ot1
where not exists (
	select 1
	from [opencart3_db].order_total ot2
	where ot1.order_total_id = ot2.order_total_id
	and ot1.order_id = ot2.order_id);

insert into [opencart3_db].`return`
select * from [opencart22_db].`return` r1
where not exists (
	select 1
	from [opencart3_db].`return` r2
	where r1.return_id = r2.return_id
	and r1.order_id = r2.order_id
	and r1.product_id = r2.product_id
	and r1.customer_id = r2.customer_id);

insert into [opencart3_db].return_action
select * from [opencart22_db].return_action ra1
where not exists (
	select 1
	from [opencart3_db].return_action ra2
	where ra1.return_action_id = ra2.return_action_id);

insert into [opencart3_db].return_history
select * from [opencart22_db].return_history rh1
where not exists (
	select 1
	from [opencart3_db].return_history rh2
	where rh1.return_history_id = rh2.return_history_id
	and rh1.return_id = rh2.return_id
	and rh1.return_status_id = rh2.return_status_id);

insert into [opencart3_db].`return_reason`
select * from [opencart22_db].`return_reason` rr1
where not exists (
	select 1
	from [opencart3_db].return_reason rr2
	where rr1.return_reason_id = rr2.return_reason_id);

insert into [opencart3_db].`return_status`
select * from [opencart22_db].`return_status` rs1
where not exists (
	select 1
	from [opencart3_db].return_status rs2
	where rs1.return_status_id = rs2.return_status_id);


insert into [opencart3_db].`zone`
select * from [opencart22_db].`zone` z1
where not exists (
	select *
	from [opencart3_db].`zone` z2
	where z1.zone_id = z2.zone_id
	and z1.country_id = z2.country_id);