SET SESSION group_concat_max_len = 2048;

with sorc as (
select
	c.TABLE_NAME,
	c.COLUMN_NAME
from information_schema.TABLES t
join information_schema.`COLUMNS` c
	on t.TABLE_SCHEMA = c.TABLE_SCHEMA
	and t.table_name = c.TABLE_NAME
where
	t.table_type = 'BASE TABLE'
	and t.table_schema = 'YOUR_SOURCE_DB_NAME'
	and t.TABLE_ROWS > 0
), -- IGNORE EMPTY TABLES
dest as (
select
	c.TABLE_NAME,
	c.COLUMN_NAME
from information_schema.TABLES t
join information_schema.`COLUMNS` c on
	t.TABLE_SCHEMA = c.TABLE_SCHEMA
	and t.table_name = c.TABLE_NAME
where
	t.table_type = 'BASE TABLE'
	and t.table_schema = 'YOUR_DESTINATION_DB_NAME'
),
result as (
select dest.table_name, GROUP_CONCAT('`', dest.column_name, '`') as fields
from
	sorc join dest
	on sorc.table_name = dest.table_name
	and sorc.column_name = dest.column_name
	group by dest.table_name
)
select -- table_name, fields
concat('truncate table YOUR_DESTINATION_DB_NAME.', table_name, ';\r\n', 'insert into YOUR_DESTINATION_DB_NAME.', table_name, ' (', fields, ') select ', fields, ' from YOUR_SOURCE_DB_NAME.', table_name, ';') as insert_string
from result;

