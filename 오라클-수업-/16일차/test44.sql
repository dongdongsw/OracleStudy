 /*
   ���� / �������� => ����ȭ (SQLƩ��)
   
   SQL Ʃ�� ����
   
   1) ���ʿ��� JOIN ����
   
   2) JOIN ���� ����ȭ
      => ���� ���� -> ū ����
         emp / dept => ���� ���� (��Ʈ)
		 
   3) �ε��� ���
   = ���� ���� => �Ѱ� �̻��� ���̺��� �ʿ��ѵ����� ���� 
					=> ����ȭ�ϸ� ���̺��� �и��ȴ�
					
      INNER JOIN => ���� null ���� �ִ� ��쿡�� ����
					=> ���� : OUTER JOIN
					
      = EQUI_JOIN : = ������ (������)
         SELECT A.col, B.col
         FROM A, B
         WHERE A.col=B.col;
         
         SELECT A.col, B.col
         FROM A JOIN B
         ON A.col=B.col
		 
      = NON_EQUI_JOIN : = �ƴ� ������ =>  ����
		SELECT A.col, B.col
         FROM A, B
         WHERE A.col BETWEEN B.col AND B.col;
         
		 
		 JOIN�� ��쿡�� �ش� ROW��ü ���� ����
		 JOIN => �׻� �÷����� �ٸ� ��쵵 �ִ�
		 ���� �÷��� ������ �ִ� ���
		 
		 => NATURAL JOIN (�ڿ�����)
			SELECT clol1,col2 ..... => �����ڰ� ������Ѵ�
			FROM A NATURAL JOIN B
			
		 => JOIN ~ USING
			SELECT col1,col2
			FROM A JOIN B
			USING(�����÷�)
			
	OUTER JOIN : null�� ����
	= LEFT OUTER JOIN
		SELECT A.col, B.col
		FROM A, B
		WHERE A.col = B.col(+)
		
		SELECT A.col, B.col
		FROM A LEFT OUTER JOIN B
		WHERE A.col = B.col

	= RIGHT OUTER JOIN
		SELECT A.col, B.col
		FROM A, B
		WHERE A.col(+) = B.col
		
		SELECT A.col, B.col
		FROM A RIGTH OUTER JOIN B
		WHERE A.col = B.col

 */
 
 -- ���� (emp, dept)
 /*
 SELECT empno, ename, job,hiredate, sal, dname, loc, emp.deptno
 FROM emp, dept
 WHERE emp.deptno = dept.deptno;
 */
 /*
	�ĺ���
		���̺��.�÷���
		��Ī.�÷���
 */
 /*
 SELECT empno, ename, job,hiredate, sal, dname, loc, e.deptno
 FROM emp e, dept d
 WHERE e.deptno = d.deptno;
 
 SELECT empno, ename, job,hiredate, sal, dname, loc, emp.deptno
 FROM emp JOIN dept
 WHERE emp.deptno = dept.deptno;
 
 SELECT empno, ename, job,hiredate, sal, dname, loc, deptno
 FROM emp  e NATURAL JOIN dept d;
 
 SELECT empno, ename, job,hiredate, sal, dname, loc, e.deptno
 FROM emp  e JOIN dept d USING(deptno);
 */
 
 
 /*
	fro(EmpVO e : Emp){
		for(DeptVO d : Dept){
			if(e.deptno == d.deptno){
			
				������ ���
			
			}		
		}	
	}
*/
	
	Ʃ�� (���� ������ - ū������ ��)
--	SELECT /* + LEADING(emp,dept) USE_NL(dept)*/
--	e.empno, e.ename,d.dname
--	FROM emp e, dept d
--	WHERE e.deptno = d.deptno;
	
/* 
	LEADING(emp,dept) => ���� ���� emp-> dept ����
	USE_NL(dept) : dept���νÿ� Nested Loop�� ���


*/
	
	
-- ���� ����(���� + �Ϲ� ����)
-- deptno = 10 => empno, ename,job,hiredate,dname, loc
--�߸��� ����
SELECT empno, ename,job,hiredate,dname, loc
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE d.deptno = 10;

