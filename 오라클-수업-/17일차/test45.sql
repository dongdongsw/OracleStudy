-- ���� �Լ� / DML => view , sequence / DDL
-- 1�� ������Ʈ : ������ ��� (����, CRUD, �帧)
/*
	���� �Լ�
	---------
	= ������ �Լ� : ROW ���� ó��
		���� �Լ�
			�� UPPER / LOWER => �Լ� ��� INDEX
			�� SUBSTR : ���� �ڸ���
					=> �ּ� ��/�� => ������ ���� / ���...
					SUBSTR(���ڿ�/�÷�, �ڸ��� ������ġ, �����)
			�� INSTR : ���� ã��(���� ��ȣ)
					�� INSTR(���ڿ�/�÷�, ã�� ����, ������ġ, ���°)
					�� ����� ������ ������....
			�� RPAD : ��� ���� ���� ���� => ���ڶ�� ��� ������ ���� ���
					�� ad***
					�� RPAD(���ڿ�/�÷�, ����� ���, ��ü����)
					�� RPAD('hong', 10, '*')
					�� hong*******
			�� LENGTH : ������ ����
					�� LENGTH(���ڿ�) => �ѱ� / ���ĺ��� ����
					�� ��й�ȣ / �г��� => ����� �̻�
		���� �Լ�
			�� MOD : ������ ��
				�� MOD(10,2) => 10%2
			�� ROUND : �ݿø� => ���
				�� ROUND(�Ǽ�, �Ҽ��� �ڸ�)
				�� ROUND(�Ǽ�) => �Ҽ��� �����
			�� CEIL : �ø� => ��������
				�� CEIL(�Ǽ�)
				
		��¥ �Լ�
			�� SYSDATE : �ý����� �ð�/��¥
							�� ��� : ��� ����
							�� SYSDATE -1 / SYSDATE + 1
			�� MONTHS_BETWEEN : �Ⱓ�� ���� ��
								------------- LONG (�ð�, ��,  ��)
								ROUND
			=> �λ� ���� / ���� / ���� => ERP
			
		��ȯ �Լ�
			�� TO_CHAR : ����, ��¥�� ���ڿ� ��ȯ
			�� TO_DATE : ���ڿ� ��¥ ���·� ����
			�� TO_NUMBER : ���ڿ��� ���� ���·� ����
			�� SELECT * FROM emp WHERE empno='7788' => Ʃ�׽� �ӵ� ����
				�� TO_NUMBER('7788')
			�� SELECT * FROM emp WHERE TPCHAR(hiredate,'YYYY') = 1981
				�� �Լ��ȿ� ���Ե� �÷��� �ε����� ������ �ȵ�
			�� TABLE Full Scan
				SELECT * FROM emp WHERE hiredate BETWEEN TO_DATE('1981-01-01','YYYY-MM-DD')
				AND TO_DATE('1981-12-31','YYYY-MM-DD')
				1) ���ǹ�(WHERE)�ȿ��� �÷��� �Լ�(x)
				2) �ε��� �÷��� �ִ� ��� => �״�� ����ؾ��Ѵ�
				3) �Լ� ����� �ε���
					CREATE INDEX idx_hiredate ON emp(TO_CHAR(hiredate
		��Ÿ �Լ�
			�� NVL : NULL���� �ٸ� ��ü
				�� ������ ���� ��ġ�� �Ǿ� �Ѵ�
				NVL (comm, '����') => ����
					NUMBER VARCHAR2
				=> NVL(TO_CHAR(comm), '����')
				NVL(�÷�, ��ü��)
				=> NULL���� ����ó���� �ȵȴ�
				
	= ���� �Լ� : COLUMN ���� ó��
			�� COUNT : ROW�� ����
				=> ���� ����
			�� MAX / MIN =>  MAX�� �ڵ� ���� ��ȣ => SEQUENCE
			�� AVG / SUM
			�� RANK / DENSE_RANK => ����
			---------------------
			RANK 		DENSE_RANK
			1				1
			2				2
			3				3
			4				4
			----------------------------------------
			RANK() OVER(ORDER BY sal ASC) => �ڵ� ����
			CUBE / ROLLUP / GROUPING
			
	= GROUP BY�� ���� ���¿��� ���� ����� �� ����
	
	DML : ������ ���۾��
		�� CRUD
		1) SELECT : ������ �˻� => 75%
			SELECT * | column_list(Ʃ��) => 5
			FROM table_name | view_name | SELECT ~ => 1
			[
				WHERE ���ǹ� => 2
				GROUP BY �׷� �÷�|�Լ� => 3
				HAVING �׷� ���� => 4
				ORDER BY �÷� | �Լ� => 6
			
			]
		----------------------
		2) INSERT : ������ �߰�
			INSERT INTO table_name(�÷�.....)
			VALUES(��....) => default / null ���
			=> ��ü �߰�
			** ����,��¥ =-> ''
			''(null), '' (space)
		3) UPDATE : ������ ����
			UPDATE table_name
			SET �÷�=��, �÷� = ��....
			[WHERE ���ǹ�] => Ʃ��
		4) DELETE : ������ ����
			DELETE FROM table_name
			[WHERE ���ǹ�]
		----------------------------- ������ ����
		CRUD : �����ϰ� �ڹٷθ� ����
			   ------------
			   Servlet => JSP => MVC => Spring
				  |		  ---
				 ����	   |
						  view

*/

-- �Խ��� ���̺�
/*
CREATE TABLE web_board(
	no NUMBER,
	name VARCHAR2(51) CONSTRAINT wb_name_nn NOT NULL,
	subject VARCHAR2(2000) CONSTRAINT wb_sub_nn NOT NULL,
	content CLOB CONSTRAINT wb_cont_nn NOT NULL,
	pwd VARCHAR2(10) CONSTRAINT wb_pwd_nn NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	hit NUMBER DEFAULT 0,
	CONSTRAINT wb_no_nn PRIMARY KEY(no)
);
*/
/*
CREATE SEQUENCE wb_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCYCLE
	NOCACHE;

*/
/*
CREATE INDEX idx_wb_name ON web_board(name);
CREATE INDEX idx_wb_sub ON web_board(subject);
*/
-- CREATE INDEX idx_wb_cont ON web_board(content);			   
-- LOB => index�� ����� �� ����
/*			   
INSERT INTO web_board(no,name,subject, content, pwd)
VALUES(wb_no_seq.nextval,'ȫ�浿','CRUD/HTML�±�',
'�Խ���(CRUD) CREATE(INSERT) READ(SELECT) UPDATE DELETE','1234');			   
*/
/*
commit;

select * FROM web_board;			   
		
*/		

SELECT no, subject, name,regdate, hit, num			   
FROM (SELECT no, subject, name,regdate, hit, rownum as num			   
FROM (SELECT no, subject, name,regdate, hit
FROM web_board ORDER BY no DESC))
WHERE num BETWEEN 1 AND 10;

-- �ֱٿ� ���̴� ���
SELECT no, subject, name,regdate, hit
FROM web_board
ORDER BY no DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY; 			   
			   
			   
			   
			   
			   
			   

*/