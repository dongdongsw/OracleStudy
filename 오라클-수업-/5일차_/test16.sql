-- 179page ������ ���� ���

/*
	1. table : ���� ������ ���� ����
		�� ��������
		�� ����ȭ : ��¿� �ʿ��� �����͸� ����
		
	2. view : ���� ���̺�
		�� ���� �����͸� �������� �ʰ�, SELECT ���� ����� �̸� �ٿ� �� ��
		
	3. sequence: �ڵ� ���� ��ȣ
		�� �ַ� �⺻ Ű(PK) �� �ڵ� ������ ���
	
	4. �ó�� : ���̺��� ��Ī
	
	5. �ڡڡ�INDEX : �ӵ��� ����ȭ => �˻� , ����
			�� ��, �ε����� ����/���� ���� ���� ���ۿ��� ����
	6. PL/SQL
		�� FUNCTION(�Լ�), PROCEDURE(���ν���), TRIGGER(Ʈ����)
												��  ���� ���� = �ڵ�ȭ ó��
													�Խù� = ���
													�԰� = ���
													��� = ���
							�� �޼ҵ�� ���� (���� ���� �ʼ��� �ƴ�)
							�� Ư�� �۾��� �����ϴ� �ڵ� ���
			�� �������� �ִ� �Լ� (���� �Լ�) => SELECT
	-------------------------------------------------------
	������ ���̽� ����(����ȭ = 1,2,3 ����ȭ)
		��	1����ȭ: �ݺ��Ǵ� �Ӽ� ����, ���ڰ� ����

			2����ȭ: �κ� �Լ� ���� ���� (����Ű�� ��)

			3����ȭ: ������ �Լ� ���� ����
	
	=> DML(Data Manipulation Language, ������ ���� ���)
		�� (SELECT, INSERT, UPDATE, DELETE)
		�� ���̺��� ������ �ٲٴ°� �ƴ� ���̺� ��� �����͸� ����
		
	1. DDL(Date Definition Language, ������ ���Ǿ�) => ������ ����(COMMIT / ROLLBACK)
		�� ���̺�, ��, ������ ���� �����ͺ��̽� ��ü ������ ����/����/���� �ϴ� ���
		�� ��ɾ� : CREATE, ALTER, DROP, TRUNCATE, RENAME
		�� ���� 
			�� CREATE TABLE
			�� CREATE VIEW
			�� CREATE SEQUENCE
			�� CREATE FUNCTION
			
		�� ����
			�� DROP TABLE
			�� DROP VIEW
			�� DROP SEQUENCE
			
		�� ����
			�� ALTER TABLE table�� ADD 		=> �÷� �߰�
			�� ALTER TABLE table�� MODIFY 	=> �÷� ����
			�� ALTER TABLE table�� DROP 		=> �÷� ����
			
		�� �߶󳻱�
			�� TRUNCATE TABLE table_name
			
		�� �̸�����
			�� RENAME old_name TO new_name
			
		�� ���̺� ��
			�� XE������ ���� => ���� ���� �ʿ��ϴ�(�ߺ��� �� ����)
			�� ���ڼ� : 30�� ����
			�� Ư������ : _
			�� ���� ����� ���� : �տ� ����� ����
			�� ���ĺ��̳� �ѱ� ���
				----- ��ҹ��� ������ ����
				----- ���� �޸𸮿� ����ɶ��� �빮�ڷ� ����ȴ�
			
		�� ����)
			CREATE TABLE table_name(
				�÷��� �������� [��������],
				�÷��� �������� [��������],
				�÷��� �������� [��������]
				);
				
				1) �÷� ���� : � �����͸� ������ �� �м� = �䱸����
				
				2) �������� 
					�� ���� ����
						CHAR(1 ~ 2000byte) => ���� ����Ʈ
							�� ���� ũ���� �����Ͱ� �ִ� ���
						VARCHAR2(1 ~ 4000byte) => ���� ����Ʈ
							�� �Ϲ������� ���Ǵ� ����
						CLOB 4�Ⱑ => ����
							�� ���� / �ٰŸ�...
							
					�� ���� ���� 
						NUMBER : 8�ڸ�
						NUMBER(4)
						NUMBER(2,1)
						
					�� ��¥ ����
						DATE / TIMESTAMP
				
				3) ���� ����
				   ---------
				   NOT NULL => �ݵ�� �Է� �� �־�� ��
				   
				   -------------------------------------------
				   
				   UNIQUE => �ߺ��� ���� �� => NULL���� ���
				   ------ ��ȭ��ȣ / �̸��� / ���̵� ...
				   
				   NOT NULL + UNIQUE : PRIMARY KEY (�⺻Ű)
				   => ���� / ���̵�(��� ������ ã��)
				   --------------- �ڵ�����  INDEX
				   
				   FOREIGN KEY(�ܷ�Ű) : ����Ű
					�� �ٸ� ���̺��� pk�� ����
					�� �� ���̺��� ���� ����
					�� member 		reverse
						id(PK)			�����ȣ
									   (FK)id => ���� �����ؾ���
				   CHECK
					�� ������ ���ڸ� ����� ����
						�� ���� / ���� , ���� / ���� / �帣
					�� ���� ����/���� ����
					
				   DEFAULT
					�� �̸� ���� ����
					�� ���� �Էµ��� ������ �⺻�� �ڵ� �Է�
				   -------------------------------------------
					���Ѱ��� ����ϴ� ���� �ƴ϶� ������ ����� ����
					
					���� ���̺� 
					---------- ���� ���ǿ� ���� ����
					�߿� : ���̺� �Ѹ� / ũ�Ѹ�
					
					=> �÷� ���� : �÷� ������ ���ÿ� ���������� ����
						�� NOT NULL, DEFAULT, UNIQUE, CHECK
						
					=> ���̺� ���� : ���̺��� ���� �Ŀ� �������� ���� 
						�� PK, FK, CK, UK
						
					**** ��� ���� ������ user_constaints�ȿ� ����
										----------------
										
					=> CONSTRAINT�� ���������� ���̴� Ű����
					
					CREATE TABLE table_name(
						�÷��� �������� CONSTRAINT table��_�÷���_nn NOT NULL,
						�÷��� �������� DEFAULT ��,
						...,
						CONSTRAINT table��_�÷���_pk PRIMARY KEY(�÷�),
						CONSTRAINT table��_�÷���_uk UNIQUE(�÷�),
						CONSTRAINT table��_�÷���_ck CHECK(�÷� IN (....)),
						CONSTRAINT table��_�÷���_fk FOREGIN KEY(�÷�),
						REFERENCES ������ ���̺�(�÷�)
						
					)
					
					
					
*/

/* 
SELECT *
FROM user_tables
WHERE table_name = 'EMP'; 
*/

/* 
CREATE TABLE A(
	name VARCHAR2(10) CONSTRAINT a_name_nn NOT NULL
);

CREATE TABLE B(
	name VARCHAR2(10) CONSTRAINT a_name_nn NOT NULL
); 
*/

/* 
DROP TABLE A;
 */
/*  
 CREATE TABLE A(
	name VARCHAR2(20) CONSTRAINT a_name_nn NOT NULL
 ); 
 */
 /* 
 DROP TABLE A;
  CREATE TABLE A(
	name VARCHAR2(20) CONSTRAINT a_name_nn NOT NULL,
	sex VARCHAR2(20) 
 );
 
ALTER TABLE A CONSTRAINT a_name_nn;

 INSERT INTO A VALUES('ȫ�浿','����');
 INSERT INTO A VALUES(',', '����');
 INSERT INTO A VALUES(',', '����');
 INSERT INTO A VALUES(',', '����');
 INSERT INTO A VALUES('�ڹ���', '����');
 
CREATE TABLE A(
	name VARCHAR2(20) NOT NULL,
	sex VARCHAR2(20) NOT NULL 
 );
 */
 