-- ���� ���� => ���͸��� ���� ����
SELECT empno, ename,job,hiredate,dname, loc
FROM (SELECT * FROM dept WHERE deptno=10) d
JOIN emp e ON e.deptno = d.deptno;


-- dept => ��ü Ǯ ��ĵ => emp�� ���ʿ��� JOIN �߻�
 /*
	for(int i = 0; i < arr.LENGTH-1; i++){
	
	}
 
 */
 
 /*
	SELECT empno, ename, dname
	FROM emp
	JOIN dept ON emp.deptno = dept.deptno
	WHERE deppt.loc LIKE '%NEW%';
	
	-- �ε�������
	SELECT empno, ename, dname
	FROM emp
	JOIN dept ON emp.deptno = dept.deptno
	WHERE deppt.loc LIKE 'NEW%';
	
	-- LOOP ���̱�
	SELECT empno, ename, dname
	FROM (SELECT deptno, dname FROM dept
			WHERE loc LIKE 'NEW%') d
	JOIN emp ON emp.deptno = d.deptno;
 */
 
 /*
	���� ���� ��� => ���� ���
	------------ ������ ���� ���� => ����
				 --------------- �ζ��� ��
	
	���ο� ����ϴ� �÷��� �ε��� ó��
	=> ��Ʈ : ������ / ū��
			nested Loop / Hash JOIN
	=> �м�
 */
 
 -- ���� => GROUP BY / HAVING
 /*
 SELECT empno, ename, sal ,dname 
 FROM emp
 JOIN dept ON emp.deptno = dept.deptno
 WHERE dept.deptno IN (
	SELECT deptno
	FROM emp
	GROUP BY deptno
	HAVING AVG(sal) >= 2000
	)
 */
 
 -- ���� ���� => �μ��� �׷��� �� emp�� �ι� ����
 -- �ߺ�
 -- LOOP�� ������ ����
 /*
 SELECT empno, ename, sal, dname
 FROM (SELECT deptno
		FROM emp
		GROUP BY deptno
		HAVING AVG(sal) >= 2000) v
JOIN emp e ON e.deptno = v.deptno
JOIN dept d ON e.deptno = d.deptno;
 
 */
 
 -- ROWNUM => �����Ͱ� ���� ��쿡�� ����¡ ó��
 -- CI / CD : ThymeLeaf = .jar / jsp = .war
 -- �޿��� ���� ���� �޴� ���ã��
 -- ���, �̸� , �޿�, �μ���, �ٹ���
 SELECT empno, ename, sal, dname, loc
 FROM emp
 JOIN dept ON emp.deptno = dept.deptno
 WHERE sal = (SELECT MAX(sal) FROM emp);
 
 -- MAX(sal) => emp ��ü���� �˻� (Ǯ��ĵ)
 -- emp�� �ι� ����
 /*
	int[] sal = {10,20,30,40,50,60,70,80,90}
	int max = sal[0]
	for(int i = 0; i<sal.length; i++){
		if(max<sal[i]){
		
			max= sal[i];
		}
	}
 */
 
 -- ORDER BY empno, ename, sal, dname, loc
 SELECT empno, ename, sal, dname, loc
 FROM (SELECT empno, ename, sal, dname, loc
	FROM emp
	JOIN dept ON emp.deptno = dept.deptno
	ORDER BY sal DESC)
WHERE rownum;
 
 -- Full Scan�� ����
 -- �μ��� �ο� �� + ��� �޿� ���
 -- �μ���ȣ, �μ��� �ο� �� ��� �޿�
 
 SELECT deptno, dname, COUNT(empno) AS cnt,
	AVG(sal) AS avg
 FROM dept
 JOin emp ON dept.deptno = emp.deptno
 GROUP BY dept.deptno, dname;
 
 -- dept : �Ҽ��� ���� �μ��� �ִ�
 -- emp���� �����ϴ� �μ� => ����
 -- ���ʿ���  JOIN���� => ���� ����
 
 SELECT /*+ USE_HASH(emp,dept) */ 
	dept.deptno, dname, COUNT(empno) "cnt",
	AVG(sal) "emp_sal"
