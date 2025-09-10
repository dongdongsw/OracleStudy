-- �� (VIEW)

/*
	select /  sequence / view / SYNONYM / ps / sql(FUNCTION. PROCEDURE, trigger)
								------------------------------------------------
								���� ����
	select / update/ delete / insert							
		�� join / subquery
	--------------------------------------------�K���ͺ��̽� ���� �����
	VIEW	
		������ ���̺�κ��� �����͸� �����ϴ� ���� ���̺�
		���� �پ�� / SQL������ �ܼ�ȭ
		���� �����Ͱ� ����Ǵ� ���� �ƴ϶� SELECT ������ �����ϰ� �ִ�
		1. �ܼ� �� : ���̺� �Ѱ� ����
		2. ���� �� : ���̺� ������ ����(JOIN / SUBQuery)
		3. �ζ��� �� : FROM �ڿ� SELECT
		���� : DML�� ���� (INSERT, UPDATE, DEE
			   ------------------------------------
			   => �����ϴ� ���̺� ������ ����
		=> WITH CHECK OPTION / READONLY OPTIN (View => �б� ����
			   
			   
*/

-- ���պ�
/* 
conn system/1234
GRANT CREATE VIEW TO hr;
conn hr/happy
 */
/* 
CREATE VIEW emp_dept
AS
	SELECT empno,ename, sal, job, hiredate, dname, loc
	FROM emp, dept
	WHERE emp.deptno = dept.deptno;
	 */
	/* 
	1. �� => �������� ����
		���� �ο� : GRANT CREATE VIEW TO hr
		���� ���� : REVOKE CREATE VIEW FROM hr
		----------system/sysdba
	2. ���̺� 1���̻��� �����ؼ� ���Ӱ� ������� �������̺�
	
	3. ���� ����
		�ܼ� �� (���̺� �Ѱ� ����) => ���󵵰� ���� ����(���̺� ���)
			=> DML ����(INSERT, UPDATE, DELETE)
		---------View�� ����Ǵ� ���� �ƴ϶� ���� �����ϴ� ���̺� ����
		
		���� ��(���̺� 2�� �̻� ����) : JOIN / subQuery => ������ sQL�� ���� 
		�ζ��� ��
		
	4. ����
		= ���� => ���� ���̺��̶� ������ �ȵȴ�
			=> VIEW�� ���� �����͸� �����ϴ� ���� �ƴϴ�(SQL ���常 ����)
		= ���� : SQL ������ �����ϰ� �ֱ� ������ ����
		= ���������� ����� ����
		
	5. ���� ����(����)
		WITH CHECK OPTION = DML ���� (DEFAULT)
		WITH REAT ONLY = �б� ���� (SELECT)
		
	6. �� ����
		CREATE VIEW niew_name
		AS
		 SELECT ~~
		 
	7. ���� ����
		CREATE OR REPLACE VIEW view_name
		AS	
			SELECT ~
			
	8. ���� ����
		DROP View view_name
	
	������ SQL �� ��� => ��� ����� �Ǹ� View �� ���
	������ �ʿ��� �κ�
	-------------- Spring Security
	
	 */
	 
	 /* 
SELECT text
FROM user_views
WHERE view_name = 'EMP_DEPT';
 */

-- �ܼ��� : ���̺� �Ѱ��� ���� => DML�� ����
-- ���̺� ���� 
/* 
CREATE TABLE myDept
AS
SELECT * FROM dept;
 */
/* 
CREATE View myView
AS
SELECT * FROM myDept;
 */
/*
INSERT INTO myView VALUES(50,'���ߺ�','����');
COMMIT;
*/

-- �ܼ��� (�б� ����)
-- DROP VIEW myView;
/* 
CREATE VIEW myView
AS
	SELECT * FROM myDept WITH READ ONLY;
 */
/* 
INSERT INTO myView VALUES(50,'���ߺ�','����');
COMMIT;
 */
 /* 
DROP VIEW myView;
DROP TABLE myDept;
 */
-- ����
/* 
CREATE OR REPLACE VIEW emp_dept
AS
	SELECT empno, ename, job, hiredate,sal,dname,loc
	FROM emp,dept
	WHERE emp.deptno = dept.deptno;
 */
/* 
CREATE OR REPLACE VIEW emp_dept
AS
	SELECT empno, ename, job, hiredate,sal,dname,loc,grade
	FROM emp,dept,salgrade
	WHERE emp.deptno = dept.deptno
	AND sal BETWEEN losal AND hisal;
 */

-- �Ϲ� ���̺�� �����ϰ� ����̰���
-- ������ �ִ� ��
/* 
	CREATE OR REPLACE VIEW emp_view1
		AS 
		SELECT empno,ename, job, hiredate,sal,
			(SELECT dname FROM dept WHERE deptno = emp.deptno) "dname",
			(SELECT loc FROM dept WHERE deptno = emp.deptno) "loc"
		FROM emp
		WHERE MOD(empno,2) = 0;
		 */
		 /* 
	CREATE OR REPLACE VIEW emp_view1
		AS 
		SELECT empno,ename, job, hiredate,sal,
			(SELECT dname FROM dept WHERE deptno = emp.deptno) "dname",
			(SELECT loc FROM dept WHERE deptno = emp.deptno) "loc"
		FROM emp
		WHERE MOD(empno,2) = 1;
		
		SELECT * FROM emp_view1 ORDER BY empno DESC;
 */
		
-- ���� ��
/* 
	CREATE OR REPLACE VIEW emp_view2
		AS
		SELECT empno,ename, job, sal, hiredate, dname, loc, grade
		FROM emp JOIN dept
		ON emp.deptno = dept.deptno
		JOIN salgrade
		ON sal BETWEEN losal AND hisal;
 */
-- ���� / �׷�

	CREATE OR REPLACE VIEW emp_view3
	AS
	SELECT deptno, TO_CHAR(hiredate,'YYYY') "regdate", COUNT(*) "count",
		MAX(sal) "max_sal", MIN(sal) "min_sal",
		SUM(sal) "sum_sal", ROUND(AVG(sal)) "AVG_sal"
	FROM emp
	GROUP BY deptno,TO_CHAR(hiredate,'YYYY') 
	HAVING AVG(sal) > 2073
	ORDER BY deptno;
























