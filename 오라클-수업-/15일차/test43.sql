-- 2025 09 22 : ����Ŭ ���� / SQL Ʃ�� / �� ���߽� �ʿ��� SQL 

/*
    1. SQL Ʃ�� : SQL ���� �ӵ��� ����ȭ
        ��  database�� ����� �����͸� ȿ�������� ���
		�� ���� �ð� ����: ������ ������ ����ǵ��� ����
		�� �ý��� �ڿ� ����: CPU, �޸�, ��ũ I/O ��뷮 �ּ�ȭ
		�� ���� ����� ó�� ���: ���� ����ڰ� ���ÿ� �̿��� ���� �������� ���� ����.
    
	�� ���ʿ��� �÷��� ������� �ʴ´�
        SELECT * FROM table_name(X)
        SELECT �÷� ���� ....
        
    �� DISTINCT / UNION => ��� => �ּ�ȭ
                 ------ UNION ALL
	
	�� WHERE �� ���� �ּ�ȭ
		WHERE SUBSTR (name, 1,3) = 'ABC' (X)
		WHERE name LIKE 'ABC%'
		OR��� UNION ALL / IN
	
	�� ORDER BY �ּ��Ѹ� ��� => �ʿ�ÿ��� ���
	   ---------- INDEX
	  
	�� Ʃ�� ���
		�� 1. ��ȿ������ SQL ����: ���ʿ��� ����, �ߺ��� ����, �������� ���� ��
		�� 2. �ε��� Ȱ�� ����: ������ �ε����� ���� Ǯ��ĵ �߻�
		�� 3. ��� ���� ����: ��Ƽ�������� �߸��� ���� ��ȹ�� �����ϴ� ���
		�� 4. ������ �𵨸� ����: ���̺� ���� ������� ��ȿ����
	  
	�� Ʃ�� ���
		1. ���� ��ȹ Ȯ��: EXPLAIN, AUTOTRACE ���� ����� DB ��Ƽ�������� ������ ���� ��� �м�
		2. SQL ���� ����: ���ʿ��� �÷� ����, ���� ���� ����ȭ, ���������� �������� ��ȯ ��
		3. �ε��� ����ȭ: ������ �ε��� ����, ������� �ʴ� �ε��� ����
		4. ��Ƽ������ ��Ʈ ���: ��쿡 ���� ��Ƽ�������� �ùٸ� ��ȹ�� �����ϵ��� ��Ʈ ����
		5. ������ ���� ����: ��Ƽ�Ŵ�, ����ȭ/������ȭ, ĳ�� ���� ����
	 
	  
	2. INDEX Ȱ�� �߽�
		��) �˻���� ���� ��� (Food => title , type)
		�� ������ ���̽� ����
		�� SEQUENCE / INDEX
		JOIN���� ���� ���Ǵ� FK / PK �÷�
		�� WHERE ���忡�� ���� �����ϴ� ���� ����

	3. JOIN
		�� �����Ͱ� ���� ���̺��� ���� ���̺�� ��ġ
		�� emp / dept => dept�� �տ� ������
		=> �ε����� �ɸ� �÷����� JOIN
		=> ���� �������� JOIN ����
		=> �ҷ��� �� => IN
		=> �ٷ��� �� => EXISTS
		
	4. ���� / ���� ����
		�� GROUP BY / HAVING ����ȭ
		1) WHERE���� ���� �����͸� ���� => GROUP BY
		2) ���������� JOIN
		
	5. ORDER BY => ��Ʈ INDEX / INDEX_ASC INDEX_DESC
		
		
	----------------------------------------------------------------------
	SQL ���� ����ȭ => �����ȹ �м� => �ε��� ����
	=> JOIN / ���� ����ȭ = DB ȯ�� ����
	3�� / 4�� => DDL / DML
	5�� => INDEX
	6�� => DB ����
	7�� => ����ȭ
	8�� => Ʈ�����
	-----------------
	1�� ~ 8�� : �⺻ ���� => ����ó��
	=> java.lang / java.util / java.io / java.sql
											|
										  Connection / PrepareStatement / ResultSet
		   |		   | 		   | ���ϰ���		 
								   | FileInputStream / FileOutPutStream
								   | FileReader / FileWriter
								   | BufferReader
					StringTokenizer / Date / Calendar
					Collection
						| List (ArrayList)
						| Map (HashMap)
		String / Object / Math / Wrapper (Integer , Double, Boolean)
		=> ��ü ���� ���� => ~VO / ~ DAO / IO / Open API
		
		�ڹ� + ����Ŭ : HTML / CSS / JavaScript
					   -----------------------
					   ȭ�� UI
					   �ӵ� / ȭ�� ����
					   ----------------
						AJAX(Jquery) / VueJS / ReactJS
						
	����Ŭ(3��)
		SQL ����
		---
		 = DQL : ������ �˻� => SQL Ʃ��
			SELECT => executeQuery()
			
		 = DML : ������ ���� => �߰� / ���� / ���� => TCL�� �ݵ�� �ʿ�
			INSERT / UPDATE / DELETE => executeUpdate()
											�� Ŀ���� ����
											
		 = DDL : ���� ��� => ���̺� ���� / �� ���� / ������ ���� / ��
							 �Լ� / ���ν��� / Ʈ����
			CREATE / ALTER / DROP / RENAME / TRUNCATE
			
		 = DCL : ���� �ο� / ���� ����
			=> ���� : System, / sysdba
			GRANT / REVOKE
			
		 = TCL : ������ ���� / �������� �� / ��� ���� ó��
					COMMIT 		ROLLBACK 	SAVEPOINT
		
		1) SELECT ����
			����) 
				SELECT (DISTINCT|*) *| column_list
										�� �ʿ��� �÷� ����
				FROM table_name | view_name | SELECT ~ 
					 ----------------------------------
					 1) View �̿�
					 2) SELECT ~ => �ζ��κ� (����, ROWNUM)
				[
					WHERE ���� : �ʿ��� �����͸� ����
					GROUP BY �׷� �÷� : �׷캰 ����
					-------------------------------
								1) ����������
								2) ������ ������
					HAVING �׷� ���� : GROUP BY�� �ִ� ��쿡�� ���
					ORDER BY ���� �÷� / �Լ�
					---------- �����Ͱ� ���� ��쿡 �ַ� �ε����� ���
					
				]
			Ʃ��) 146page
				=> Book(bookid(pk), bookname, publisher, price)
					å����
				=> Customer (custid(pk), name, address, phone)
					�� ����
				=> Orders(orderid(pk), custid(fk), bookid(fk),
							saleprice, orderdate)
								|
								���� ���̺�
									N : 1
								-------------
								|			|
				Customer ==== Orders ==== Book
					|			|
					-------------
						1:N
		
				1) ���� (3-1)
					��� ������ �̸��� ������ �˻�
					SELECT * FROM book;
					�� ���̺��� ��� �÷��� ��� ���� ��ȸ
						�� FULL TABLE SCAN �߻�
					�� ���̺��� �����Ͱ� ���� ���� I/O ������ �δ� ����
					�� �÷��� ������ => �����Ͱ� ũ�� ��Ʈ��ũ ���۷��� ��������
				
				������(HTML / CSS) <========= �ڹ� <============ ����Ŭ
					|							|					|
					|							---------JDBC--------
					|							|
					----------------------------- JSP
				= Ʃ��
					=> SELECT bookid, bookname, publisher
						FROM book
					=> I/O ����, 
					-------------- ��Ʈ��ũ �ӵ� ���
			=> �䱸���� �м�
					|
				�����ͺ��̽� ����
					|
				������ ����
					|
				ȭ�� UI
					|
				   ����
					|
				  �׽�Ʈ
					|
				   ����
		
				2) ���� ( 149page)
					WHERE ���� ��
					= 	������
						�� ������
						�� ������ : AND / OR
									 && : Scanner
									 || : ���ڿ� ����
									
						BETWEEN ~ AND : ���� => üũ�� / üũ �ƿ�, ����¡
										| MySQL => LIMIT
						IN : OR�� ������ �ִ� ���
							=> ���� ���� (MyBatis) => ����
						NOT : ���� => NOT IN, NOT BETWEEN, NOT LIKE
						LIKE : ���� ���ڿ� �˻�
								REGEXP_LIKE()
						NULL : ������ NULL�� ��쿡�� ���� ó���� �ȵȴ�
								IS NULL / IS NOT NULL
						1) 	SELECT *
							FROM book
							WHERE price > 2000;
							= ��ü ��ĵ => * : �÷� ����Ʈ
							= ���ʿ��� ���� ���� �� �ִ�
							  -----------
								=> �ε��� Ȱ�� ����
							CREATE INDEX idx_book_price ON book(price);
							DROP INDEX idx_book_price;
							SELECT * => �ε��� Ȱ���� ��ƴ�
						= �÷� ����Ʈ�� �̿�
						= ���� �˻����� ���Ǵ� �÷��� �ִ� ��� : �ε���
						
						EXPLAIN PLAN FOR
						SELECT * FROM book;
						
						SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());
							
						TABLE ACCESS FULL
						=> INDEX RANGE SCAN
						=> �ڵ� ���� / �����丵
							
						EXPLAIN PLAN FOR
						
						SELECT bookid, bookname, price
						FROM book
						WHERE publisher = '�½�����';
							
						SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());
							
						CREATE INDEX idx_book_publisher ON book(publisher);
							
						=> BETWEEN ~ AND
						10000�̻� ~ 20000�� ����
						SELECT bookid, bookname, publisher, price
						FROM book
						WHERE price BETWEEN 10000 AND 20000;
							  ------ �÷� (Index)
						
						-- WHERE price >= 10000 AND 20000
						-- �˻� / ���ǿ��� ���� ���Ǵ� �÷�
						DESC menupan_food;
							
							
					IN ������ => 151page
					--------------------
					3-6 
						���ǻ� �� ������ / ���ѹ̵��
							   --------------------
							   OR / IN
						SELECT bookid, bookname, publisher, price
						FROM book
						WHERE publisher ='�½�����' OR publisher = '���ѹ̵��';
						
						=>IN
							SELECT bookid, bookname, publisher, price
							FROM book
							WHERE publisher IN('�½�����' , '���ѹ̵��');
						
							=> foreach => 

							=> ���߰� �� (IN)
							=> �ε��� Ȱ��
							IN ���ΰ��� ���� ��� => �����δ� OR���� ��ȯ �� ó��
							=> �̷л����δ� �̷� ��쿡 �ӵ��� ������

						LIKE : ���� ���ڿ� ã��
						-----------------------
						=> name LIKE '%��%' => �ε��� ���� x
						=> name LIKE '��%' => �ε��� ���� x
						=> REGEXP_LIKE(name,'��')
						
						WHERE address LIKE '%����%'
							OR address LIKE '%����%'
							OR address LIKE '%����%'
							OR address LIKE '%ȫ��%'
						WHERE REGEXP_LIKE(address, '����|����|����|ȫ��')
						
					152page
					LIKE
						SELECT bookname, publisher
						FROM book
						WHERE bookname LIKE '�౸�� ����';
						
						SELECT bookname, publisher
						FROM book
						WHERE REGEXP_LIKE(bookname, '�౸�� ����');
						=> ���� �����ڸ� ����Ѵ�
						
						153page LIKE
						= % => ���ڿ� ���̸� �𸣴� ���
						= _ => ���� 1����
						
						%������% => �ε��� ���� x
						������% => �ε��� ����
						_������% => �κ������� �ε���
						_�տ� ������ ����
						
						SELECT bookname, publisher
						FROM book
						WHERE bookname LIKE '%�౸%';
						
						SELECT bookname, publisher
						FROM book
						WHERE bookname LIKE '�౸%';
						
					=> �ε��� Ȱ�� => ���� ���ڿ�
					=> REGEXP_LIKE => �߰��� ����
					
					1) �ε��� Ȱ��
					2) �÷��� ��¿� �ʿ��� �÷��� ����
					3) OR�� ���� ��쿡�� IN ���ÿ� �ӵ��� �ʴ�
					4) LIKE => ������% => startsWith ���
					
					=> TALBE ACCESS FULL
					=> INDEX RANGE SCAN
					
					
					�ٽ�)
						Ʃ�� : SQL ���� �ӵ��� ����ȭ
						=> SELECT�� ���İ� ����
						=> ���� => ������
						=> BETWEEN / IN / NOT / NULL / LIKE
						=> SELECT�� �ٽ�
							JOIN / SUBQUERY / �����Լ�
						
						-----------------------------------
						JOIN : ������ ���� (�������� ���̺�κ���)
							= INNER JOIN(������) => ���� ��, ���Ե� ��
								= null ���ִ� ��쿡�� ����
								= EQUI_JOIN
								= NON_EQUI_JOIN
								
							= OUTER JOIN(������ + MINUS)
								= LEFT OUTER JOIN
								= RIGHT OUTER JOIN
								
						SUBQUERY : SQL ������ ����
							= SUBQUERY : WHERE�� ���ǿ� �ش�Ǵ� ��
								= ���� �� : �� ������
								= ���� �� : IN/ANY/ALL
											  ---------MIN/MAX
								
							= INLINE VUE : ���̺� ��� ���
											FROM �ڿ�
							
							= ��Į�� �������� : �÷� ��� ���
												SELECT �ڿ�
						
						=> ���� �Լ� : SELECT 
						
						
						
						
						
						
						
*/