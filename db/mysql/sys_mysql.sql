SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS sys_role_office;
DROP TABLE IF EXISTS sys_user_role;
DROP TABLE IF EXISTS sys_user;
DROP TABLE IF EXISTS sys_office;
DROP TABLE IF EXISTS sys_area;
DROP TABLE IF EXISTS sys_dict;
DROP TABLE IF EXISTS sys_log;
DROP TABLE IF EXISTS sys_mdict;
DROP TABLE IF EXISTS sys_role_menu;
DROP TABLE IF EXISTS sys_menu;
DROP TABLE IF EXISTS sys_role;




/* Create Tables */

CREATE TABLE sys_area
(
	id varchar(64) NOT NULL COMMENT '���',
	parent_id varchar(64) NOT NULL COMMENT '�������',
	parent_ids varchar(2000) NOT NULL COMMENT '���и������',
	name varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '����',
	code varchar(100) COMMENT '�������',
	type char(1) COMMENT '��������',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '�����';


CREATE TABLE sys_dict
(
	id varchar(64) NOT NULL COMMENT '���',
	value varchar(100) NOT NULL COMMENT '����ֵ',
	label varchar(100) NOT NULL COMMENT '��ǩ��',
	type varchar(100) NOT NULL COMMENT '����',
	description varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '��������',
	parent_id varchar(64) DEFAULT '0' COMMENT '�������',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '�ֵ��';


CREATE TABLE sys_log
(
	id varchar(64) NOT NULL COMMENT '���',
	type char(1) DEFAULT '1' COMMENT '��־����',
	title varchar(255) DEFAULT '' COMMENT '��־����',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	remote_addr varchar(255) COMMENT '����IP��ַ',
	user_agent varchar(255) COMMENT '�û�����',
	request_uri varchar(255) COMMENT '����URI',
	method varchar(5) COMMENT '������ʽ',
	params text COMMENT '�����ύ������',
	exception text COMMENT '�쳣��Ϣ',
	PRIMARY KEY (id)
) COMMENT = '��־��';


CREATE TABLE sys_mdict
(
	id varchar(64) NOT NULL COMMENT '���',
	parent_id varchar(64) NOT NULL COMMENT '�������',
	parent_ids varchar(2000) NOT NULL COMMENT '���и������',
	name varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '����',
	description varchar(100) COMMENT '����',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '�༶�ֵ��';


CREATE TABLE sys_menu
(
	id varchar(64) NOT NULL COMMENT '���',
	parent_id varchar(64) NOT NULL COMMENT '�������',
	parent_ids varchar(2000) NOT NULL COMMENT '���и������',
	name varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '����',
	href varchar(2000) COMMENT '����',
	target varchar(20) COMMENT 'Ŀ��',
	icon varchar(100) COMMENT 'ͼ��',
	is_show char(1) NOT NULL COMMENT '�Ƿ��ڲ˵�����ʾ',
	permission varchar(200) COMMENT 'Ȩ�ޱ�ʶ',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '�˵���';


CREATE TABLE sys_office
(
	id varchar(64) NOT NULL COMMENT '���',
	parent_id varchar(64) NOT NULL COMMENT '�������',
	parent_ids varchar(2000) NOT NULL COMMENT '���и������',
	name varchar(100) NOT NULL COMMENT '����',
	sort decimal(10,0) NOT NULL COMMENT '����',
	area_id varchar(64) NOT NULL COMMENT '��������',
	code varchar(100) COMMENT '�������',
	type char(1) NOT NULL COMMENT '��������',
	grade char(1) NOT NULL COMMENT '�����ȼ�',
	address varchar(255) COMMENT '��ϵ��ַ',
	zip_code varchar(100) COMMENT '��������',
	master varchar(100) COMMENT '������',
	phone varchar(200) COMMENT '�绰',
	fax varchar(200) COMMENT '����',
	email varchar(200) COMMENT '����',
	USEABLE varchar(64) COMMENT '�Ƿ�����',
	PRIMARY_PERSON varchar(64) COMMENT '��������',
	DEPUTY_PERSON varchar(64) COMMENT '��������',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '������';


CREATE TABLE sys_role
(
	id varchar(64) NOT NULL COMMENT '���',
	office_id varchar(64) COMMENT '��������',
	name varchar(100) NOT NULL COMMENT '��ɫ����',
	enname varchar(255) COMMENT 'Ӣ������',
	role_type varchar(255) COMMENT '��ɫ����',
	data_scope char(1) COMMENT '���ݷ�Χ',
	is_sys varchar(64) COMMENT '�Ƿ�ϵͳ����',
	useable varchar(64) COMMENT '�Ƿ����',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '��ɫ��';


CREATE TABLE sys_role_menu
(
	role_id varchar(64) NOT NULL COMMENT '��ɫ���',
	menu_id varchar(64) NOT NULL COMMENT '�˵����',
	PRIMARY KEY (role_id, menu_id)
) COMMENT = '��ɫ-�˵�';


CREATE TABLE sys_role_office
(
	role_id varchar(64) NOT NULL COMMENT '��ɫ���',
	office_id varchar(64) NOT NULL COMMENT '�������',
	PRIMARY KEY (role_id, office_id)
) COMMENT = '��ɫ-����';


CREATE TABLE sys_user
(
	id varchar(64) NOT NULL COMMENT '���',
	company_id varchar(64) NOT NULL COMMENT '������˾',
	office_id varchar(64) NOT NULL COMMENT '��������',
	login_name varchar(100) NOT NULL COMMENT '��¼��',
	password varchar(100) NOT NULL COMMENT '����',
	no varchar(100) COMMENT '����',
	name varchar(100) NOT NULL COMMENT '����',
	email varchar(200) COMMENT '����',
	phone varchar(200) COMMENT '�绰',
	mobile varchar(200) COMMENT '�ֻ�',
	user_type char(1) COMMENT '�û�����',
	photo varchar(1000) COMMENT '�û�ͷ��',
	login_ip varchar(100) COMMENT '����½IP',
	login_date datetime COMMENT '����½ʱ��',
	login_flag varchar(64) COMMENT '�Ƿ�ɵ�¼',
	create_by varchar(64) NOT NULL COMMENT '������',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	update_by varchar(64) NOT NULL COMMENT '������',
	update_date datetime NOT NULL COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '�û���';


CREATE TABLE sys_user_role
(
	user_id varchar(64) NOT NULL COMMENT '�û����',
	role_id varchar(64) NOT NULL COMMENT '��ɫ���',
	PRIMARY KEY (user_id, role_id)
) COMMENT = '�û�-��ɫ';



/* Create Indexes */

CREATE INDEX sys_area_parent_id ON sys_area (parent_id ASC);
/*CREATE INDEX sys_area_parent_ids ON sys_area (parent_ids ASC);*/
CREATE INDEX sys_area_del_flag ON sys_area (del_flag ASC);
CREATE INDEX sys_dict_value ON sys_dict (value ASC);
CREATE INDEX sys_dict_label ON sys_dict (label ASC);
CREATE INDEX sys_dict_del_flag ON sys_dict (del_flag ASC);
CREATE INDEX sys_log_create_by ON sys_log (create_by ASC);
CREATE INDEX sys_log_request_uri ON sys_log (request_uri ASC);
CREATE INDEX sys_log_type ON sys_log (type ASC);
CREATE INDEX sys_log_create_date ON sys_log (create_date ASC);
CREATE INDEX sys_mdict_parent_id ON sys_mdict (parent_id ASC);
/*CREATE INDEX sys_mdict_parent_ids ON sys_mdict (parent_ids ASC);*/
CREATE INDEX sys_mdict_del_flag ON sys_mdict (del_flag ASC);
CREATE INDEX sys_menu_parent_id ON sys_menu (parent_id ASC);
/*CREATE INDEX sys_menu_parent_ids ON sys_menu (parent_ids ASC);*/
CREATE INDEX sys_menu_del_flag ON sys_menu (del_flag ASC);
CREATE INDEX sys_office_parent_id ON sys_office (parent_id ASC);
/*CREATE INDEX sys_office_parent_ids ON sys_office (parent_ids ASC);*/
CREATE INDEX sys_office_del_flag ON sys_office (del_flag ASC);
CREATE INDEX sys_office_type ON sys_office (type ASC);
CREATE INDEX sys_role_del_flag ON sys_role (del_flag ASC);
CREATE INDEX sys_role_enname ON sys_role (enname ASC);
CREATE INDEX sys_user_office_id ON sys_user (office_id ASC);
CREATE INDEX sys_user_login_name ON sys_user (login_name ASC);
CREATE INDEX sys_user_company_id ON sys_user (company_id ASC);
CREATE INDEX sys_user_update_date ON sys_user (update_date ASC);
CREATE INDEX sys_user_del_flag ON sys_user (del_flag ASC);



