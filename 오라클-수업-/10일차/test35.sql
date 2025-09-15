-- 5�� => ������ ���̽� ������ / �����ͺ��̽� ����(DAO) / �� ������ (JSP)

/*

	5�� => PL/SQL : PROCEDURE�� ����� ���
					=> ����� SQL
	1. ���� ���� / �Ű�����
		��Į�� ���� : ���������� ���Ƿ� ����
			no NUMBER, name VARCHAR2(20)
			
		TYPE : ���� ���̺��� �÷� ���������� �б�
			fno menupan_food.fno%TYPE
			empno emp.empno%TYPE
			
		ROWTYPE : VO�� ���� => ���̺� �÷� ��ü ���������� �ѹ��� �б�
			emp emp%TYPE
				---- emp�� ������ �ִ� ��� �÷��� �������� �б�
				���� : emp.empno, emp.ename...
				���� : �Ѱ��� ���̺� ����� ��
				
		RECORD : ����� ���� (������ ���̺��� ����ϴ� ���)
				| ��������, ����
				TYPE type�� IS RECORD(
					���� ��������,
					���� ��������
					...
				)
				
		CURSOR : ������(ROW�� �������� ���)
		
	2. ���
		�ݺ���
			LOOP : do~while
				LOOP
					�ݺ����๮��
					EXIT ���� ����
				END LOOP;
				=> LOOP;
				=> do
					{
						�ݺ� ���๮��
					}while(���ǽ�)
			WHILE
				WHILE���� LOOP
					�ݺ� ���� ����
				END LOOP;
				=> while(���ǹ�)
				{
					�ݺ� ���� ����
				}
			FOR
				FOR���� IN lo..hi LOOP
					�ݺ� ���๮��
				END LOOP;
				=> 1 ~ 10
					FOR i IN 1..9 LOOP
						��� ����
					END LOOP;
					
				=>	9 ~ 1
					FOR i IN REVERSE 1..9 LOOP
						��� ����
					END LOOP;
				-------------------�Ϲ� for
				for - each
				FOR ����  IN CURSOR LOOP => for(MovieVO vo:list)
					���� ���
				--------------------- ���� ���� ���
				for(let vo in �迭) / for(let vo of�迭)
				map() / forEach()
				--------------------- �ڹٽ�ũ��Ʈ�� for��
		����
			�����
			
			������
			
			���� ó����
			
			DECLARE
				���� ���� => c��� ���� => �ݵ�� ���� ������ ó���� �Ѵ�
				=> ���� ����ÿ� �ʱⰪ�� :=
				=> ��) no NUMBER:=0;
				
			BEGIN
				���� => INSERT / SELECT / UPDATE / DELETE
				EXCEPTION
					WHEN exception�� ���� THEN => catch
							ó������
							NO_DATA_FOUND
					WHEN OTHERS THEN => ��Ÿ
					
			END;
			/ 
			
			DECLARE : �͸�
			----------------
				CREATE [OR REPLACE] FUNCTION func_name(�Ű�����...)
				IS
				BEGIN
					EXCEPTION
				END;
				CREATE [OR REPLACE] PROCEDURE pro_name(�Ű�����...)
				IS
				BEGIN
					EXCEPTION
				END;
				CREATE [OR REPLACE] TRIGGER tri_name
				[AFTER|BEFORE] ���� ON table��
								-- INSERT / UPDATE / DELETE
				FOR EACH ROW
				IS
				BEGIN
					EXCEPTION
				END;
				
				���� : 	DROP FUNCTION func_name
						DROP PROCEDURE pro_name
						DROP TRIGGER tri_name
						
	3. FUNCTION
		=> �������� ������ �ִ� �Լ� : �����Լ�
		=> ROW���� ���� ó��
		=> SubQuery, JOIN => ������ ���� �ִ� ���� �ݺ��Ǵ� ��
			CREATE OR REPLACE FUNCTION fun_name(�Ű�����)
			RETURN NUMBER (VARCHAR2,DATE)
			IS
				��������
			BEGIN
				ó��
				RETURN ��
			END;
			/
			=> ��� ��ġ
				SELECT �ڿ� : �÷� ���
				WHERE �ڿ� : �÷� ��� ��� | ��
				GROUP BY / ORDER BY
				=> �������� �ʴ� �Լ� => ����� �Լ�
				=> ��� ���α׷� ����� ���� (��������, �Լ�, �޼ҵ�)
					|class : record, cursor
				=> ����� ���ǰ� ���� ���α׷� : HTML/CSS
				________________________________________________________
				
				=> SELECT �߽�
	4. PROCEDURE : ��ɸ� ó�� : DML ��ü ����� ����
					�������� ����
		����) 
			CREATE OR REPLACE PROCEDURE pro_name(�Ű�����...)
			IS
			BEGIN
				EXCEPTION
			END;
			�Ű����� 
				= SQL�����ϴ� ���� => IN (����)
					pNum NUMBER => IN
						=> INSERT / UPDATE / DELETE / WHERE
				= ���� �޴� ���� => OUT
					pNum OUT NUMBER => C���(������)
						=> INTO ���� ���, :=
						=> Call By Reference : �迭 / Ŭ����
						=> int*p ==> &p => �޸� �ּҿ� ���� ä���
						=> C��� / ����Ŭ => �Ϲ� ������ �ּҸ� ������ �ִ�
						=> SELECT����
				= SQL�� ���� + ���� �޴� ���� => INOUT
					pNUM INOUT NUMBER
				WHERE empno = pEmpno
							  ----------IN / INOUT
	5. TRIGGER : ���ϱ� = ���� : �������� ���� ����
		| ��� (IF/CASE)
		
	1. �����ͺ��̽� ���� : 
		���� === �� === ���ϱ�
			      fno	  id