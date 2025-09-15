-- 3�� ~ 4�� => ���� / ����

/*
	PL/SQL/���Խ� (REGEXP_LIKE, REGEXP_COUNT, REGEXP_REPALCE,
		REGEXP_STRSUB, REGEXP_INSTR)
	=> �׷� �Լ� : GROUPING /  CUBE / ROLLUP
	=> �����ͺ��̽� ���� (����ȭ) / Ʈ����� ����
	
	1. 3��
		=> SELECT => ������ �˻� => ������Ʈ(80%)
		����,����)
		-----------------------------------------------------
		SELECT (DISTINCT|*) *| column_list(������(���),�Լ�)
		FROM table_name | view_name | SELECT ~ 
		-----------------------------------------------------
		[
			WHERE ���ǹ�(�� ������, �� ������, BETWEEN ~ AND
						IN, LIKE, NOT, NULL(IS NULL, IS NOT NULL)
			GROUP BY �׷� �÷� | �Լ� => �׷캰 ����
					------------------ �÷� ���� ����
			HAVING �׷� ���� => GROUP BY�� �ִ� ��쿡�� ����� ����
			
			ORDER BY ������ �÷� | �Լ� (ASC | DESC)
										--- ���� ����
			=> �����Ͱ� ���� ���� ���Ľÿ� INDEX
				INDEX_ASC(), INDEX_DESC()
		]
		1) ������(ROW ����) => ���پ� ���� ���
		
			��������� : +, -, *, / => MOD() : %
				�� ROW���� ��� => �����ϴ� �Լ��� ����
				
			�� ������ : =, <>, <, >, <=, >=
			
			�� ������ : AND(����, �Ⱓ ����), OR(����, �Ⱓ�� ��� ���)
											   | ���� �˻�
											   
			BETWEEN ~ AND : AND ��� ��� => ���� ����
				=> ����¡ ���, üũ��, ���� �Ⱓ...
				
			IN : OR �������� ��� => MyBatis =>forEach
				=> ���� ����
			
			NOT : ���� => NOT IN, NOT LIKE, NOT BETWEEN
				=> !�� ������� �ʴ´�
				
			NULL : ���� ���� ����
				=> NullPointerException : ���� �߻�
				=> null�� ����ó�� => ��� ��(null)
				=> IS NULL, IS NOT NULL
				WHERE ename = null => NULL
				WHERE ename IS NULL => (o)
				=> image�� ���� ���
			
			LIKE : % => ���� ������ ����
					_ => ���� �ѱ���
					startsWith : ����%  ===============> 	^����
					endsWith : %����		===============>	����$
					contains : %����%	===============>	����
						���Խ�
							���� : [��-�R], [A-Za-z], [0-9]
					=> REGEXP_LIKE(�÷�, ���Խ�)
					
		2) ���� �Լ�
			= ������ �Լ� : ROW���� ó��(���پ�ó��)
				���� �Լ�
					SUBSTR => ���� �ڸ���
								SUBSTR(�÷���, ���� ��ġ, �����)
											  --------- 1������
					
					INSTR => ������ ��ġ
							INSTR(�÷���, ã�� ����, ���� ��ġ, ���°)
					
					LENGTH => ������ ����
							LENGTH(�÷���) : ��й�ȣ
					
					RPAD => ���� ������ ���ڶ�� ���(������ ���� ���)
							ad****
							RPAD(�÷���,���� ����)
										LENGTH
							=> ���̵� ã�� / ���
					REPLACE => ���� ���� => &, |, "
							=> ������ ä��(ä�ù��� ����)
							=> URL => &�� ��û�� ����
							=> http://localhost/food_detail.jsp?fno=1&page=3
																------------
															GET / POST / PUT / DELETE
															RESTFul
												GET  : SELECT
												POST : INSERT
												PUT : UPDATE
												DELETE : DELETE
												-----------------
							REPLACE(�÷����� ��������, ������ ����)
										
						=> ������ �Լ� : TRIM(), INITCAP, UPPER, LOWER
							=> �ڹ��� String���� ó��
							
				���� �Լ�
					=> 	MOD : ������ => %
						MOD(����1, ����2) => ����1%����2
					=> ROUND : �ݿø� = ���
					=> CEIL : �ø� = �������� ���ϱ�
						TRUNC ����
						TRUNC(123.567,2) => .56
				
				��¥ �Լ�
					=> SYSDATE : �ý��� �ð�, ��¥
							��� �����ڸ� �̿��ؼ� ����...
				
					=> MONTHS_BETWEEN : �Ⱓ�� ������
						MONTHS_BETWEEN(���糯¥, ���� ��¥)
				
				��Ÿ �Լ�
					=> 	NVL : NULL�� ��� �ٸ� ������ ����
						NVL(�÷�, ��ü��)
							  |		|
							  ------- ���������� ����
						NVL(ename,0) => ����
						NVL(address,'') => "(NULL),' '(Space)
						
				��ȯ �Լ� => ��¥, ���� => ���ڿ� ��ȯ
					TO_CHAR(����, '����')
						TO_CHAR(1234567, '99,999,999') 1,234,567
					TO_CHAR(��¥, '����')
							YYYY / RRRR = �⵵
							MM => ��
							DD => ��
							HH / HH24 => �ð�
							MI => ��
							SS => ��
							DY => ����
						=> ��¥ + �ð� = �������� / ���
						=> ��¥ (�ڹ�)
						=> �ð� (�ڹٿ��� ó���� ��ƴ�) => 12:00
						
			= ���� �Լ� : COLUMN���� ó��
				COUNT : row�� ����
					=> �α��� / ���̵� üũ / ��ȭ��ȣ üũ
						COUNT(*) / COUNT(�÷�)
						--------	----------NULL�� ����
						null�� ����
				MAX / MIN
				---- �ڵ� ���� ��ȣ �̿� => SEQUENCE 
				
				SUM / AVG
				---- ����/ ���
				=> GROUPING / CUBE / ROLLUP
				
			GROUP BY�� ���� ��� => 
				������, �����Լ��� ���� ����� �� ����
		
		3) ���� / �������� => ������Ʈ(�ݵ�� SQLDeveloper)
			�ڹ� => "" (LIKE ���常 ����) '%A%'
				=> ����Ŭ : '%'||?||'%'
				=> MYSQL : CONCAT('%',?,'%') => MariaDB
		
			���̺��� 2�� �̻󿡼� ������ ����
				= INNER JOIN (������)
					= EQUI_JOIN (=)
					= NON_EQUI_JOIN (= �ܿ� �ٸ� ������ : �� ������, BETWEEN)
					����)
						����Ŭ ����
							SELECT A.col, B.col
							FROM A, B
							WHERE A.col = B.col
							
						ǥ�� ����(ASHI JOIN) => MySQL MSSQL
							SELECT A.col, B.col
							FROM A JOIN B
							WHERE A.col = B.col
					=======> SELECT A.col
							 FROM A
							 INTERSECT    
							 SLEECT B.col
							 FROM B
							
				= OUTER JOIN (������ �� �ٸ� ������)
					= LEFT OUTER JOIN
						����Ŭ ����
							SELECT A.col, B.col
							FROM A, B
							WHERE A.col = B.col(+)
							
						ǥ�� ����(ASHI JOIN) => MySQL MSSQL
							SELECT A.col, B.col
							FROM A LEFT OUTER JOIN B
							WHERE A.col = B.col
					=======> A INTERSECT  B AND A MINUS B	
							
							
					= RIGHT OUTER JOIN
						����Ŭ ����
							SELECT A.col, B.col
							FROM A, B
							WHERE A.col(+) = B.col
							
						ǥ�� ����(ASHI JOIN) => MySQL MSSQL
							SELECT A.col, B.col
							FROM A RIGHT OUTER JOIN B
							WHERE A.col = B.col	
					=======> A INTERSECT  B AND B MINUS A
				UNION / UNION ALL / INTERSECT / MINUS
				���� ������
				A 1,2,3,4,5
				B 4,5,6,7,8
				A UNION B 		==> 1,2,3,4,5,6,7,8
				A UNION ALL B 	==> 1,2,3,4,5,4,5,6,7,8
				A INTERSECT B 	==> 4,5
				A MINUS B 		==> 1,2,3
				B MINUS A		==> 6,7,8
							
			SQL ���� 2�� �̻� �����ϴ� ���� : ���� ����
				���� ����
					= ������ ���� ���� (�÷� 1��, ��� �� 1��)
						�� �ַ� ����ϴ� ������ : �� ������
							SELECT * 
							FROM table_name
							WHERE �÷� ������(SELECT ~) 
											------- ��� �� 1�� , ���̺� �ٸ� ��쵵 �ִ�
										|
									�� ������
									
					= ������ ���� ���� (�÷� 1�� , ��� �� ������
						�� IN : ��ü ����
						
						�� ANY / ALL => MAX,MIN
							SELECT * 
							FROM table_name
							WHERE �÷� ������(SELECT ~) 
											------- ��� �� ������
											| IN => ��� �� ��ü ����
											| ANY(SOME)
												> ANY(10,20,30) => MIN(10)
												< ANY(10,20,30) => MAX(30)
											| ALL	
												> ALL(10,20,30) => MAX(30)
												< ALL(10,20,30) => MIN(10)
												
					= ���� �÷� ���� ���� (�÷� ������, ��� �� 1��)
						���� ���� ���� �ַ� ��� (���󵵰� ���� ����)
				----------------------------WHERE 
				��Į�� ���� ���� : �÷� ��� ���
								---------- �ݵ�� ��� ���� 1�� 
					SELECT �÷�,(SELECT ~)
								--------- ��� ���� 1��, �ٸ� ���̺��� ����
					FROM table_name
						=> ���� ��� ��� / ������ ���� �� ���
						
						=> �̹� SQL������ ������ �� ��� 
							= �ٸ� ���̺��� �߰������� ������ ����
							= ��������
							
						=> FUNCTION�� ���� ó���� ��쵵 �ִ�
						
				�ζ��κ� : ���̺� ��� ��� (����)
					SELECT *
					FROM (SELECT ~)
						=> TOP-N : 1������
				
		4�� 
			=> CREATE / DROP / TRUNCATE / RENAME / ALTER
			=> DML(INSERT, UPDATE, DELETE)
		
			DML : ������ ���� => �� ������ => CRUD
				1) ������ ���� : INSERT
					= ��ü ������ ����
						INSERT INTO table_name VALUES(��, ��...)
													---------------
													��� �÷� �� ����
													����
													���� => "
													��¥ => ���� ��¥�� �ƴ� ���
														'YY/MM/DD'
														SYSDATE
														
						ps.setString(1,vo.getName()) => �ڵ����� 'ȫ�浿'
						����Ŭ������ ���� : COMMIT 
						�ڹٿ����� �ڵ����� COMMIT�� �ȴ� (autocommit())
						=>  INSERT / INSERT / INSERT / INSERT / INSERT ...
						
						=>  conn.setAutoCommit(false)
							INSERT / INSERT / INSERT / INSERT / INSERT
							conn.commit()
							
					=  ���ϴ� �����͸� ���� = NULL�� ���, DEFAULT ����
							INSERT INTO table_name(�÷�, �÷�,�÷� ...)
							VALUES(��, ��, ��...)
		
				2) ������ ���� : UPDATE
					UPDATE table_name
					SET �÷� = ��, �÷� = ��....
						�÷� - SYSDATE
					[WHERE ����] => ���� ��쿡�� ��ü ����
				3) ������ ���� : DELETE
					DELETE FROM table_name
					[WHERE ����] 
				------------------------------------------
				COMMIT ���� => ROLLBACK�� �ȵȴ�
			---------------------------------------------------
			DDL : ���� ���
				TABLE : ���� ����
				VIEW : �������̺�
				SEQUENCE : �ڵ� ���� ��ȣ
				SYNONYM : ���̺� ��Ī
				FUNCTION / PROCEDURE / TRIGGER
				-------------------------------- ����Ŭ : OBJECT
				TABLE
					1. ��������
						=> ���� => �ѱ� (�ѱ��ڴ� 3byte)
							CHAR(1~2000byte) : ���� ����Ʈ (���ڼ��� ���� ���)
							VARCHAR(1~4000byte) : ���� ����Ʈ(���ڼ��� ���� �޸𸮰� �޶�����)
							CLOB : 4�Ⱑ(����)
						=> ���� => NUMBER : ����/ �Ǽ� NUMBER(8,2)
									 NUMBER(2,1)
						=> ��¥ => DATE, TIMESTAMP
								  ----- �⺻
								  
					2. ����ȭ�� ������ => vlfdygks epdlxjaks cjaqn
						=> NOSQL (���� ���, ElasticSearch)
						=> ���� ����
							= �̻����� ����(����, ����)
								= �ߺ��� ���� ������ ���� = �⺻Ű (������)
									: ���Ἲ => PRIMARY KEY
								= �ܺ� ������ ���� = �ܷ�Ű, ����Ű
									: ���� ���Ἲ => FOREGIN KEY
								= NOT NULL  : ���� �ݵ�� ����
								= UNIQUE : �ߺ��� ���� ��(NULL ���)
									=> PRIMARY KEY ��ü��
								= CHECK : ������ ���� ����
								= PRIMARY KEY : NOT NULL + UNIQUE
									=> ���̺� �ݵ�� �Ѱ� �̻��� ���� = �⺻Ű
							
								=FOREIGN KEY : �ٸ� ���̺��� ������ ����
						���̺�			
							1) ������ ����
							2) �������� ����
							3) ��������
						-------------------------
						����)
							���̺��
								1) �ѱ� / ���ĺ� => ��ҹ��� ������ ����
									������ ����Ŭ�� ����(�빮�ڷ� ����)
									user_tables : PRIMARY KEY(�ߺ��� �Ǹ� �ȵȴ�)
								2) ���ڼ��� 30����(byte) (10����)
								3) Ű����� ��� ���� (SELECT, INSERT ...)
								4) ���� ����� ����(�� �ڿ� ���)
								5) Ư������ (_) => 5~10��
								
								CREATE TABLE table_name(
									�÷��� �������� [��������]
													--------- ������ ������ ����
													------ DEFAULT / NOT NULL
															-------	---------
															   1		2
									�÷��� �������� [��������]
									�÷��� �������� [��������]
									[��������],
									[��������]
								);
								���������� ��� / ����
								CREATE TABLE table_name(
									id VARCHAR2(20) PRIMARY KEY,
									name VARCHAR2(50) NOT NULL
									...
								);
								
								=> ���������� �����ϱ� ��ƴ�
								
								=> ���������� �̸� �ο�
									�Ѱ��� ���̺� ����
									---------------user_constraints : �ߺ� ���� ����
									table��_�÷�_nn, _pk...
								=> 	CONSTRAINT table��_�÷�_nn NOT NULL
									CONSTRAINT table��_�÷�_pk PRIMARY KEY(�÷�)
									CONSTRAINT table��_�÷�_ck CHECK(�÷� IN(","))
									CONSTRAINT table��_�÷�_uk UNIQUE(�÷�)
									CONSTRAINT table��_�÷�_fk FOREIGN KEY(�÷�)
									REPERENCES ���� ���̺� (�÷�)
									
								=> FOREIGN KEY
									���� ���� ���̺� ���� => ���߿� ���� �ϰ� �ִ� ���̺� 
									�����ÿ��� �ݴ��
						--------------------------------------------------------------
						= ���� : ALTER = ����
							= �÷��߰�
							ALTER TABLE talbe_name ADD likecount NUMBER DEFAULT 0
												�÷��� �������� [��������|DEFAULT]
							
							= �÷� ����
								ALTER TABLE table_name DROP COULMN �÷���
							= �÷� ����
								ALTER TABLE table_name MODIFY �÷��� ��������
																	--------
							= �÷��� ����
								ALTER TABLE table_name 
								RENAME COULMN old_name TO new_name
							= ALTER �ַ� �����Ͱ� �Է��� �ִ� ��쿡 �ַ� ���
							= ���� ����	
							
						= ���̺� ����
							DROP TABLE table_name : ���� ����
						= �����͸� ����
							TRUNCATE TABLE table_name : ���̺��� ����, �����͸� ����
						= RENAME 
							RENAME  old_name TO new_name
					---------------------------------------------------------------
					3) 	SEQUENCE : �ڵ� ���� ��ȣ
						CREATE SEQUENCE table��_�÷���_seq
							START WITH => ���� ��ȣ
							INCREMENT  BY => ����
							NOCACHE	=> �̸������ϴ� ���� ���� ���
							NOCYCLE => �������̸� �ٽ� ó������ ������ ������
						�ʱ�ȭ => DROP�� ���
						���� : DROP SEQUENCE seq��
						
					4) VIEW : 	������ �ʿ�, SQL ������ ����
								����
								= ������ ���̺��� �����ؼ� ���� ���� ���̺�
						1. ����
							�ܼ��� : ���̺� �Ѱ� ����
								DML�� ����
								------------- �丸 ����Ǵ� ���� �ƴ϶�
												�����ϴ� ���̺� ����
								=> ���̺� ������ ����(JOIN, SUBQUERY)
								
							���պ� : ���̺� ������ ����(JOIN, SUBQUERY)
								=> SQL ������ �ܼ�ȭ => �����Ŀ� ����
								
							�ζ��κ� : ���̺� ��� SELECT ���
								=> user_view�� ���� : SQL���常 ����ȴ�
						2. ����
							CREATE VIEW view_name
							AS
								SELECT ~~ (������ ����)
								-------------JOIN / SUBQUERY / GROUP BY...
						3. ����
							CREATE OR REPLACE VIEW view_name
							AS	
								SELECT~
						4. ����
							DROP VIEW view_name
							
						5. ���� VIEW�� �����ϸ� ����� ���� ����
						
					5)INDEX : �˻��� ���� (����ȭ)
						����)
							CREATE INDEX index�� ON table��(�÷��� (ASC | DESC))
							CREATE INDEX index�� ON table��(�÷���,�÷���)
							=> �˻� / ����
								INDEX_ASC() / INDEX_DESC()
							���� ����ϴ� �˻�� �ִ� ���
								=> ������ ���� ��쿡�� ������� �ʴ´�
								=> �����Ͱ� ���� ���
							JOIN���� ����ϴ� �÷��� �ִ� ���
							NULL���� ���� �����ϴ� �÷��� �̿�
							INSERT / UPDATE / DELETE�� ���� ��쿡�� �ӵ� ����
								=> REBUILD�� ����ؼ� ó��
								
						����) 
								DROP INDEX index��
						rownum(222page)
							=> ����Ŭ �����ϴ� ���� �÷�(SQL���忡���� ���)
							=> row���� ��ȣ�� �Է�
							=> ��ȣ�� �ߺ��� ����
							=> SQL�������� ROWNUM�� ���� ���� = �ζ��κ�
							=> � / ������ ���
							=> top-N : ���������� �
								----- ��ø �����Ű
							
							
					
							
							
*/
/*
select * from menupan_food
ORDER BY fno ASC;
*/

-- select /*+ INDEX_ASC(menupan_food mf_fno_pk)*/ * from menupan_food;
-- REGEXP_LIKE => LIKE ���
-- �̸��߿� '��'�ڸ� �����ϴ� ��ü�� ���
/*
SELECT name
FROM menupan_food
WHERE name LIKE '%��%';
*/
/*
SELECT name
FROM menupan_food
WHERE REGEXP_LIKE(name, '��');
*/
/*
SELECT name
FROM menupan_food
WHERE name LIKE '��%';
*/
/*
SELECT name
FROM menupan_food
WHERE REGEXP_LIKE(name, '^��');
*/
/*
SELECT name
FROM menupan_food
WHERE name LIKE '%�� ';

SELECT name
FROM menupan_food
WHERE REGEXP_LIKE(name, '�� $');
*/








