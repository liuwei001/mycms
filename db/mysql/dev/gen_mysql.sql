SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables*/

DROP TABLE IF EXISTS gen_scheme;
DROP TABLE IF EXISTS gen_table_column;
DROP TABLE IF EXISTS gen_table;
DROP TABLE IF EXISTS gen_template; 




/* Create Tables */

CREATE TABLE gen_scheme
(
	id varchar(64) NOT NULL COMMENT '���',
	name varchar(200) COMMENT '����',
	category varchar(2000) COMMENT '����',
	package_name varchar(500) COMMENT '���ɰ�·��',
	module_name varchar(30) COMMENT '����ģ����',
	sub_module_name varchar(30) COMMENT '������ģ����',
	function_name varchar(500) COMMENT '���ɹ�����',
	function_name_simple varchar(100) COMMENT '���ɹ���������д��',
	function_author varchar(100) COMMENT '���ɹ�������',
	gen_table_id varchar(200) COMMENT '���ɱ���',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	update_by varchar(64) COMMENT '������',
	update_date datetime COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ����ǣ�0��������1��ɾ����',
	PRIMARY KEY (id)
) COMMENT = '���ɷ���';


CREATE TABLE gen_table
(
	id varchar(64) NOT NULL COMMENT '���',
	name varchar(200) COMMENT '����',
	comments varchar(500) COMMENT '����',
	class_name varchar(100) COMMENT 'ʵ��������',
	parent_table varchar(200) COMMENT '��������',
	parent_table_fk varchar(100) COMMENT '�����������',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	update_by varchar(64) COMMENT '������',
	update_date datetime COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ����ǣ�0��������1��ɾ����',
	PRIMARY KEY (id)
) COMMENT = 'ҵ���';


CREATE TABLE gen_table_column
(
	id varchar(64) NOT NULL COMMENT '���',
	gen_table_id varchar(64) COMMENT '��������',
	name varchar(200) COMMENT '����',
	comments varchar(500) COMMENT '����',
	jdbc_type varchar(100) COMMENT '�е��������͵��ֽڳ���',
	java_type varchar(500) COMMENT 'JAVA����',
	java_field varchar(200) COMMENT 'JAVA�ֶ���',
	is_pk char(1) COMMENT '�Ƿ�����',
	is_null char(1) COMMENT '�Ƿ��Ϊ��',
	is_insert char(1) COMMENT '�Ƿ�Ϊ�����ֶ�',
	is_edit char(1) COMMENT '�Ƿ�༭�ֶ�',
	is_list char(1) COMMENT '�Ƿ��б��ֶ�',
	is_query char(1) COMMENT '�Ƿ��ѯ�ֶ�',
	query_type varchar(200) COMMENT '��ѯ��ʽ�����ڡ������ڡ����ڡ�С�ڡ���Χ����LIKE����LIKE������LIKE��',
	show_type varchar(200) COMMENT '�ֶ����ɷ������ı����ı��������򡢸�ѡ�򡢵�ѡ���ֵ�ѡ����Աѡ�񡢲���ѡ������ѡ��',
	dict_type varchar(200) COMMENT '�ֵ�����',
	settings varchar(2000) COMMENT '�������ã���չ�ֶ�JSON��',
	sort decimal COMMENT '��������',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	update_by varchar(64) COMMENT '������',
	update_date datetime COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ����ǣ�0��������1��ɾ����',
	PRIMARY KEY (id)
) COMMENT = 'ҵ����ֶ�';


CREATE TABLE gen_template
(
	id varchar(64) NOT NULL COMMENT '���',
	name varchar(200) COMMENT '����',
	category varchar(2000) COMMENT '����',
	file_path varchar(500) COMMENT '�����ļ�·��',
	file_name varchar(200) COMMENT '�����ļ���',
	content text COMMENT '����',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	update_by varchar(64) COMMENT '������',
	update_date datetime COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ����ǣ�0��������1��ɾ����',
	PRIMARY KEY (id)
) COMMENT = '����ģ���';



/* Create Indexes */

CREATE INDEX gen_scheme_del_flag ON gen_scheme (del_flag ASC);
CREATE INDEX gen_table_name ON gen_table (name ASC);
CREATE INDEX gen_table_del_flag ON gen_table (del_flag ASC);
CREATE INDEX gen_table_column_table_id ON gen_table_column (gen_table_id ASC);
CREATE INDEX gen_table_column_name ON gen_table_column (name ASC);
CREATE INDEX gen_table_column_sort ON gen_table_column (sort ASC);
CREATE INDEX gen_table_column_del_flag ON gen_table_column (del_flag ASC);
CREATE INDEX gen_template_del_falg ON gen_template (del_flag ASC);



