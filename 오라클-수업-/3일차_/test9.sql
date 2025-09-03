/*

����Ŭ (SELECT , ������ , �����Լ� ����)

Emp ���̺��� ���� ��� 
empno : ���
ename : �̸�
job    : ����
mgr   : �Ŵ��� (�����ȣ)
hiredate : �Ի��� 
sal   : �޿�
comm. : ������ 
deptno : �μ���ȣ 

    �� ���� : SELECT / ������ / ���� �Լ�
    
    145PAGE
    ����
     SELECT ALL(*) | �÷� ����Ʈ 
     FROM table_name(view_name|SELECT)
     [
        WHERE ���ǹ�
        GROUP BY
        HAVING 
        ORDER BY
        
     ]
    ��SELECT ���� : ������ ����
        = �÷� ��� ���  => ��Į�� ���� ����
        = table ��� ��� => �ζ��� ��
        = ���� �� ��� ��� => ��������
        
    ����
        SELECT
        FROM 
        WHERE
        
1. emp���� �޿��� 2000 �̻��� ����� ����ϼ���.
    SELECT * FROM emp WHERE sal >= 2000;

    ������ : ���ǿ� �´� ������ ����
    �������� : ���ϴ� �÷��� ����
    

2. emp���� �޿� sal�� 2000 �̻��� ����� �̸� ename�� ��� empno�� ����ϼ���.
    SELECT ename, empno
    FROM emp
    WHERE sal >= 2000;

3. emp���� �̸��� 'FORD'�� ����� ��� empno�� �޿� sal�� ����ϼ���
    1) ���� / ��¥ => ' '
    2) ��Ī => �÷� "��Ī", �÷� as ��Ī
    
    SELECT empno, sal
    FROM emp
    WHERE ename = 'FORD';

4. emp���� �Ի����� hiredate�� 82�� ���Ŀ� �Ի��� �����
   �̸��� �Ի����ڸ� ����ϼ���.
(��¥�� �������� YY/MM/DD���¸� ����ϸ�ȴ�.)

    SELECT ename, hiredate
    FROM emp
    WHERE hiredate >= '82/01/01';

5. emp���� �̸��� J�� ���� ����� �̸��� ����� ����ϼ���.
    LIKE => %J%
    
    SELECT ename, empno
    FROM emp
    WHERE ename LIKE '%J%';

6. emp���� �̸��� S�� ������ ����� �̸��� ����� ����ϼ���.

    SELECT ename, empno
    FROM emp
    WHERE ename LIKE '%S';

7. emp���� �̸��� �ι�° ���ڰ� A�� ���� ����� �̸��� ����� ����ϼ���.

    SELECT ename, empno
    FROM emp
    WHERE ename LIKE '_A%';


8. emp���� ���ʽ��� 300�̰ų� 500�̰ų� 1400�� �����
    �̸�, ���, ���ʽ��� ����ϼ���.

    SELECT ename, empno, comm
    FROM emp
    WHERE comm = 300 OR comm = 500 OR comm = 1400;
    
    SELECT ename, empno, comm
    FROM emp
    WHERE comm IN(300, 500, 1400);

9. emp���� ���ʽ��� 500���� 4000 ������ ����� �̸��� ���, ���ʽ��� ����ϼ���.

    SELECT ename, empno, comm
    FROM emp
    WHERE comm >= 500 AND comm <= 4000;

    SELECT ename, empno, comm
    FROM emp
    WHERE comm BETWEEN 500 AND 4000;
    
10. emp���� �μ��� 10�̰� ��å�� CLERK��
     �����̸�,���,��å(job),�μ�(deptno)�� ����ϼ���.

    SELECT ename, empno, job, deptno
    FROM emp
    WHERE deptno = 10 AND job = 'CLERK';

11. emp���� �Ի����ڰ� 82�� �����̰ų� ��å�� MANAGER�� �����
     �̸��� �Ի����ڸ� ����ϼ���.

    SELECT ename, hiredate
    FROM emp
    WHERE hiredate >= '83/01/01' OR job = 'MANAGER';
    
    SELECT ename, hiredate
    FROM emp
    WHERE SUBSTR(hiredate, 1,2) > 82 OR job = 'MANAGER';

    --��¥ ���� => SUBSTR

12. emp���� �μ���ȣ�� 10�� �ƴ� ������ ���,�̸�,�μ���ȣ�� ����ϼ���.
    
    SELECT empno, ename, deptno
    FROM emp
    WHERE deptno <> 10;
    
    SELECT empno, ename, deptno
    FROM emp
    WHERE deptno != 10;
    
    SELECT empno, ename, deptno
    FROM emp
    WHERE deptno ^= 10;
    
    SELECT empno, ename, deptno
    FROM emp
    WHERE NOT(deptno = 10);

13. emp���� �̸��� A�� ���� ������ ����� �̸��� ����ϼ���.
    
    SELECT empno, ename
    FROM emp
    WHERE NOT(ename LIKE '%A%');

14. emp���� ���ʽ��� 500���� 1400�� �ƴ� ������ ����� ���ʽ��� ����ϼ���.

    SELECT empno, comm
    FROM emp
    WHERE comm NOT BETWEEN 500 AND 1400;


15. emp���� �Ŵ����� ���� ���� �����̸��� ����ϼ���.
-- null���� is null�� ǥ���Ѵ�.

    SELECT ename
    FROM emp
    WHERE mgr IS NULL;

16. emp���� Ŀ�̼��� �޴�(Ŀ�̼��� null���� �ƴ�) �����̸��� Ŀ�̼��� ����ϼ���.

    SELECT ename, comm
    FROM emp
    WHERE comm IS NOT NULL AND comm <> 0;

17. emp���� ���, �̸�, �޿��� ����ϴµ� �޿��� ����������� ����ϼ���.

    SELECt empno, ename, sal
    FROM emp
    ORDER BY sal;
    
    SELECt empno, ename, sal
    FROM emp
    ORDER BY sal ASC;
    
    SELECt empno, ename, sal
    FROM emp
    ORDER BY 3;
    
     SELECt empno, ename, sal
    FROM emp
    ORDER BY 3 ASC;
    
18. emp���� ���, �̸�, �޿��� ����ϴµ� �޿��� ���� ������� ����ϼ���.

    SELECT empno, ename, sal 
    FROM emp
    ORDER BY sal DESC;
    
    SELECT empno, ename, sal 
    FROM emp
    ORDER BY 3 DESC;
    
19. emp���� ���, �̸�, �޿��� ����ϴµ� �̸��� ����������� ����ϼ���.

    SELECT empno, ename, sal
    FROM emp
    ORDER By 2 ASC;
    
    SELECT empno, ename, sal
    FROM emp
    ORDER By 2;
    
    SELECT empno, ename, sal
    FROM emp
    ORDER By ename ASC;
    
    SELECT empno, ename, sal
    FROM emp
    ORDER By ename;

20. emp���� ���, �̸�, �Ի����� ����ϴµ� �Ի����ڰ� �ֱ��� ������� ����ϼ���.

    SELECT empno, ename, hiredate 
    FROM emp
    ORDER BY hiredate DESC;
    
    SELECT empno, ename, hiredate 
    FROM emp
    ORDER BY 3 DESC;

    => ������ �ȵǴ� ������ => ũ�Ѹ� => ASC
    
    => ���� �����ϴ� ������ => DESC
        �Խ��� / ��� / ���� / ��ٱ���

21. emp���� ���, �̸�, �޿��� ����ϴµ� ���� �޿��� ���� ������
     �׸��� �̸��� ���� ������ �����ϼ���.

    SELECT empno, ename, sal
    FROM emp
    ORDER BY sal DESC , ename ASC;
    
    => ���� / �亯�� �Խ���(���� ���ϱ�)

22. ����̸��� ������ ����ϴµ�, �̸��� �÷����� employee��� �ϰ� ������ �÷����� salary��� �Ͻÿ�.

    SELECT ename "employee", sal "salary"
    FROM emp;
    
    SELECT ename as employee, sal as salary
    FROM emp;

24. ����̸��� �Ի����� ����ϴµ� ����̸��� �÷����� employee name���� ��µǰ� �Ͻÿ�. 

    SELECT ename "employee name", hiredate
    FROM emp;
    

25. ������ �ߺ����� ����Ͻÿ�.

    SELECT DISTINCT job
    FROM emp;
 
26. �μ���ȣ�� ����ϴµ� �ߺ������ؼ� ����Ͻÿ�.

    SELECT DISTINCT deptno
    FROM emp;

    => ���� ���� / �帣 => ��� => �Խ��� ���� / ��������
    => �ڹ� => HashSet
    => �⺻ : ��û �� => ���� (�ڹ�)
        ���� ��¹� => ����Ŭ
    => ��û = �ڹ� = SQL = ����Ŭ
            ------------
                |
                HTML
27.�����ȣ�� 7788���� ����� �����ȣ�� �̸��� ����Ͻÿ�.

    SELECT empno, ename
    FROM emp
    WHERE empno = 7788; => ��¥, ���� ' '
    => ������ ���� => ;�� ����Ѵ�
    => �ڹٿ��� ���۽ÿ��� ;�� �߰��ȴ� (;�� ����ϸ� �ȵȴ�)

28.������ 3000�� ������� �̸��� ������ ����Ͻÿ�.
 
    SELECT ename, sal
    FROM emp
    WHERE sal = 3000;

29. �̸��� scott�� ����� �̸��� ������ ����Ͻÿ�.
 
    SELECT ename, job
    FROM emp
    WHERE ename = UPPER('scott');
 
    => ����� �����ʹ� ��ҹ��ڸ� �����Ѵ�
        --------------------- ��й�ȣ => ��ҹ� Ư������ 8�ڸ� �̻�
    
30.������ 3000 �̻��� ������� �̸��� ������ ����Ͻÿ�.
 
    SELECT ename, sal
    FROM emp
    WHERE sal >= 3000;
 
31. ������ SALESMAN�� �ƴѻ������ �̸��� ������ ����Ͻÿ�.
  
    SELECT ename, job
    FROM emp
    WHERE NOT job = 'SALESMAN';
  
32. ������ 1000���� 3000 ������ ������� �̸��� ������ ����ϴµ�, �÷����� Employee, Salary�� ����Ͻÿ�.
  
    SELECT ename as Employee, sal as Salary
    FROM emp
    WHERE sal BETWEEN 1000 AND 3000;
  
33.����̸��� ������ ����ϴµ� ������ ���� ������� ���� ��������� ����Ͻÿ�.
 
    SELECT ename , sal 
    FROM emp
    ORDER BY sal;
 
34. �̸��� �Ի����� ����ϴµ� ���� �ֱٿ� �Ի��� ������� ����Ͻÿ�.
 
    SELECT ename, hiredate
    FROM emp
    ORDER BY hiredate DESC;
 
35. ������ SALESMAN�� ������� �̸��� ���ް� ������ ����ϴµ�, ������ ���� ������� ����Ͻÿ�.
 
    SELECT ename, job
    FROM emp
    ORDER BY sal DESC;
        
    = �ڵ� ����
    SELECT empno, ename, sal, RANK() OVER(ORDER BY sal DESC) "rank"
    FROM emp;
 
    SELECT empno, ename, sal, DENSE_RANK() OVER(ORDER BY sal DESC) "rank"
    FROM emp;
 
36. ������ 1000 �̻��� ������� �̸��� ������ ����ϴµ� ������ ���� ������� ���� ��������� ����Ͻÿ�.

    SELECT ename, sal
    FROM emp
    WHERE sal >= 1000
    ORDER BY sal;

37. ����(������*12)�� 36000 �̻��� ������� �̸��� ������ ����ϰ� �÷����� ��Ī�� "����"���� �Ͻÿ�.
 
    SELECT ename, sal as ����
    FROM emp
    WHERE sal*12 >= 36000;
    

38. ������ 1000���� 3000���̰� �ƴ� ������� �̸��� ������ ����Ͻÿ�.
 
    SELECT ename, sal
    FROM emp
    WHERE sal NOT BETWEEN 1000 AND 3000;
 
39. �̸��� ù ���ڰ� s�� �����ϴ� ������� �̸��� ����Ͻÿ�.

    SELECT ename
    FROM emp
    WHERE ename LIKE UPPER('s%');
 
40. �̸��� �� ���ڰ� T�� ������ ������� �̸��� ����Ͻÿ�.

    SELECT ename
    FROM emp
    WHERE ename LIKE '%T';
 
41. �̸��� �ι�° ö�ڰ� m�� ������� �̸��� ����Ͻÿ�.
 
    SELECT ename
    FROM emp
    WHERE ename LIKE UPPER('_m%');
 
42. �̸��� ����° ö�ڰ� L�� ����� �̸��� ����Ͻÿ�.
  
    SELECT ename
    FROM emp
    WHERE ename LIKE UPPER('__l%');
 
 
45. �̸��� ù��° ö�ڰ� S �� �ƴ� ������� �̸��� ����Ͻÿ�.
 
    SELECT ename
    FROM emp
    WHERE ename NOT LIKE 'S%';
 
46. ��� ��ȣ�� 7788, 7902, 7369���� ������� �����ȣ�� �̸��� ����Ͻÿ�.
 
    SELECT empno, ename
    FROM emp
    WHERE empno IN(7788,7902,7369);
 
47. ������ SALESMAN, ANALYST�� �ƴ� ������� �̸��� ������ ����Ͻÿ�.
 
    SELECT ename, job
    FROM emp
    WHERE job NOT IN('SALESMAN', 'ANALYST');
 
48. Ŀ�̼��� null�� ������� �̸��� Ŀ�̼��� ����Ͻÿ�.
    
    SELECT ename, comm
    FROM emp
    WHERE comm IS NULL;
    
 
49 .Ŀ�̼��� null�� �ƴ� ������� �̸��� Ŀ�̼��� ����Ͻÿ�.

    SELECT ename, comm
    FROM emp
    WHERE comm IS NOT NULL;
    

51. 1981�� 11�� 17�Ͽ� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�.
 
    SELECT ename, hiredate
    FROM emp
    WHERE TO_CHAR(hiredate, 'yyyy"��" mm"��" dd"��"') = '1981�� 11�� 17��';
 
52. 1981�⵵�� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�.
 
    SELECT ename, hiredate
    FROM emp
    WHERE TO_CHAR(hiredate, 'yyyy"��"') = '1981��';
 
53. ���Ῥ���ڸ� �̿��ؼ� �̸��� ������ �����ؼ� ����Ͻÿ�.
 
    SELECT ename||' '|| sal
    FROM emp;
 
54. ������ ����� "SCOTT�� ������ ANALYST �Դϴ�."�� ���� ����� ����Ͻÿ�.
 
    SELECT ename||'�� ������ '|| job ||'�Դϴ�'
    FROM emp;
 

 
56. ������ SALESMAN�� ������� �̸��� ������ ����ϴµ� ������ ���� ������� ����ϰ� �Ʒ��� ���� ����� ����Ͻÿ�.
"ALLEN �� ������ 36000 �Դϴ�."

    SELECT ename||' �� ������ '|| sal*12 ||'�Դϴ�'
    FROM emp
    WHERE job = 'SALESMAN'
    ORDER BY sal DESC;

57. �̸��� �빮�ڷ� ������ �ҹ��ڷ�, �̸��� ù���ڸ� �빮�� �������� �ҹ��ڷ� ����Ͻÿ�.
 
    SELECT UPPER(ename), LOWER(job), INITCAP(ename)
    FROM emp;

58. �̸��� scott�� ����� �̸��� ������ ����ϴµ� where���� scott�� �ҹ��ڷ� �˻��ؼ� ����Ͻÿ�.
 
 SELECT ename, sal
 FROM emp
 WHERE ename = UPPER('scott');

59.�Ʒ��� ���� ����� ����Ͻÿ�.
 
 SELECT ename, SUBSTR(ename,1,3) "SUBSTR"
 FROM emp;
 
 
60. �̸��� ù��° ö�ڸ� ����ϴµ� �ҹ��ڷ� ��µǰ� �Ͻÿ�
 
    SELECT ename, LOWER(SUBSTR(ename,1,1)) || SUBSTR(ename,2,LENGTH(ename)
    FROM emp;

61. upper, lower, substr, || �� ����ؼ� �Ʒ��� ���� ����� ����Ͻÿ�.
     
    SELECT ename, UPPER(SUBSTR(ename,1,1)) || LOWER(SUBSTR(ename,2,LENGTH(ename)-1))
    FROM emp;

    => INITCAP(ename)
 
62. �̸��� M�ڸ� �����ϰ��ִ� ������� �̸��� ������ ����Ͻÿ�.
 
    

63. �̸��� EN �Ǵ� IN�� �����ϰ� �ִ� ������� �̸��� �Ի����� ����ϴµ� �ֱٿ� �Ի��� ������ ����Ͻÿ�.
 
 
 
64. ������ SALESMAN�� ������� ��� �̸��� ������ ������ ����ϴµ� ������ ���� ������� ����Ͻÿ�.
 
 

65. �̸��� ù���ڰ� A�� �����ϴ� ������� �̸��� ���ް� ������ ����Ͻÿ�. 
 
 

66. ������ 1000���� 3000 ������ ������� �̸��� ���ް� �Ի����� ����ϴµ�, �Ի����� ���� �Ի��� ������� ��µǰ� �Ͻÿ�.

    SELECT ename, hiredate
    FROM emp
    WHERE ename LIKE '%M%' OR ename LIKE '%IN'
    ORDER BY hiredate DESC;
    
    SELECT ename, hiredate
    FROM emp
    WHERE REGEXP_LIKE(ename, 'EN|IN')
    ORDER BY hiredate DESC;

67. instr �Լ��� �̿��ؼ� �̸��� A�ڸ� �����ϰ� �ִ� ������� �̸��� ����Ͻÿ�. 
 
    INSTR => INSTR(���ڿ�, ã�� ����, ����, ���°) Java
    
    SELECT ename
    FROM emp
    WHERE INSTR(ename, 'A', 1,1) > 0;

68. �̸��� ������ ����ϴµ� ������ ��ü 10�ڸ��� ����ϰ� ������ �ڸ��� *�� ����Ͻÿ�! 
 
    SELECT ename, sal
    FROM emp
    WHERE INSTR(ename, 'A', 1,1) >0;
    
    --3��° ���� O�� ã�ƶ�
    SELECT ename, sal
    FROM emp
    WHERE ebane LIKE '__O%';
    
    SELECT ename, sal
    FROM emp
    WHERE INSTR(ename, 'O', 1,1)=3;
 

69. �̸��� ������ ����ϴµ� ������ ��ü 10�ڸ��� ����ϰ� ������ �ڸ��� *���� ����Ͻÿ�. 
 
    SELECT ename, sal, RPAD(sal,10,'*')
    FROM emp;

70. length �Լ��� �̿��ؼ� �̸��� �̸��� ö���� ������ ����Ͻÿ�. 
 
    SELECT ename, LENGTH(ename)
    FROM emp;
    
    --�̸��� 5���ڸ� ���
    
    SELECT ename, LENGTH(ename)
    FROM emp
    WHERE LENGTH(ename) =5;
    
    �����Լ��� SELECT������ ����ϴ� ���� �ƴϴ�
    ------ WHERE,  GROUP BY, ORDER BY => FROM������ ����� �� ����
    

71. �̸�, �Ի��� ��¥���� ���ñ��� �� ��� �ٹ��ߴ��� �Ҽ��� �ڿ��� �߶� ����Ͻÿ�.
 
    SELECT ename,TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate))
    FROM emp;
 
72. ���ú��� ������ ���ƿ� �������� ��¥�� ����Ͻÿ�. 
 
    SELECT NEXT_DAY(SYSDATE,'��')
    FROM emp;

73. �̹��� ������ ��¥�� ����Ͻÿ�. 
 
    SELECT LAST_DAY(SYSDATE)
    FROM emp;
 
 
74. ������ ���� �������� ����Ͻÿ� 
 
    SELECT SYSDATE, TO_CHAR(SYSDATE,'DY"����"')
    FROM DUAL;

75. emp���� �̸�, �Ի��� ������ ����Ͻÿ�. 
 
    SELECT ename, TO_CHAR(hiredate, 'DY"����"')
    FROM emp;

76. ����Ͽ� �Ի��� ������� �̸��� �Ի���, �Ի��� ������ ����Ͻÿ�.
 
    SELECT ename,hiredate, TO_CHAR(hiredate, 'DY"����"')
    FROM emp
    WHERE TO_CHAR(hiredate, 'DY"����"') = '�����';

77. �̸��� ������ ����ϴµ� ���޿� õ������ �ο��Ͻÿ�! (��: 3000 -> 3,000)

    SELECT ename, TO_CHAR(sal,'$999,999')
    FROM emp;
 
78. �̸��� Ŀ�̼��� ����ϴµ� Ŀ�̼��� null�� ������� 0���� ����Ͻÿ�.
 
    SELECT ename, NVL(comm,0),comm
    FROM emp;

79. �̸��� Ŀ�̼��� ����ϴµ� Ŀ�̼��� null�� ������� no comm �̶� �۾��� ����Ͻÿ�.

    SELECT ename, NVL(TO_CHAR(comm) , 'no comm')
    FROM emp;

*/