-- ������ => ����

/*
	1. 	����
		�����ͺ��̽� : ������ �����͸� ��Ƽ� ü�������� ���� �ý���
					  ------------
		DBMS : �����͸� ����(CRUD)
				�� DML(INSERT / UPDATE / DELETE / SELECT)
				�� Oracle / Mysql / MariaDB
							---------------
							
		RDB : ����� ���̺� ���� / �ش� ������ ����
		------------
		DB Ư¡
			������ : �����Ϳ� ���α׷��� ������
			
			�ߺ� �ּ�ȭ : ������ ����ȭ�� �̿��ؼ� �ߺ� ����
				�� �ڹ� (�޼ҵ�, Ŭ����)
				�� ���̺� : Ŭ����(vo,dto)
				
			���Ἲ : �������� ��Ȯ�� / �ϰ��� ����
					(�̻����� => �߰�, ����, ����)
					=> PRIMARY KEY
					=> ���̺����� 1�� �̻��� PRIMARY KEY ���(����)
						�� ���� (SEQUENCE)
					=> ���̺� ����
						CREATE TABLE
						CREATE SEQUENCE
						CREATE INDEX
							�� �����丵 : �˾ƺ��� ����
							int a; => int kor;
			���ȼ� : ���� �ο� / ���� ���� => Spring Security
					=> GRANT / CONNECT
					
		����Ŭ DB ���� 
			1) ���� ����
				���̺� : ���� ������ �������
						ROW / COLUMN���� ����
								| ������
						| ���� �����Ͱ� ����
						2���� �������� �Ǿ��ִ�
						
				�� : SELECT ���� �����ؼ� ����ϴ� ���� ���̺�
					=> ����
					
				�ε��� : �˻� �ӵ� ���, ���� �ӵ� ���
				
				������ : �ڵ� ���� ��ȣ
				
				���� ���� : ������ ���Ἲ / ���� ���Ἲ
						   ------------	  ----------
								PK			 FK
				
			2) ������ ����
				������ ���� : (Data File)
					�� ���� ������ ���� : �̹��� ����
					
				�������� : DB ���� ����
				
				���̺� �����̽� : ���̺� ���� �뷮
				
				�α� ���� : Ʈ����� ������
		SQL ����
		--------
			1) DQL : ������ �˻�(SELECT)
				�� ������ / �����Լ� / ���� / ���� ����
				
				�� ����)
					SELECT * | column_list
					FROM table_name | view_name | SELECT ~
					[
						WHERE ���ǹ� (������)
						GROUP BY �׷� | �Լ�
						HAVING �׷� => �����Լ�
						ORDER BY �÷� | �Լ�					
						--------------------
						| �뷮�� : INDEX �̿�
					]
					�� INDEX_ASC()
					�� INDEX_DESC()
					�� INDEX()
					
				�� ������ 
					�� �� ������ : <> = ���� �ʴ�
					
					�� �� ������ : AND, OR
									& => Scanner, || => ���ڿ�
									
					�� IN : OR�� ���� ��쿡 �ַ� ���
						�� WHERE  �÷� IN(��...)
						
					�� BETWEEN ~ AND : �Ⱓ
						�� �����ϰ� �ִ� >= AND <=
						
					�� NOT : ���� => NOT LIKE , NOT IN, NOT BETWEEN
					
					�� NULL : �÷� ���� NULL ��쿡�� ����ó���� �ȵȴ�
							IS NULL, IS NOT NULL
					
					�� LIKE : ���� ����, ���۹���, ������
						�� '%����%', '����%', '%����'
						�� '%'||?||'%' (�ڹ�) => Oracle
						�� CONCAT('%',?,'%') => Mysql
						
				�� ���� �Լ�
					SUBSTR, INSTR, LENGTH, RPAD
					MOD, CEIL, ROUND
					SYSDATE, MONTHS_BETWEEN
					TO_CHAR, TO_DATE
							 -------- ������ => DATE
					NVL
					
				�� JOIN : �Ѱ� �̻��� ���̺��� �����ؼ� ������ ����
					�� INNER JOIN
						�� EQUI_JOIN						
						�� NON_EQUI_JOIN
					
					�� OUTER JOIN(INNER JOIN + ����)
								INTERSECT + MINUS
						�� LEFT OUTER JOIN
						�� RIGTH OUTER JOIN
						
				�� SUBQUERY : �Ѱ� �̻��� SQL ������ ����	
						�� �Ϲ� ���� ����  : ������ ��
							SELECT ~ => 4
							FROM table_name => 2
							WHERE �÷� ������(SELECT ~)
											 --------
												1
								3
							=> ���� ������ ���߰� => IN, MAX, MIN
							��Į�� ��������
								=> SELECT �ڿ� �÷� ��� ���
									SELECT �÷�,
										(SELECT ~),
										------------ �ݵ�� ��� ���� 1��
										------------ ���� ���̺� ����
									FROM table_name
									
							�ζ��� �� : ���� 
								�� ����¡ => OFFSET
								�� rownum : ����Ŭ ROW���� ��ȣ �ο�
									�� �ʿ�ø��� ������ ����
								�� �α� ���� 10, ��������  10
								
			2) DML : ������ ���� (INSERT, UPDATE, DELETE)
				�� INSERT : ������ �߰�
					�� ���ϴ� �����͸� �߰�
					   ------------ DEFAULT, NULL  ����� �÷�
					   INSERT INTO table_name(�÷�,�÷� ...)
					   VALUES(��,��...)
					   ������ : ���� : "
								��¥ : SYSDATE, 'YY/MM/DD'
							ps.setString() => "
					�� ��ü ������ �߰�
						
							INSERT INTO table_name
							VALUES(��...)
						** ���̺� ������ �÷������� �߰�
                        DESC table�� => 1 ����
                        => ~VO
						UPDATE : ������ ����
							UPDATE table_name
							SET �÷�=��, �÷�=�� ...
							[WHERE ����]
						
						DELETE : ������ ����
							DELETE FROM table_name
							[WHERE ����]
							�� DROP : ���̺��� ���� ����
							�� TRUNCATE : ���̺��� ���� => ������ ��ü ����
							-------------------- AUTO Commit(����(x))
							�� DELETE : ���̺� ���� => ROW �Ѱ��� ����
							-------------------- COMMIT�� �߰�(����(o))
							DML : COMMIT ����
								�� ����Ŭ ��ü������ ����
								�� �ڹٿ��� ������ �ȵȴ�
									�� �޸𸮿��� �����͸� �б�
							
			3) DCL : ������ (GRANT, REVOKE)
				�� DBA ��� : View / PS / SQL => ������ ����
				�� ���� ���� : system / sysdba
										| system ���� ó��
								| �Ϲ� ���� ó��
				�� ����Ŭ�� 3�� �̻� ���� => ������ �ȵǴ� ���
					�� LOCK
					�� conn system / ���
					�� ALTER USER hr ACCOUNT UNLOCK

				�� ���� �ο�
					�� GRANT CREATE VIEW TO hr
					   -----			 --
					   
				�� ���� ����
					�� REVOKE CREATE VIEW FROM hr
					   ------			  ----
			
				=> GRANT / REVOKE => system
				
			4) TCL : COMMIT , ROLLBACK, SAVEPOINT
				�� Ʈ����� : �ϰ� ó��
					�� ������ SQL ������ �̿��ؼ� => �Ѱ��� ��� �ϼ�
						�� �Ѱ��� ���帶�� COMMIT ����
							try{
								INSERT --> COMMIT
								UPDATE --> COMMIT
								DELETE --> COMMIT
								INSERT --> COMMIT
							
								conn.commit()
								
							} catch(EXCEPTION ex){
								conn.rollback()
							}
						
				�� COMMIT : ���������� �޸𸮿� ����
					�� executeUpdate()
						�� commit()
						
					�� MyBatis : session session = openConnection() : FALSE
									�� SELECT
								 session session = openConnection(true)
									�� DML
									
					�� JPA : Auto => SAVE()
					
				�� ROLLBACK : ������ ���� => ���� SQL ������ ���
					�� ��ü SQL���� ����
					
				�� SAVEPOINT : ������ ��ġ�κ��� ��� (�κ��� ���)
				
			5) DDL : CREATE, ALTER, DROP, RENAME, TRUNCATE
				�� CREATE : (��ü) ����
						�� Table, View, Sequence, Function
						�� Procedure, Trigger, Index
						
					Table : ���� ����
						�� ��������
							�� ���� : CHAR(1~2000), VARCHAR2(1~4000byte)
													 | ���� ����Ʈ (�Ϲ�)
										| ��������Ʈ (���ڼ��� ����)
									CLOB(4GB)
										| �ڹ� : String	
							�� ���� : NUMBER => NUMBER(8,2) : DEFAULT 
							
							�� ��¥ : DATE , TIMESTAMP
							�� ������, ������ : BLOB / BFILE
														| FILE ����
												| 2������
									  -------------- InputStream
									  
						�� ��������
							�� PRIMARY KEY : ROW�� �ĺ��� (������)
											�ߺ� ���� ������ / NULL ��� (x)
											������ ���Ἲ(�̻�����)
								user_constrains : constraint_name
								=> ���̺��� �̸��� �ٸ��� ����
								CONSTRAINT ���̺��_�÷���_pk PRIMARY KEY(�÷�)
								
							�� FOREIGN KEY : �ٸ� ���̺�� ���輳��
											���̺� (�÷�)
								----------------------------------------------		
								CONSTRAINT ���̺��_�÷���_fk FOREIGN KEY(�÷�)
								REFERENCES �������̺�(�÷�)
								ON DELETE CASCADE
									��� / ���� ���ϱ�
									���� / ���� => ����
								----------------------------------------------
							�� UNIQUE : �ߺ����� ������ �߰� (NULL�� ���)
										=> ���̵� �𸣴� ���
										=> �ĺ�Ű
								CONSTRAINT ���̺��_�÷���_uk UNIQUE(�÷�)
								
							�� CHECK : ������ �����͸� �߰�
								CONSTRAINT ���̺��_�÷���_ck CHECK(�÷� IN(...))
								
							�� NOT NULL : null �� ������� �ʴ´�
								�� �ݵ�� �÷��ڿ� ����
								�� �÷��� �������� CONSTRAINT ���̺�� ���̺��_�÷���_nn NOT NULL
								
							�� DEFAULT
								�� �ݵ�� �÷��ڿ� ����
								�� �÷��� �������� DEFAULT ��
								
						�� ���̺� ���� ���	
								1) ���ĺ�, �ѱ۷� ����(���� : ���ĺ�)
								2) ���� ��� (�տ� ��� ����)
								3) Ư�� ����
								4) Ű����� ��� ����
								5) ���� ��� ����
								6) 30byte���� ���
								7) ��ҹ��� ������ ���� �ʴ´�
									�� ���� ����Ŭ�� ���� : �빮�ڷθ� ����
								8) ��� ���̺���� ���ϰ�
								------------
							CREATE TABLE table_name(
								�÷��� �������� [��������], => NOT NULL, DEFAULT
								�÷��� �������� [��������],
								�÷��� �������� [��������],
								...,
								[��������], ==> PK,FK,CK,UK
								[��������]
								...
							);

					View : ������ ���̺��� �����ؼ� ���� ���� ���̺�
							����, sql ���� �ܼ�ȭ, ����
							= ���� : sql����
							= ���պ� : JOIN, SUBQUERY
							-------------------------------------
							������ ���� ����
							CREATE OR REPLACE View VIEW_NAME
							AS
								SELECT ~
							����
							DROP VIEW View_name
							
					Sequence : �ڵ� ���� ��ȣ(PRIMARY KEY)
						CREATE SEQUENCE ���̺��_�÷���_seq
							START WITH ���۰� => .int a=1
							INCREMENT BY ������ => a++
							NOCACHE : �̸� ������ ���� �� 
							NOCYCLE : �ٽ� ó������ ���� �ʴ´�
								�� ���Ѵ�
								
					Function : �������� �ִ� �Լ�
						�� ���� ���, ��Į�� ��������
						�� 	CREATE OR REPLACE FUNCTION func_name(�Ű�����..)
							RETURN  ��������
							IS
								�������� ����
							BEGIN
								--- SQL ����
								RETURN ��
							END;
							=> ����
							DROP FUNCTION func_name;
							
					Procedure : ��ɸ� ���� => �������� ����
								�� ���� �޴� ��� OUT���� ����
								�� ��� => ��� ���
							CREATE OR REPLACE PROCEDURE pro_name(�Ű�����...)
							IS
								�������� ����
							BEGIN
								---- ó��
							END;
							=> INSERT / UPDATE / DELETE => IN
							=> SELECT => OUT
							=> ������ ���� ���̺��� ��������/ũ�� ��ġ
								������ ���̺��.�÷�%TYPE
								������ ��� =>  SYS_REFCURSOR
							=> PL / SQL
							
					Trigger : �������� �������� => �ڵ�ȭ ó��
							�� ERP���� �ַ� ���
						CREATE OR REPLACE TRIGGER tri_name
						(BEFORE | AFTER) (�̺�Ʈ) ON ���̺��
								 INSERT / UPDATE / DELETE
						FOR EACH ROW
						BEGIN
							=> �ڵ�ȭ ó��
							   ---------- ���̺� ����
						END;
						
						=> ���� ==> �� / ���ƿ�
							++
						
					Index : �˻� �ӵ� ���
						�� JOIN���� ����ϴ� �÷�
						�� �뷮�� �����Ͱ� �ִ� ��� �˻���� ����ϴ� �÷�
						�� NULL���� ���� �÷�
						�� �ҷ� / DML�� ���� ��� => �ӵ��� ������
						�� FK,PK => �ڵ� ����
						�� ������ ��쿣 ��� �߰�, �޸� => �ӵ��� ������
						CREATE INDEX idx_���̺�_�÷� ON ���̺�(�÷���)
						CREATE INDEX idx_���̺�_�÷� ON ���̺�(�÷���, �÷��� DESC)
						CREATE INDEX idx_���̺�_�÷� ON ���̺�(UPPER(�÷���))
															SUBSTR
						
						���� 
							=> DROP INDEX index_��
							=> ���� �ӵ�
								INDEX(idx_���̺�_�÷�) -> ����� ����
								INDEX_ASC() -> 
								INDEX_DESC()

				�� ALTER : ������ �ʿ��� ���
						�� �߰� : ADD
						�� ���� : MODIFY
						�� ���� : DROP COLUMN
						�� �����Ͱ� �̹� ����
						�� ��) ���� => ũ�Ѹ�
							likecount / jjimcount / reserveday / hit
							
				�� DROP : ���̺��� ���� ����
				
				�� TRUNCATE : �����͸� ���� ����
				
				�� RENAME : ���̺� �̸� ����
			=> ���̺� ���� -> ������ ���� -> �˻� -> �������� -> ��� SQL
				
		SQL Ʃ��
			=> �����ͺ��̽����� SQL ���� ���� => ���� ����
			=> ���� �ð� ���� / ���ҽ� ����� �ּ�ȭ, ���ü� ���
			=> Ʈ����� : ���� (���ü�)
			=> ���
				SQL : SELECT , JOIN, SUBQUERY, GROUP BY
				���� : TABLE����, �ε���
			=> ���� ����
				���ʿ��� ��ü ������ ��ĵ
				------------------------ �ε����� ������ �ȵǴ� ���
						1) *�� ������� �ʴ´�
						2) �ʿ��� �÷��� ������ �´�
						3) LIKE -> '%������%' => '������%'
						4) �Լ��� ����� �ε���
						WHERE UPPER(ename) = 'KING'
						5) ��ȿ������ JOIN / SUBQUERY �̿�
									 ----   -------- ��Į�� �������� ���� ����
												| IN�� �̿��� ��������
												| NULL���� ����
													�� �ѹ��� ó�� => JOIN�̿�
									 | ���� ���̺�κ��� ����
									 | ���ʿ��� LEFT OUTER JOIN ����
						6) �����ͷ� ���� / DML�� ���� ��� => �ε���(x)
						
						7) WHERE ���� ����
							�ε��� �÷� ���� // �����ڰ� ������ ���� ���߿�
							�Լ� ��� => �ε����� ����ȭ => �����ϸ� �Լ� ������
							
						8)  DISTINCT ����
							ORDER BY => INDEX
							ROWNUM =>  �ʿ� �ุ ��ȸ
							=> SQL Ʃ��
						
						
		�����ͺ��̽� ����
			ER - MODEL / ����ȭ / Ʈ�����




*/