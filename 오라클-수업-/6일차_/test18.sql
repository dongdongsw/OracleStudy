-- �����  ���� ���̺� ����
/*
	������ ���� => ������ ����(�䱸����, ������ �м�)
		|				����
						����, �뷡��, ������, �ٹ���, ����, ����, ������Ű
	���� ����
		|				
	������ ����
	
	����) 
		CREATE TABLE table_name(
			�÷��� �������� [��������],
			�÷��� �������� [��������],
			�÷��� �������� [��������],
			------------------------------�÷� ����
				=> �÷� ������ ���ÿ� �������� ����
				=> �ݵ�� ��� : NOT NULL, DEFAULT
			[��������],
			[��������],
			[��������],
			------------------------------ ���̺� ����
				=> ���̺��� ������� �Ŀ� ���߿� �������� ����
				=> PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE
			)
		
			�������� ���� : �������� �̸� �ο�
						   --------
							user_constaints : �Ѱ��� ����
							���̺��_�÷���_�������� ����
							----����
							nn : NOT NULL
							pk : PRIMARY KEY
							fk : FOREIGN KEY
							ck : CHECK
							uk : UNIQUE
							

*/
/* 
DROP TABLE ��ǥ�� CASCADE CONSTRAINTS;
DROP TABLE ��ǰ CASCADE CONSTRAINTS;
DROP TABLE �Ǹ���ǥ CASCADE CONSTRAINTS;
 */


DROP TABLE ��ǥ��;
DROP TABLE ��ǰ;
DROP TABLE �Ǹ���ǥ;


/* 

emp / dept
��� : empno = PRIMARY KEY 
�̸� : ename = NOT NULL
���� : job = NOT NULL / CHECK
��� : mgr = NULL ���
�Ի��� : hiredate = DATE => DEFAULT
�޿� : sal = NOT NULL
������ : comm = NULL ���
�μ� : deptno = FOREIGN KEY
-------------
�μ� ��ȣ : deptno = PRIMARY KEY
�μ��� : dname(CHECK) = NOT NULL
�ٹ��� : loc(CHECK) = NOT NULL

ȸ��  => ����(ID) ����, ���, ����...

1. ���̺�
2. ���� ����
3. ���̺� ����

=> �Ǹ���ǥ / ��ǰ / ��ǥ ��
	-----------------------------------------------------
	�÷��� 		��ǥ��ȣ		�Ǹ�����		����		�Ѿ�
	-----------------------------------------------------
	��������			pk		   NN		  NN		CK
							DEFAULT
	-----------------------------------------------------
	�������̺�
	-----------------------------------------------------
	���� �÷�
	-----------------------------------------------------
	üũ												 >0
	-----------------------------------------------------
	�������� 	VARCHAR2	DATE		VARCHAR2	NUMBER
	-----------------------------------------------------
	ũ��				13						51		 8,2
	-----------------------------------------------------
	
*/
/* 
CREATE TABLE �Ǹ���ǥ(
	��ǥ��ȣ VARCHAR2(13),
	�Ǹ����� DATE DEFAULT SYSDATE CONSTRAINT �Ǹ���ǥ_�Ǹ�����_nn NOT NULL,
	���� VARCHAR2(51) CONSTRAINT �Ǹ���ǥ_����_nn NOT NULL,
	�Ѿ�	 NUMBER CONSTRAINT �Ǹ���ǥ_�Ѿ�_ck CHECK(�Ѿ� > 0),
	CONSTRAINT �Ǹ���ǥ_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ)
);
 */
/* 
	��ǰ
	-------------------------------------------------
	�÷��� 		 ��ǰ��ȣ		��ǰ��		��ǰ�ܰ�	
	-------------------------------------------------
	��������			pk		   	  NN		   CK		
	-------------------------------------------------
	�������̺�
	-------------------------------------------------
	���� �÷�
	-------------------------------------------------
	üũ									  	    >0
	-------------------------------------------------
	�������� 	VARCHAR2	    VARCHAR2	NUMBER
	-------------------------------------------------
	ũ��				13		   		51		 8,2
	-------------------------------------------------
 */
 /* 
CREATE TABLE ��ǰ(
	��ǰ��ȣ VARCHAR2(13),
	��ǰ�� VARCHAR2(51) CONSTRAINT ��ǰ_��ǰ��_nn NOT NULL,
	��ǰ�ܰ�	NUMBER ,
	CONSTRAINT ��ǰ_��ǰ��ȣ_pk PRIMARY KEY(��ǰ��ȣ),
	CONSTRAINT ��ǰ_��ǰ�ܰ�_ck CHECK(��ǰ�ܰ� > 0)
);
 */

/* 
	��ǥ ��
	--------------------------------------------------------------
	�÷��� 		 ��ǥ��ȣ		��ǰ��ȣ		����		�ܰ�		�ݾ�
	--------------------------------------------------------------
	��������		  PK/FK		   	  FK		 NN		 NN	     CK		
	--------------------------------------------------------------
	�������̺�	  �Ǹ���ǥ		 ��ǰ	
	--------------------------------------------------------------
	���� �÷�   	  ��ǥ ��ȣ		��ǰ ��ȣ
	--------------------------------------------------------------
	üũ									  	    			 >0
	--------------------------------------------------------------
	�������� 	VARCHAR2	    VARCHAR2	NUMBER	NUMBER	NUMBER
	--------------------------------------------------------------
	ũ��				13		   		51		 8,2	 8,2	 8,2
	--------------------------------------------------------------
 */

