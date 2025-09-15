 -- index => PL/SQL
 /*
   DQL / DML => �� ������ ���
   = SELECT / INSERT / UPDATE / DELETE
      : JOIN / SubQuery
      ���� / ���� ����
   = DDL = CREATE / DROP / ALTER(ADD, MODIFY, DROP)
      |   TRUNCATE / RENAME
      | SEQUENCE (�ڵ� ��
      | VIEW
      | INDEX
	  
	DCL = GRANT / REVOKE 
	TCL = COMMIT /ROLLBACK / SAVEPOINT => 8��
	PL/SQL : FUNCTION / PROCEDURE / TRIGGER
	�����ͺ��̽� ���� => ����ȭ
	���α׷�(��) ����
	----------------------------------------
	1. JSP ������Ʈ : ȣ���� => �����ͺ��̽� ���
	2. Spring ������Ʈ : CI/CD => �ǹ��� �ش�
	3. ���� ������Ʈ : �ű��
		=> �����ɷ�
	----------------------------------------
	1) VIEW : ���̺� ���� (�ʿ��� �����͸� ���� �� ����)
						------------------------------- SELECT �������� ����
		�� �ϳ� �̻��� ���̺��� �����ؼ� ���� ���� ���̺�
		
		�� ������ �����͸� �����ϴ� ���� �ƴϴ�(SELECT����)
			�� SELECT text
			�� FROM user_views
			�� WHERE view_name = 'VIEW��(�빮��)'
			
		�� ������ ������ �ִ� ��� = SQL�� �ܼ�ȭ (����)
			�� �޸𸮿� ����(����)
			
		�� DML����� ����(����)
			�� �ܼ� �信���� ����� ����
			   --------- ���̺� �Ѱ� ����
			DISTINCT, GROUP BY, JOIN, �����Լ�, UNION

		�� ���
			DML ���� : WITH CHECK OPTION
				�� ���� �����ϴ� ���̺� ����
			DML �Ұ��� : WITH READ ONLY
		
		�� ���� ���
			CREATE VIEW view_name
			AS
				������ SELECT ����
				
		�� ���� ���
			DROP VIEW view_name
			
		�� ���� ���
			CREATE OR REPLACE VIEW view_name
			AS
				������ SELECT ����
				
		VIEW => ���� ���̺�ó�� ����� ����
		SELECT ~
		FROm (table_name | view_name|SELECT ~ )
		
		���� 
			�� SQL���� ���� (������ ������ �ܼ�ȭ)
			CREATE VIEW emp_view
			AS
				SELECT empno, ename, job, hiredate, sal, dname, loc, grade
				FROm emp, dept, salgrade
				WHERE emp.deptno = dept.dept.no
				AND sal BETWEEN losal AND hisal
			=> SELECT * FROM emp_view
		=> ���� ��ȭ (�÷��� ���ߴ� ���) : SQL Injection
			��ť�� �ڵ� (URL, username, password,�÷�, ���̺� = ���Ͽ� ����)
			
		����
			���� ���� �߻�(����ø��� ���� ���̺� ��ȸ)
			���ѵ� DML ���
			DML���� => ���� ���̺� ����
		----------------------------------------------
		2) �ε���(INDEX)
			= �����ͺ��̽� �˻� �ӵ��� ���
			= ������ ����(B - tree)
			1 2 3 4 5 6 7
			
		= å => �ε��� => Ư������ ������ ã�� �� �ְ� �����
		= ���� : SELECT �˻� �ӵ� UP
				���� ���  / ������ / ��ȭ / ���� => ũ�Ѹ�
				�˻��� ...
		= ���� : INSERT , UPDATE, DELETE => ���� ����
				�Խ���, ��� , ����, ����, ��ٱ���, ���ƿ�, ��...
				
			���ʿ��� �ε����� ���� ����
			LIKE => %A% %A => �ε��� ������ �ȵȴ�
					A%
					
					
		1) Ư¡
			1. �ڵ� ����
				PRIMARY KEY, UNIQUE �������� => �����ÿ� �ڵ�����
				
			2. ���� ���� : ��ü��, ��ȭ��, �帣...
				CREATE INDEX index�� ON ���̺��(�÷���)
				
			3. ���������� B-Tree ������ �Ϲ���	
				
			
				1) ���� �ε��� -> �÷� �Ѱ�
					CREATE INDEX index�� ON ���̺��(�÷���)
					CREATE INDEX index�� ON ���̺��(�÷��� DESC)
					
				2) ���� �ε��� -> �÷� �ΰ� �̻�
					CREATE INDEX index�� ON ���̺��(�÷��� DESC, �÷��� ASC)
					=> ���� �켱 ��Ģ
					=> (job ASC, deptno DESC)
					=> WHERE demptno > 10 => �ε����� ������ �ȵ�
					
					
				3) ���� �ε���
					=> �ߺ� ������� �ʴ� ��� : UNIQUE / PRIMARY KEY
					=> ���� 
						INDEX_ASC(���̺� ��, �ε��� ��)
						INDEX_DESC(���̺� ��, �ε��� ��)
						
				4) �Լ� ��� �ε���
					CREATE INDEX index_emp_ename ON emp(ename)
					SELECT * 
					FROM emp
					WHERE ename = UPPER('king') => ������ �ȵ�
					CREATE INDEX index_emp_ename ON emp(UPPER(ename))
					
			3)INDEX ��ɾ� => user_indexes
				CREATE INDEX idx_���̺��_�÷���
								----------------sequence / contraint / index
					
				=> �ε��� Ȯ��
					SELECT index_name, table_name, uniqueness
					FROM user_indexes
					WHERE table_name ='EMP';
					
				=> �ε��� �÷� Ȯ��
					SELECT index_name, table_name
					FROM user_ind_columns
					WHERE table_name ='EMP';					
					
				=> DROP INDEX �ε��� => ����
					
					
			4) ename �˻� �ӵ� ���
				CREATE INDEX idx_emp_ename ON emp(ename);
			
			5) ���� �ε���
				CREATE INDEX idx_emp_job_deptno ON emp(job,deptno DESC)
				SELECT * FROM emp WHERE job = 'CLERK'; //�ε��� ����
				SELECT * FROM emp WHERE job = 'CLERK' AND deptno = 20;
				//�ε��� ����
				SELECT * FROM emp WHERE deptno = 10; // �ε��� ������
				

			6) ����		
				DROP INDEX index��				
				
			7) �ε��� ���� ���� ��
				1. DML�� �ִ� ��� => ��������
				
				2. ���������� �Լ� / ���� => ��ȿ
					WHERE sal * 12 > 3600
					
				3. ���ϵ� ī�� �̿�ÿ� ���� => %
					WHERE ename LIKE '%SC' => �ε��� ���� �ȵ�
					WHERE ename LIKE 'SC%' => �ε��� ����
					
				4. �����Ͱ� ���� ��� => ȿ�� ����
				
				5. ���ʿ��� �ε��� ���� ����
					=> ���� ��� ���� / ���� ����
					
				=> 252page
					�ε��� ���� �ñ�
					1) �����Ǵ� ���� ���� ���(PRIMARY KEY)
					
					2) WHERE������ ���� �˻� �Ǵ� �÷��� �ִ� ���
					
					3) JOIN���� �ַ� ���Ǵ� �÷� (deptno)
					
					4) NULL���� �����ϴ� �÷��� ���� ���(COMM, bunji)
					
					5) INSERT / UPDATE  / DELETE ���� ���
						=> �ε��� ���� => rebuild => ��������
					
				=> �ڷḦ ����  ������ �˻��� �� �ְ� ���� ������ ����
									��Ʈ 8-Tree
									 | 
							-------------------
							|				  |	==> ���� ��Ʈ
						---------			-------------
						|		|			|			| ==> LeafRoot
					

					

*/

