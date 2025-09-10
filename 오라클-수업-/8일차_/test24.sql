-- 222page (rownum) , ���� ����, �ó��, ������, �ε���

/*
	��ü ����, Ʃ��
		�� PL/SQL : FUNCTION, PROCEDURE, TRIGGER
		�� �����ͺ��̽� ���� / ����ȭ
	1. ROWNUM
		�� ���� �÷��� �ƴϴ�, ���� �÷� => �� ROW ��ȣ (����Ŭ ó��)
		�� ��� ���� ���� ������ ����
		�� ORDER BY, INDEX�� �̿��ϸ� ����
		�� �ַ� ���ó
		�� �α� ���� 10��, ����¡ ���
		�� ���ÿ��� SELECT, WHERE���� �ַ� ���
		

*/
/* 
SELECT empno, ename, job,hiredate, sal , ROWNUM
FROM emp;
 */


--rownum�� ���� ���� => �ζ��κ�
/* 
SELECT empno, ename, job, hiredate, sal, ROWNUM
FROM (SELECT * FROM emp ORDER BY sal DESC);
 */

-- ���� ���� ���Ǵ� ����
-- �α� ���� 5��
/* 
SELECT name, ROWNUM
FROM (SELECT name, hit, FROM food ORDER BY hit DESC)
WHERE rownum <=5;
 */
/* 
	rownum�� ����
	1. TOP-N : 1���� ~ ���ϴ� ���� ���
	   ------ �߰����� �ڸ� �� ����
	2. rownum�� ���� => ���� ���� ��� => ORDER BY
	
	
 */
-- ���� => sal ���� 6 ~ 10 => ����¡ ���
-- ��ø ���� ���� ���
-- 1. ���
/* 
SELECT empno, ename, job, num
FROM (SELECT empno, ename, job, rownum as num
FROM (SELECT empno, ename, job
FROM emp ORDER BY empno ASC))
WHERE num BETWEEN 6 AND 10;
 */
 -- 2. ���
 /* 
SELECT empno, ename, job
FROM (SELECT empno, ename, job, rownum as rn
FROM (SELECT empno, ename , job
FROM emp ORDER BY empno ASC) e
WHERE rownum <= 10
)
WHERE rn >= 10;
 */
 -- 3. ��� => ROW_NUMBER => 1���� �������� ��� => 12c
 /* 
 SELECT empno, ename, job
 FROM (SELECT empno, ename , job, ROW_NUMBER() OVER(ORDER BY empno) AS rn
 FROM emp)
 WHERE rn BETWEEN 6 AND 10;
 */

/*
	11. INSERT => rownum / rowid(�ε���)
	��ü ��ȣ ���� : SELECT rownum .... => ���� / ������ �󼼺��� �̵�
	���� N (TOP-N) : WHERE rownum <= N => �α� ���� / �޻��
	N���� N����  : rownum ���� ���� + BETWEEN N AND M
	���� �� ��ȣ ����(����) => ���� ���� �̿�
	�ֽ� �椲�� : ORW_NUMBER() => ����
*/

/*
	������ : SEQUENCE
	-----------------
	= ���������� ����, ���̺�� ���������� ������� �ʴ´�
	= ���� �д� ���
		���� �� : currval
		���� �� : nextval
	= PRIMARY KEY => 	�ߺ��� ������ �ȵȴ�
						�ߺ����� �ڵ� ���� ��ȣ ����
	= �ʱⰪ : START WITH
	= ������ : INCREMENT BY
	= CACHE : �޸𸮿� �̸� ���� ������ �Ŀ� ���
	= ��뷮 �����͸� INSERT�� ��쿡�� ������ ����
	  ------------ SELECT NVL(MAX(no)+1,1) FROM food
					MyBatis���� ���� ��ȣ
					<selectKey statement = ""> : �ڵ� ������ȣ
					@SelectKey
	= �Ӽ� ��
		START WITH => �ʱⰪ i = 1
		INCREMENT BY => ������ i++, i += 2
		MINVALUE 1
		MAXVALUE 100
		CACHE 20
		NOCACHE
		CYCLE => 10���� ���� => �ٽ� 1����
		NOCYCLE => 100
		������ �����ÿ� ������ ����(�ϰ����� �ƴϴ�)
		������ �ߺ��� �Ǵ� ��ȣ�� ����
*/

-- ���̺� ���� �Ѱ��� ���̺� ����
	
/* 
CREATE TABLE myFood(
fno NUMBER,
name VARCHAR2(30) CONSTRAINT mf_name_nn NOT NULL,
cate VARCHAR2(20) CONSTRAINT mf_cate_nn NOT NULL,
price NUMBER,
CONSTRAINT mf_fno_pk PRIMARY KEY(fno),
CONSTRAINT mf_price_ck CHECK(price >= 800 AND price <= 5000)
);
 */
-- �ߺ� ���� : user_sequence
-- => constraint : ���� ���� => user_constraints
/* 
CREATE SEQUENCE myfood_fno_seq
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 100
	NOCACHE
	NOCYCLE;
*/

-- ������ �̿� ��� => �ʱ�ȭ
-- ũ�Ѹ� => TRUNCATE / DROP SEQUENCE
/* 
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'���','�ѽ�',2500);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'���','�ѽ�',4000);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'����','���',5000);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'ġŲ','���',5000);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'¥��','�߽�',3000);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'���� ���','�ѽ�',800);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'�ʹ�','�Ͻ�',1990);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'�����','�ѽ�',1500);
COMMIT;
 */
 
/* 
SELECT myfood_fno_seq.currval FROM DUAL;

SELECT myfood_fno_seq.nextval FROM DUAL;
 */
 
/* 
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'�쵿','�Ͻ�',1800);
COMMIT;
 */


