/* 
CREATE TABLE ��ǥ��(
	��ǥ��ȣ VARCHAR2(13),
	��ǰ��ȣ VARCHAR2(13),
	���� NUMBER CONSTRAINT ��ǥ��_����_nn NOT NULL,
	�ܰ� NUMBER CONSTRAINT ��ǥ��_�ܰ�_nn NOT NULL,
	�ݾ� NUMBER,
	CONSTRAINT ��ǥ��_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ,��ǰ��ȣ),
	CONSTRAINT ��ǥ��_��ǥ��ȣ_fk FOREIGN KEY(��ǥ��ȣ)
		REFERENCES �Ǹ���ǥ(��ǥ��ȣ),
	CONSTRAINT ��ǥ��_��ǰ��ȣ_fk FOREIGN KEY(��ǰ��ȣ)
		REFERENCES ��ǰ(��ǰ��ȣ),
	CONSTRAINT ��ǥ��_�ݾ�_ck CHECK(�ݾ� > 0)
);
 */
----------------------------------------------------------------------



/* 
CREATE TABLE �Ǹ���ǥ(
	��ǥ��ȣ VARCHAR2(13),
	�Ǹ����� DATE,
	���� 	VARCHAR2(51),
	�Ѿ�	 	NUMBER
);

CREATE TABLE ��ǰ(
	��ǰ��ȣ 	VARCHAR2(13),
	��ǰ�� 		VARCHAR2(51),
	��ǰ�ܰ�		NUMBER
);

CREATE TABLE ��ǥ��(
	��ǥ��ȣ VARCHAR2(13),
	��ǰ��ȣ VARCHAR2(51),
	���� 	NUMBER,
	�ܰ� 	NUMBER,
	�ݾ� 	NUMBER
);

 */

/*
	1. NOT NULL => MODIFY �÷��� �������� CONSTRAINT ~ 
	2. CHECK, PRIMARY KEY, FOREIGN KEY, UNIQUE => ADD
		�� ADD CONSTRAINT ...
	3. ���� ���� ����
		�� ALTER TABLE table_name DROP CONSTRAINT �̸�
				�Ǹ���ǥ_��ǥ��ȣ_pk
	=> �ѹ��� �ϼ��� �ȵȴ�
		�÷� �߰�, �÷� ũ�� ����, �÷� ������ ����
		ALTER TABLE table_name ADD �÷��� �������� [��������]
		ALTER TABLE table_name MODIFY �÷��� ��������
											--------
		ALTER TABLE table_name DROP COLUMN col_name
			�� COLUMN����
			�� �������� ���� => �����Ͱ� �ִ� ���
		�������� �߰�, ���� ���� ����, ���� ���� ���� ����
		ALTER TABLE table_name ADD CONSTRAINT ~ 
								---- PK,FK,CK,UK
		ALTER TABLE table_name MODIFY �÷��� �������� CONSTRAINT
								------ NN
		DEFAULT  ���ÿ��� CONSTRAINT �տ� ����
		ALTER TABLE table_name DROP CONSTRAINT constraing_name
*/
CREATE TABLE �Ǹ���ǥ(
	��ǥ��ȣ VARCHAR2(13),
	�Ǹ����� DATE,
	���� 	VARCHAR2(51),
	�Ѿ�	 	NUMBER(8,2)
);


ALTER TABLE �Ǹ���ǥ ADD CONSTRAINT �Ǹ���ǥ_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ);
ALTER TABLE �Ǹ���ǥ MODIFY �Ǹ����� DATE DEFAULT SYSDATE;
ALTER TABLE �Ǹ���ǥ MODIFY �Ǹ����� 
	CONSTRAINT �Ǹ���ǥ_�Ǹ�����_nn NOT NULL;
ALTER TABLE �Ǹ���ǥ MODIFY ���� VARCHAR2(51) CONSTRAINT �Ǹ���ǥ_����_nn NOT NULL;
ALTER TABLE �Ǹ���ǥ ADD CONSTRAINT �Ǹ���ǥ_�Ѿ�_ck CHECK(�Ѿ� > 0);
CREATE TABLE ��ǰ(
	��ǰ��ȣ 	VARCHAR2(13),
	��ǰ�� 		VARCHAR2(51),
	��ǰ�ܰ�		NUMBER(8,2)
);

ALTER TABLE ��ǰ ADD CONSTRAINT ��ǰ_��ǰ��ȣ_pk PRIMARY KEY(��ǰ��ȣ);
ALTER TABLE ��ǰ MODIFY ��ǰ�� VARCHAR2(51) CONSTRAINT ��ǰ_��ǰ��_nn NOT NULL;
ALTER TABLE ��ǰ ADD CONSTRAINT ��ǰ_��ǰ�ܰ�_ck CHECK(��ǰ�ܰ� > 0);
CREATE TABLE ��ǥ��(
	��ǥ��ȣ VARCHAR2(13),
	��ǰ��ȣ VARCHAR2(13),
	���� 	NUMBER(8,2),
	�ܰ� 	NUMBER(8,2),
	�ݾ� 	NUMBER(8,2)
);