/*
SELECT index_name, table_name, uniqueness
FROM user_indexes
WHERE table_name ='EMP';
*/
/*
ALTER TABLE emp ADD CONSTRAINT emp_empno_pk PRIMARY KEY (empno);
*/
/*
SELECT index_name, table_name
FROM user_ind_columns
WHERE table_name ='EMP';	
*/

/*
CREATE INDEX idx_emp_ename ON emp(ename);

SELECT * FROM emp
ORDER BY ename ASC;

DROP INDEX idx_emp_ename;


SELECT * FROM emp
WHERE ename > 'A';

SELECT * FROM emp
WHERE ename = 'SCOTT';
*/


/*


CREATE INDEX idx_food_name ON food(name);

SELECT name FROM food
WHERE name = '�̳���';



*/


/*
	AAAStOAAHAAAAFeAAA
	AAAStOAAHAAAAFeAAB
	AAAStO AAH AAAAFe AAC
	------ --- ------ ---
	  6		3	  6    3
						�� ROW�� ������
				  �� ��� ��ȣ
			�� DataFile��ȣ
	  �� table(Number)  
	
*/
--����
/*
INDEX_ASC(���̺�� �ε�����) => �ø�����
INDEX_DESC(���̺�� �ε�����) => ��������

ON ���̺�(�÷�) ==> ORDER BY �÷� ASC
ON ���̺�(�÷� DESC) ==> ORDER BY �÷� DESC
ON ���̺�(�÷� DESC, �÷� ASC) ==> ORDER BY �÷� DESC, �÷� ASC
ORDER BY => ���
*/
	--��Ʈ ��� => "/*+ */"  --
/*
		+ INDEX(���̺�� �ε�����) => CREATE ��� ����� ����
		  ----------------------UNIQUE / PRIMARY KEY
		+ INDEX_ASC(���̺�� �ε�����)
		+ INDEX_DESC(���̺�� �ε�����)
----------------------------------------------------------------
INDEX ����		
	1) �˻��� ���� => ���� �ӵ�
	2) ���� ���
		����) �ε����� �����ϱ� ���� �޸� ������ �ʿ�
			  �� ���̺� �ȿ��� �ε����� ���� ��� ����Ŭ ������ �δ�����
				(4 ~ 5 ����)
				
	3) ����
		���̺� ROW�� ���� ��� (100000�� �̻�)
		WHERE => ���� ���Ǵ� �÷��� �ִ� ���
		�˻� ��� 2 ~ 5% �̻� �˻� => ���� ��ȣ �˻�
		JOIN���� ���� ���Ǵ� �÷�
		NULL�� ���� �÷�
		
		
*/

/*
SELECT index_name, column_name
FROM user_ind_columns
WHERE table_name ='FOOD';

ALTER TABLE food AND CONSTRAINT food_fno_pk PRIMAYY KEY(fno);

SELECT * FROM food ORDER BY fno ASC;



*/

-- SELECT /*+ INDEX_ASC(food food_fno_pk) */ *
-- FROM food;

-- SELECT --+ INDEX_ASC(food food_fno_pk)
-- 	*
-- FROM food;