FROM dept
LEFT OUTER JOIN emp ON dept.deptno = emp.deptno
GROUP BY dept.deptno,dname

/*
	�ζ��κ� => ���̺� ���� Ƚ���� ���� �� �ִ�
	������ ������ ���� => �ʿ�ÿ��� OUTER JOIN
	JOIN���� �ٸ� ������ ó��
	�ε��� Ȱ�� / ���� ��ȹ
	
		=> LIKE => �ε��� ���� => startWith
		=> GROUP BY => (���̺� ����) �ߺ��� �ּ�ȭ
						--------------------------  �ζ��� ��
		=> MAX / MIN => ���� ���� ��� ORDER BY => ROWNUM
		
		IN => EXISTS
			=> ���� ������ ������ ��� => JOIN
		
		
*/
-- ��ȿ���� (IN)
SELECT empno, ename, sal 
FROM emp
WHERE deptno IN(SELECT deptno FROM dept WHERE loc='NEW YORK');

SELECT empno, ename, sal 
FROM emp
WHERE EXISTS(SELECT 1 
	FROM dept 
	WHERE  dept.deptno = emp.deptno AND 
	loc='NEW YORK');
	-- full  ��ĵ�� �ȵǰ� �Ѵ�
	-- IN => NULL ���� ��쵵 �ִ�
	-- EXISTS => NULL���� ���� ������
	
	/*
		IN VS EXISTS 
		��ȿ���� : ���� �˻� / FULL scan
		���� : EXISTS => �ε���Ȱ��
		���� ���� => JOIN => �ݺ� ����
		MAX => ROWNUM��  �̿��ؼ� ���� ��ĵ 
		NOT IN => NULL ���� / FULL scan => ANSI JOIN : ���� / ���� ����
	
	*/
	
/*
	���� ����
		�� sql ������ ����
		�� MainQuery = (SubQuery) => �ݵ�� ()�� ����
		
		= �������� : ���� ������ ���
			�� ������ ���� ���� : �÷� 1, ��� �� 1 
			�� ������ ���� ���� : �÷� 1, ��� �� ������
			�� WHERE �ڿ�
			�� ���� �÷� �������� : Ŀ�� ������ , ����� 1
			
		= ��Į�� ���� ���� : �÷� ��� ���
			�� Ʃ�� => ��Į�� �������� ������ => �ѹ��� ����(JOIN)
			�� SELECT ~  (SELECT ~) ��Ī...
			�� FUNCTION ó��
		= �ζ��� �� : ���̺� ��� ���
			�� SELECT ~ 
				FROM (SELECT ~ )
				=> ����¡ ���
	

*/

-- ��� �߿� ��� �޿����� ���� �޴� ����� �̸�, �޿�, �Ի���

SELECT AVG(sal) FROM emp;
-- �������� => DML ����� ����
-- JOIN => SELECT������ ����� ����

SELECT ename,sal, hiredate
FROM emp
WHERE sal < 2073;

SELECT ename,sal, hiredate
FROM emp
WHERE sal < (SELECT AVG(sal) FROM emp);

-- ���������� ��� ������ (10,20,30)
/*
	��ü�� ���� : IN
	ANY(SOME)
	> ANY(10,20,30) => MIN => 10 ����
	< ANY(10,20,30) => MAX => 30 ����

	ALL
	> ANY(10,20,30) => MAX => 30 ����
	< ANY(10,20,30) => MIN => 10 ����



*/

SELECT DISTINCT deptno FROM emp;

SELECT empno, ename, job, hiredate, sal, 
(SELECT dname FROM dept WHERE deptno = emp.deptno) "dname",
(SELECT loc FROM dept WHERE deptno = emp.deptno) "loc",
FROM emp;



SELECT empno, ename, job
FROM (SELECT * FROM emp);


/*
	�����Լ�
	DDL => �������� ȿ���� ����
	DML => INSERT / UPDATE / DELETE

	VIEW / INDEX 
	=> �����ϰ� ERD
*/



