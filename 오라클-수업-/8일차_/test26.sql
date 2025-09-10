-- 224page ���� ���� => ���� / ��������
/*
	���� : SELECT ���忡���� ����� ����
	���� ���� : SELECT, INSERT, UPDATE, DELETE
	--------
	1) WHERE �ڿ� => ���� �˻���
	------------ ���� ����
		= ������ ���� ���� : ���� ���� ��� ���� 1���� ���
		= ������ ���� ���� : ���� ���� ��� ���� ������ ���
		10
		20
		30
		=> ��ü ó�� => IN
		=> �Ѱ� ó�� => MIN / MAX
						ANY / ALL
						> ANY(10,20,30) => �ּҰ� 10
						< ANY(10,20,30) => �ִ밪 30
						 -------> SOME = ANY
						>  ALL(10,20,30) => �ִ밪 30
						<  ALL(10,20,30) => �ּҰ� 10
		= �����÷� ���� ���� : �÷��� �������� ���
		= ����
			SELECT * 						=> 3
			FROM table_name					=> 1
			WHERE �÷��� ������ (��������)	=> 2
								--------
								
	���� vs ��������
	���� => ������ ����(���̺� 1�� �̻�)
	�������� => SQL�� ����
	--------------------- �ڹ� : ��Ʈ��ũ => �ִ��� ������ ���δ�
	1) ���� => 
	2) SQL ����
	3) ��� �� �б�
	4) �ݱ�
	1) ����
	2) SQL ����
	3) ��� �� �б�
	4) �ݱ�	
	1) ����
	2) SQL ����
	3) ��� �� �б�	
	4) �ݱ�
	
	--------------------------------------------------------
	2) SELECT �ڿ� : �÷� ��� ��� = ��Į�� ��������
	3) FROM �ڿ� : ���̺� ��� ��� = �ζ��κ�(����)
										|�� 
	
						��Į�� ���� ���� 					�ζ��� ��
	�����ġ		SELECT, WHERE , HAVING, ORDER BY		FROM
	��� �� 					���� ��					  	������, ���� �÷�
	�뵵(���ó)				���, ���� ��				�ӽ� ����, join, GROUP BY, ���͸�
	Ư¡ 				   ������ 1:1					�ܺο� ����, ��� �� �������̺� ����
	=> �� : ������ �� �� => SQL������ ����


	
*/	

-- 1. ��� �޿��� ��� �޿� ��(��Į�� ���� ����)	
/* 
SELECT ename, sal, (SELECT ROUND(AVG(sal)) FROM emp) as avg_sal
FROM emp
WHERE sal >(SELECT ROUND(AVG(sal)) FROM emp);
 */	


-- 2. myFood ���� ���� ��� ��ȸ
/* 
SELECT  ename, sal	
FROM emp
WHERE sal >= (SELECT MIN(price) FROM myfood) AND
	sal<= (SELECT MAX(price) FROM myfood);
 */	

-- 3. ��� �ִ� ���� => (�ζ��� �� + JOIN)
/* 
SELECT ename, sal, name, price
FROM emp
JOIN(SELECT * FROM myfood) mf
ON sal = mf.price;
 */
-- ���� ��� ��� / ���̺� ��� ��� => ����
/* 
SELECT ename,sal,dname,price
FROm emp JOIN dept
ON emp.deptno = dept.deptno
JOIN myFood
ON emp.sal = myFood.price;
 */	

/*
SELECT ename, sal, (SELECT dname FROM dept WHERE deptno = emp.deptno)
"dname",
	(SELECT DISTINCT price FROM myFood WHERE price = emp.sal) "price"
	FROM emp;
*/

-- �ζ��� �� => ���̺� ��� ���
-- ���� ���̺�
/* 
SELECT empno, ename, job, hiredate, sal
FROM (SELECT * FROM emp);	
 */
	
SELECT empno, ename, job, dname, loc
FROM (SELECT empno, ename, job, dname,loc	
	FROM emp,dept
	WHERE emp.deptno = dept.deptno);
	
	
	
	
	
	
	