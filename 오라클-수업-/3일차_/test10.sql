-- ���� �Լ� : column ���� (�����Լ�)
/*
	-- SQL ���� ���� ���� ���� => 144page
	-- SELECT ���� => 145page
	-- ������ => 149page
	-- ���� �Լ� => ������ �Լ� => 209page ~ 210page
	-- ���� => 211page
	-- ���� => 213page
	-- ��¥ => 216page
	-- ��ȯ => 218page
	-- NULL => 219page

	COUNT : row�� ����
			COUNT(*) / COUNT(column)
			--------	------------
			null����			null ����
	=> �α��� ���̵� ���� ����
	=> ���̵� �ߺ� üũ
	=> �˻� ����
	=> ��ٱ��� ����
	
	MAX : �ִ� => MAX(�÷���)
	=> �ڵ� ������ȣ
	=> �ߺ����� ������ ÷��(PRIMARY KEY)
	=> ��ȣ / ��¥(�����)
			  ----------- ����� �Է�(������, ����)
			  
	MIN : �ּҰ� => ���󵵴� ����
	
	SUM :  ���� / AVG : ���
	
*/

/*
SELECT COUNT(*)
FROM emp
WHERE empno = 8000;
*/

/*
SELECT COUNT(*)
FROM food
WHERE address LIKE '%����%';
*/

SELECT MAX(empno), MAX(empno) + 1
FROM emp;