-- List what are the functions or virtual tables provided by each extension
-- Firt step to eventually create test cases for the existing functionality

create table extension (ext_module TEXT);
-- Extensions compiled as of 2021-08-30
insert into extension values 
	('csv'), ('zipfile'), 
	('ora'), ('exec'), ('odbc'), ('xml'), ('test'), 
	('vsv'), 
	('pivot_vtab'), 
	('xlsxvtab'),
	('util');

create table ext_function_builtin as select distinct name from pragma_function_list();
create table ext_module_builtin   as select name from pragma_module_list();

create table ext_function (ext_name TEXT, ext_function TEXT);
create table ext_module   (ext_name TEXT, ext_module TEXT);

.headers off
.mode tab
.separator "\r\n"
.once extension_functionality.sql
select 
	'.load ' || ext_module, 
	'insert into ext_function', 
	'  select distinct ''' || ext_module || ''' as ext_name, name as ext_function from pragma_function_list()', 
	'  where name not in (select name from ext_function_builtin)',
	'  and   name not in (select ext_function from ext_function);',
	'insert into ext_module', 
	'  select ''' || ext_module || ''' as ext_name, name as ext_module from pragma_module_list()', 
	'  where name not in (select name from ext_module_builtin)', 
	'  and   name not in (select ext_module from ext_module);'
from extension;
.read extension_functionality.sql
.headers on
.mode list
select * from ext_function order by 1, 2;
select * from ext_module order by 1, 2;

.exit

/* Results as of 2021-08-30

ext_name|ext_function
exec|exec
odbc|odbc_dsn
odbc|odbc_query
odbc|odbc_read
odbc|odbc_write
ora|base64_decode
ora|base64_encode
ora|concat
ora|conv
ora|crc32
ora|decode
ora|levenshtein
ora|md5
ora|rownum
ora|strpart
ora|tosize
test|test
util|bin
util|bit
xlsxvtab|attr
xlsxvtab|xlsxvtab_config
xml|xml_append
xml|xml_extract
xml|xml_remove
xml|xml_update
xml|xml_valid
zipfile|zipfile
zipfile|zipfile_cds

ext_name|ext_module
csv|csv
exec|exec
pivot_vtab|pivot_vtab
vsv|vsv
xlsxvtab|xlsxvtab
xml|xml_each
zipfile|zipfile

*/

-- Some queries unfinished to eventually create test cases for the existing functionality
select 6=(select count(*) from pragma_module_list() where name in (
-- csv
'csv', 

-- exec
'exec', 

-- pivot_vtab
'pivot_vtab', 

'vsv', 'xlsxvtab', 'xml_each'));

select count(*) from pragma_function_list() where name in (

-- csv
-- no functions


);
