-- ���� �Լ�
/*
	MOD : ������ MOD(10,2) = 10%2
	��ROUND : �ݿø� => ���
	TRUNC : ���� => ������
	��CEIL : �ø� => ��������


*/

-- SELECT MOD(5,2) FROM DUAL;
/*
SELECT empno, ename, sal, hiredate
FROM emp
WHERE MOD(empno,2) = 0
ORDER By empno ASC;
*/

--SELECT ROUND(123.56,1) FROM DUAL;
--SELECT ROUND(123.56,1), TRUNC(123.56,1), CEIL(123.56) FROM DUAL;
/*
SELECT CEIL(COUNT(*)/20.0) FROM food;
*/
-- ��¥ �Լ�
/*
	SYSDATE : �ý����� �ð� / ��¥ => �����
	MONTHS_BETWEEN : ������ ������
	ADD_MONTHS : �߰��Ŀ� ��¥
	ADD_MONTHS('25/07/21',6)
	NEXT_DAY(SYSDATE, 'ȭ')
	LAST_DAY(SYSDATE) => 30 
	LAST_DAY('25/08/25') => 31
*/

-- SYSDATE
/*
SELECT SYSDATE-1, SYSDATE, SYSDATE + 1
FROM DUAL;
*/
/*
SELECT ename, hiredate, sal, ROUND(ROUND(MONTHS_BETWEEN(SYSDATE, hiredate))/12) "month"
FROM emp;
*/
/*
SELECT SYSDATE, ADD_MONTHS(SYSDATE,5) FROM DUAL;
SELECT NEXT_DAY(SYSDATE,'��') FROM DUAL;
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT LAST_DAY('25/08/01') FROM DUAL;
*/
/*
	��ȯ �Լ�
		�ڹ��� �Լ� => ���� ��ȯ TO_CHAR()
		���� �Լ� => ���� ��ȯ TO_NUMBER() 1 + '1' = 2
		��¥ �Լ� => ��¥ ��ȯ TO_DATE()

		TO_CHAR : ���ڸ� ���ڿ��� ��ȯ
				100,000
				��¥ ��ȯ
				YYYY / YY (RRRR / RR)
				MM / M
				DD / D
				HH / HH24
				MI 
				SS
				DY : ����

*/

-- 2025�� 09�� 02�� => YY/MM/DD
/*
SELECT TO_CHAR(SYSDATE, 'YYYY"��" MM"��" DD"��"') FROM DUAL;
*/

/*
SELECT ename, TO_CHAR(hiredate, 'YYYY-MM-DD') "hiredate",
	TO_CHAR(sal, '$99,999') "sal"
FROM emp;
*/

/*
SELECT ename, TO_CHAR(hiredate, 'YYYY-MM-DD') "hiredate",
	TO_CHAR(sal, 'L99,999') "sal"
FROM emp;
*/

/*
SELECT TO_CHAR(SYSDATE, 'RRRR-MM-DD HH24:MI:SS')
FROM DUAL;

*/

-- DATE
/*
SELECT TO_NUMBER('100') FROM DUAL;

SELECT TO_DATE(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
-- TO_DATE�� üũ�� / üũ�ƿ� / ������
*/

/*

	��Ÿ
		��NVL (NULL ���� �� �ٸ� ������ ��ü
		NVL(�÷���, ��ü) => �÷��� null���̸� ��ü �ض�
		DECODE : switch
		Case(PL/SQL) : ���� if	

*/
/*
SELECT ename, hiredate, sal, comm
FROM emp;

SELECT ename, hiredate, sal, NVL(comm, 0) "comm"
FROM emp;

SELECT ename, hiredate, sal, NVL(comm, 0), sal + NVL(comm,0)
FROM emp;
*/

-- DECODE
/*
SELECT ename, job, hiredate, DECODE(deptno, 10, '������', 20, '���ߺ�', 30, '�ѹ���', 40, '����') dname
FROM emp;
*/

-- CASE
/*
SELECT ename, job, hiredate, CASE 
WHEN deptno = 10 THEN '������'
WHEN deptno = 20 THEN '���ߺ�'
WHEN deptno = 30 THEN '�ѹ���'
WHEN deptno = 40 THEN '����'
END "dname"
FROM emp;
*/
/*
	���� ���� : LENGTH , SUBSTR, INSTR, RPAD,  UPPER, REPLACE
	���� ���� : ROUND, CEIL
	��¥ ���� : SYSDATE, MONTHS_BETWEEN
	��ȯ ���� : TO_CHAR
	��Ÿ : NVL

	= ������
		�� ������
		�� ������
		BETWEEN ~ AND 
		IN 
		LIKE => NOT
	
	 = �ڹٿ��� ����Ŭ�� SQL ����

*/













