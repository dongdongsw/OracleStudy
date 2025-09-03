-- 2025-09-03 ���� �Լ�

/*
	1. ���� /���� ���� / ������ / �����Լ� => ���� ���̺�
		���� ���̺� : ���� , �������� => SELECT
		1) SELECT ������ ����
			������ => ����Ŭ�� ��û (������ ����) => 142 page
			�ڹ�(jdbc) = Mybatis = JPA) ===> ����Ŭ
								<=== 
								���� ��� ResultSet(�޸� ����)
				|
			    �ܼ�
			   ������, ������

			��SELECT => ����Ŭ ������ �˻�(����)�� ��û => ���ڿ�
			SELECT *(��ü) | column_list (ȭ�� ��� �κ�)
			FROM table_name
			[
				WHERE => ���ǿ� �´� �����͸� ����
						-------------------------------������
				GROUP BY => �׷캰 ��� ���, ��� ó�� ==> ������ ���
				HAVING => GROUP BY�� �ִ� ��쿡�� ���(�׷� ����)
				ORDER BY => ���� (�ֽ� ������ => DESC)
				------------- �ܼ��� ������ => ������ ���� ���(INDEX)
			}
			WHERE ���� ��� => ������
				��� ������ : + , -, *, / (���� / ���� = �Ǽ�)
						�� ��� ����
						�� ���ڿ� ���� ||
						�� '100' + 1 = 101
							�� �ӵ��� �ʴ�
						�� TO_NUMBEER('100') + 1
				�� ������ : =, !=(<>), <, >, <=, >=
				�� ������ : AND(���� ����), OR (���� ������ �ȵ� ����)
				BETWEEN ~ AND : �Ⱓ , ���� >= AND <=
									   ---------------- ����
				=> ������ : ������ (���ڿ�, �̹���)
				IN : OR�� ���� ���
				NULL : �÷� ���� NULL�� ��� => ����ó���� �ȵȴ� ( ��� �� : NULL)
					  �÷� = null => IS NULL
					  �÷� != null => IS NOT NULL
				NOT : ����
					 NOT IN, NOT BETWEEN, NOT LIKE
				LIKE : % : ������ ������ ���� , _ : �ѱ���
					�÷� LIKE 'A%'
					�÷� LIKE '%A'
					�÷� LIKE '%A%' =>  �ַ� �˻�
				------------------------------------------------------------------------------------
				
				���� �Լ� 
					�� ROW ���� ó��(������ �Լ�)
						�� ���� �Լ�
							�� ���� ���� : LENGTH(�÷���)
							
							�� ���� �ڸ��� : SUBSTR(�÷���, ������ġ, ����)
								�� �ڹٴ� ���ڿ� ��ȣ 0
								�� ����Ŭ�� 1��
								
							�� ���� ã�� : INSTR(�÷� | ���ڿ�, ã�� ����, ������ġ, ���°)
								�� �ڹ��� indexOf, lastIndexOf �� ����
								
							�� ���ڰ� ���� ��쿡 �ٸ� ���� ��ü : RPAD(, )
								�� ID ã��
								
							�� �ٸ����ڷ� ��ü &, || : REPLACE
							
						�� ���� �Լ�
							�� MOD : ������ => MOD(10,3) => 10 % 3
							
							�� ROUND : �ݿø� => ���
										ROUND(�Ǽ� , �ڸ�)
										
							�� CEIL : �ø� => ��������
									CEIL(�Ǽ�) => ���� => �Ҽ����� 1�̻�
						�� ��¥ �Լ�
							�� SYSDATE : �ý����� ��¥ / �ð� 
										�����
										
							�� MONTHS_BETWEEN : �ش� �Ⱓ�� �޼�
									MONTHS_BETWEEN(�ֱ�,����)
									
						�� ��ȯ �Լ� 
							�� TO_CHAR : ��¥, ���� => ���ڿ�ȭ
										 ----
										YYYY (RRRR) / MM / DD
										HH(HH24) / MI / SS
										DY => ����
										
						�� ��Ÿ
							�� NVL => NULL�� ��ü�ؼ� ���
									  NVL(�÷���, ��ü��)
										=> �÷��� : ���������� ����
										=> �÷� : VARCHAR2 => ���ڿ�
												  NUMBER => ����
												  DATE => ��¥��
					�� �÷� ��ü ����  (���� �Լ�, ���� �Լ�) => ���
						1. COUNT => ROW�� ����
							�� COUNT(�÷���) => NULL�� ����
							
							�� COUNT(*) => NULL�� ����
								�� �α��� (ID���� ����)
								�� �˻����
								�� ���̵� �ߺ� üũ
								��ٱ��� ����� Ȯ��
								
						2. MAX / MIN => ��ü ����� �ִ�/�ּ�
						
						3. AVG : ��ü ����� ���
						
						4. SUM : ��ü ����� ���� => ����
						
						5. RANK() : ���� ���� => DESC / ASC
							�� RANK() OVER(ORDER BY �÷� ASC|DESC) => ��� ���
								1
								2
								3
								4
								
							�� DENSE_RANK() OVER(ORDER BY �÷� ASC|DESC) => �뷡, ��ȭ
								1
								2
								2
								3
								
					�������Լ��� ���ÿ��� �÷�, ������ �Լ��� ����� �� ����.
					�� �÷��� ����� ���� GROUP BY�� ����ϸ� �����ϴ�
		
*/
-- emp�� �ִ� �ο� Ȯ�� COUNT
-- null���� �����ϰ� ����
/*
SELECT COUNT(*) "���ο�", COUNT(mgr) "����� �ִ� ���",COUNT(comm) "������"
FROM emp;
*/

-- emp �ȿ� �޿��� ���� ���� �޴� ���, ���� ���� �޴� ���
-- MAX / MIN => MAX�� �ڵ� ���� MAX + 1 => SEQUENCE
/*
SELECT MAX(sal) "���� ���� �޴� ���", MIN(sal) "�������� �޴� ���"
FROM emp;
*/

-- emp���� �޿��� ��� / ����
-- AVG(�÷���) / SUM(�÷���)
/*
SELECT ROUND(AVG(sal)), SUM(sal)
FROM emp;
*/

-- �μ���ȣ�� 10�� => �޿� ���� / �޿� ��� / ���� ���� �޿� / ���� ���� �޿� /�ο�
/*
SELECT SUM(sal), AVG(sal), MAX(sal), MIN(sal), COUNT(sal)
FROM emp
WHERE deptno = 10;

SELECT SUM(sal), AVG(sal), MAX(sal), MIN(sal), COUNT(sal)
FROM emp
WHERE deptno = 20;

SELECT SUM(sal), AVG(sal), MAX(sal), MIN(sal), COUNT(sal)
FROM emp
WHERE deptno = 30;
*/

-- �ѹ��� ó�� ����
/*
SELECT SUM(sal), AVG(sal), MAX(sal), MIN(sal), COUNT(sal)
FROM emp
GROUP BY deptno;
*/

-- emp���� ����߿� �޿��� ��պ��� ���� �޴� ����� ��� ���� ���
/*
SELECT ROUND(AVG(sal))
FROM emp;

SELECT * 
FROM emp
WHERE sal < 2073;
*/


SELECT * 
FROM emp
WHERE sal < (SELECT ROUND(AVG(sal)) FROM emp);






















