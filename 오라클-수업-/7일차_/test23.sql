-- 4�� (SQL ���)

/*
	1. ���� �Լ� 
	-----------
		���ó :  SELECT �ڿ�, WHERE �ڿ�, GROUP BY , HAVING, ORDER BY
			�� �÷�ó�� ���
			�� ���ϰ��� ������ �ִ� 
			�� ������(ó�� ��� ��) / �Ű�����(������Է�)
				CREATE FUNCTION func_name(�Ű�����)
				RETURN ��������
				BEGIN 
					SQL ���� ó��
					RETURN ��
				END;
			�� �÷� ���� ó��, ROW ���� ó��
			   ------------- --------------
			   �����Լ�			������ �Լ�
			  
			  1) ������ �Լ�
					�� ���� ���� => �� : �ڹ� (String), ����Ŭ
						�� ���� �ڸ��� : SUBSTR(���ڿ�|�÷���,������ġ,����)
										�� ���� ���۹�ȣ : 1, �ڹ� : 0
										�� �ڹ�, �ڹٽ�ũ��Ʈ : substring()
										----------------------------------
											= AJAX / VUE / REACT => 
												�ڹٽ�ũ��Ʈ ���̺귯��
												
						�� ���� ��ġ ã�� : INSTR(���ڿ� | �÷���, ã�� ����, ������ġ, ���°)
											Hello Java => a
											�� indexOf / lasIndexOf ���� ó��
											
						�� ���� ��ü : RPAD => ���̵� ã��
									  RPAD(���ڿ�, ��� ����, ��ü����)
									  RPAD('ADMIN',10,'#')
									  => ADMIN#####
									  => AD***
									  
						�� ���� ���� : LENGTH(���ڿ�)
						
						�� ���ں��� : REPLACE(���ڿ�,ã�� ����, ���湮��)
									& => URL(�̹���) => | => ����			
									-- URL => ������ ����
									localhost/board.jsp?no=10^name=aaa
											
					�� ���� ���� => �ڹ�(Math)
						�� MOD : ������ MOD(10,3) => 10 % 3
						�� ROUND : �ݿø�
						�� CEIL : �ø� => ��������
						
					�� ��¥ ���� => �ڹ�(Calendar)
						�� SYSDATE : �ý����� �ð�, ��¥ => ������ó�� ���
						�� SYSDATE - 1(����) / SYSDATE + 1 (����)
						�� MONTHS_BETWEEN(�ֽ�, ����)
										SYSDATE,	hiredate
						
					�� ��ȯ => DecimalFormat / SimpleDateFormat
						�� TO_CHAR : ���ڿ� ��ȯ
							�� ����
								�� YYYY / RRRR, MM, DD, HH/HH24, MI, SS, DY
								�� 999,999,999
					
					�� ��Ÿ => �ڹٿ����� �������� �ʴ´�(NVL)
						�� NVL : null �� ��� �ٸ� ������ ��ü
						
			  2) ���� �Լ�
					�� COUNT : ROW�� ����
					�� MAX,MIN
					�� SUM : ��
					�� AVG : ���
					�� CUBE : ROW ���� ���
					�� ROLLUP : ROW, Column ���
					
	2. �������� => �ܰ躰
	
	3. �ε��� => �˻� ����ȭ / ����	
	
	5�� : ���α׷�
		1) PL/SQL => ����Ŭ ���α׷�
			=> FUNCTION / PROCEDURE / TRIGGER => ȣ��ȣ (ERP)
			
		2) JDBC
		
		3) �� ���ηα׷� : JSP (����)
		
	6�� : �����ͺ��̽� ���� (���� ����, �� ����, �������� => ������ ��)
	
	7�� : ����ȭ
	
	8�� : Ʈ�����
	
	---------------------------------
	
	9�� : ���� => ����, ���, ����
		=> 
		
		
		
		
		
		
		
		
		
*/ 







-- -- 2025-09-09 ROWNUM (222page) => ������ ������
-- /*
    -- ROWNUM
        -- ���� ������� �ٴ� ���� �÷� => SQL���忡���� ����� ����
        -- ����� ���� ROWNUM�� ��ȣ�� ����ȴ� (������)
        -- --- ORDER BY / ���� ���
        -- => DEFAULT => ����Ŭ���� ���� (SQL���� ���Ƿ� ������ ����)
-- */
-- SELECT empno, ename, hiredate, sal, job, ROWNUM
-- FROM emp;

-- SELECT empno, ename, hiredate, sal, job, ROWNUM
-- FROM (SELECT * FROM emp ORDER BY sal DESC);
-- -- ���ó : ������������, �α����, �������� 10��
-- -- TOP-N => ���� : �߰��� �ڸ� �� ����
-- /*
-- SELECT empno, ename, hiredate, sal, job, ROWNUM
-- FROM (SELECT * FROM emp ORDER BY sal DESC)
-- WHERE ROWNUM=2;
-- */
-- SELECT empno, ename, hiredate, sal, job, num
-- FROM (SELECT empno, ename, hiredate, sal, job, rownum as num
-- FROM (SELECT empno, ename, hiredate, sal, job
-- FROM emp ORDER BY sal DESC))
-- WHERE num BETWEEN 6 AND 10;

-- -- �ֽ� ����
-- SELECT empno, ename, hiredate, sal, job
-- FROM (SELECT empno, ename, hiredate, sal, job,
        -- ROW_NUMBER() OVER(ORDER BY sal DESC) AS RN
        -- FROM emp)
-- WHERE RN BETWEEN 6 AND 10;

-- -- CRUD : �Խ���
-- CREATE TABLE board(
    -- no NUMBER,
    -- name VARCHAR2(51) CONSTRAINT board_name_nn NOT NULL,
    -- subject VARCHAR2(4000) CONSTRAINT board_sub_nn NOT NULL,
    -- content CLOB CONSTRAINT board_cont_nn NOT NULL,
    -- pwd VARCHAR2(10)CONSTRAINT board_pwd_nn NOT NULL,
    -- regdate DATE DEFAULT SYSDATE,
    -- hit NUMBER DEFAULT 0,
    -- CONSTRAINT board_no_pk PRIMARY KEY(no)
-- );

-- CREATE SEQUENCE board_no_seq
    -- START WITH 1
    -- INCREMENT BY 1
    -- NOCACHE
    -- NOCYCLE;
    
-- INSERT INTO board(no, name, subject, content, pwd)
-- VALUES(board_no_seq.nextval, 'ȫ�浿', 'CRUD ����', 'INSERT/UPDATE/DELETE', '1234');


--



































