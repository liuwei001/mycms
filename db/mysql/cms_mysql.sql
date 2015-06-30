SET SESSION FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS cms_article;
DROP TABLE IF EXISTS cms_article_data;
DROP TABLE IF EXISTS cms_category;
DROP TABLE IF EXISTS cms_comment;
DROP TABLE IF EXISTS cms_guestbook;
DROP TABLE IF EXISTS cms_link;
DROP TABLE IF EXISTS cms_site;
/* Create Tables */

CREATE TABLE cms_article
(
	id varchar(64) NOT NULL COMMENT '���',
	category_id varchar(64) NOT NULL COMMENT '��Ŀ���',
	title varchar(255) NOT NULL COMMENT '����',
	link varchar(255) COMMENT '��������',
	color varchar(50) COMMENT '������ɫ',
	image varchar(255) COMMENT '����ͼƬ',
	keywords varchar(255) COMMENT '�ؼ���',
	description varchar(255) COMMENT '������ժҪ',
	weight int DEFAULT 0 COMMENT 'Ȩ�أ�Խ��Խ��ǰ',
	weight_date datetime COMMENT 'Ȩ������',
	hits int DEFAULT 0 COMMENT '�����',
	posid varchar(10) COMMENT '�Ƽ�λ����ѡ',
	custom_content_view varchar(255) COMMENT '�Զ���������ͼ',
	view_config text COMMENT '��ͼ����',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	update_by varchar(64) COMMENT '������',
	update_date datetime COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '���±�';


CREATE TABLE cms_article_data
(
	id varchar(64) NOT NULL COMMENT '���',
	content text COMMENT '��������',
	copyfrom varchar(255) COMMENT '������Դ',
	relation varchar(255) COMMENT '�������',
	allow_comment char(1) COMMENT '�Ƿ���������',
	PRIMARY KEY (id)
) COMMENT = '�������';


CREATE TABLE cms_category
(
	id varchar(64) NOT NULL COMMENT '���',
	parent_id varchar(64) NOT NULL COMMENT '�������',
	parent_ids varchar(2000) NOT NULL COMMENT '���и������',
	site_id varchar(64) DEFAULT '1' COMMENT 'վ����',
	office_id varchar(64) COMMENT '��������',
	module varchar(20) COMMENT '��Ŀģ��',
	name varchar(100) NOT NULL COMMENT '��Ŀ����',
	image varchar(255) COMMENT '��ĿͼƬ',
	href varchar(255) COMMENT '����',
	target varchar(20) COMMENT 'Ŀ��',
	description varchar(255) COMMENT '����',
	keywords varchar(255) COMMENT '�ؼ���',
	sort int DEFAULT 30 COMMENT '��������',
	in_menu char(1) DEFAULT '1' COMMENT '�Ƿ��ڵ�������ʾ',
	in_list char(1) DEFAULT '1' COMMENT '�Ƿ��ڷ���ҳ����ʾ�б�',
	show_modes char(1) DEFAULT '0' COMMENT 'չ�ַ�ʽ',
	allow_comment char(1) COMMENT '�Ƿ���������',
	is_audit char(1) COMMENT '�Ƿ���Ҫ���',
	custom_list_view varchar(255) COMMENT '�Զ����б���ͼ',
	custom_content_view varchar(255) COMMENT '�Զ���������ͼ',
	view_config text COMMENT '��ͼ����',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	update_by varchar(64) COMMENT '������',
	update_date datetime COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '��Ŀ��';


CREATE TABLE cms_comment
(
	id varchar(64) NOT NULL COMMENT '���',
	category_id varchar(64) NOT NULL COMMENT '��Ŀ���',
	content_id varchar(64) NOT NULL COMMENT '��Ŀ���ݵı��',
	title varchar(255) COMMENT '��Ŀ���ݵı���',
	content varchar(255) COMMENT '��������',
	name varchar(100) COMMENT '��������',
	ip varchar(100) COMMENT '����IP',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	audit_user_id varchar(64) COMMENT '�����',
	audit_date datetime COMMENT '���ʱ��',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '���۱�';


CREATE TABLE cms_guestbook
(
	id varchar(64) NOT NULL COMMENT '���',
	type char(1) NOT NULL COMMENT '���Է���',
	content varchar(255) NOT NULL COMMENT '��������',
	name varchar(100) NOT NULL COMMENT '����',
	email varchar(100) NOT NULL COMMENT '����',
	phone varchar(100) NOT NULL COMMENT '�绰',
	workunit varchar(100) NOT NULL COMMENT '��λ',
	ip varchar(100) NOT NULL COMMENT 'IP',
	create_date datetime NOT NULL COMMENT '����ʱ��',
	re_user_id varchar(64) COMMENT '�ظ���',
	re_date datetime COMMENT '�ظ�ʱ��',
	re_content varchar(100) COMMENT '�ظ�����',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '���԰�';


CREATE TABLE cms_link
(
	id varchar(64) NOT NULL COMMENT '���',
	category_id varchar(64) NOT NULL COMMENT '��Ŀ���',
	title varchar(255) NOT NULL COMMENT '��������',
	color varchar(50) COMMENT '������ɫ',
	image varchar(255) COMMENT '����ͼƬ',
	href varchar(255) COMMENT '���ӵ�ַ',
	weight int DEFAULT 0 COMMENT 'Ȩ�أ�Խ��Խ��ǰ',
	weight_date datetime COMMENT 'Ȩ������',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	update_by varchar(64) COMMENT '������',
	update_date datetime COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = '��������';


CREATE TABLE cms_site
(
	id varchar(64) NOT NULL COMMENT '���',
	name varchar(100) NOT NULL COMMENT 'վ������',
	title varchar(100) NOT NULL COMMENT 'վ�����',
	logo varchar(255) COMMENT 'վ��Logo',
	domain varchar(255) COMMENT 'վ������',
	description varchar(255) COMMENT '����',
	keywords varchar(255) COMMENT '�ؼ���',
	theme varchar(255) DEFAULT 'default' COMMENT '����',
	copyright text COMMENT '��Ȩ��Ϣ',
	custom_index_view varchar(255) COMMENT '�Զ���վ����ҳ��ͼ',
	create_by varchar(64) COMMENT '������',
	create_date datetime COMMENT '����ʱ��',
	update_by varchar(64) COMMENT '������',
	update_date datetime COMMENT '����ʱ��',
	remarks varchar(255) COMMENT '��ע��Ϣ',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT 'ɾ�����',
	PRIMARY KEY (id)
) COMMENT = 'վ���';



/* Create Indexes */

CREATE INDEX cms_article_create_by ON cms_article (create_by ASC);
CREATE INDEX cms_article_title ON cms_article (title ASC);
CREATE INDEX cms_article_keywords ON cms_article (keywords ASC);
CREATE INDEX cms_article_del_flag ON cms_article (del_flag ASC);
CREATE INDEX cms_article_weight ON cms_article (weight ASC);
CREATE INDEX cms_article_update_date ON cms_article (update_date ASC);
CREATE INDEX cms_article_category_id ON cms_article (category_id ASC);
CREATE INDEX cms_category_parent_id ON cms_category (parent_id ASC);
/*CREATE INDEX cms_category_parent_ids ON cms_category (parent_ids ASC);*/
CREATE INDEX cms_category_module ON cms_category (module ASC);
CREATE INDEX cms_category_name ON cms_category (name ASC);
CREATE INDEX cms_category_sort ON cms_category (sort ASC);
CREATE INDEX cms_category_del_flag ON cms_category (del_flag ASC);
CREATE INDEX cms_category_office_id ON cms_category (office_id ASC);
CREATE INDEX cms_category_site_id ON cms_category (site_id ASC);
CREATE INDEX cms_comment_category_id ON cms_comment (category_id ASC);
CREATE INDEX cms_comment_content_id ON cms_comment (content_id ASC);
CREATE INDEX cms_comment_status ON cms_comment (del_flag ASC);
CREATE INDEX cms_guestbook_del_flag ON cms_guestbook (del_flag ASC);
CREATE INDEX cms_link_category_id ON cms_link (category_id ASC);
CREATE INDEX cms_link_title ON cms_link (title ASC);
CREATE INDEX cms_link_del_flag ON cms_link (del_flag ASC);
CREATE INDEX cms_link_weight ON cms_link (weight ASC);
CREATE INDEX cms_link_create_by ON cms_link (create_by ASC);
CREATE INDEX cms_link_update_date ON cms_link (update_date ASC);
CREATE INDEX cms_site_del_flag ON cms_site (del_flag ASC);



