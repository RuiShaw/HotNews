use test;
create table if not exists Users
(
  email varchar(50) NOT NULL COMMENT '������û�����ͬ',
  username varchar(50) PRIMARY KEY COMMENT '�û���=����',
  nickname varchar(100) NOT NULL COMMENT '�ǳ�',
  password varchar(50) NOT NULL COMMENT '����MD5ֵ',
  reg_time varchar(50) NOT NULL COMMENT 'ע��ʱ��',
  reset_code varchar(50) COMMENT '����������֤Code.(codeΪ����ʧЧ,�ڷ��͸��������ʼ���Ĭ��30��������Ϊ��)',
  last_login_time varchar(50) COMMENT '���һ�ε�¼ʱ��'
);