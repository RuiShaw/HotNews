use test;
/* �û�ע��/��½�� */
create table if not exists Users(
  email varchar(50) NOT NULL COMMENT '������û�����ͬ',
  username varchar(50) PRIMARY KEY COMMENT '�û���=����',
  nickname varchar(100) NOT NULL COMMENT '�ǳ�',
  password varchar(50) NOT NULL COMMENT '����MD5ֵ',
  reg_time varchar(50) NOT NULL COMMENT 'ע��ʱ��',
  reset_code varchar(50) COMMENT '����������֤Code.(codeΪ����ʧЧ,�ڷ��͸��������ʼ���Ĭ��30��������Ϊ��)',
  last_login_time varchar(50) COMMENT '���һ�ε�¼ʱ��'
);

/* ���ͱ� */
create table if not exists blog(
	id varchar(50) primary key comment '����id(e.g: blog_)',
	title varchar(50) not null comment '���ͱ���',
	discuss_id varchar(50) comment '��������id(�������۱�)',
	good int not null comment '��������',
	time varchar(50) not null comment '���ʹ���ʱ��',
	username varchar(50) not null comment '��������',
	authority varchar(10) not null comment '����Ȩ��(˽��/����) default:˽��',
	content text comment '��������'
);

/* ���۱� */
create table if not exists discuss(
  id varchar(50) not null comment '����id',
  time varchar(50) not null comment '����ʱ��',
  d_user varchar(50) not null comment '�����û�',
  content text comment '��������'
);

