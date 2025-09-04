/*
-- [���� 3-1] ��� ������ �̸��� ������ �˻��Ͻÿ�.

SELECT bookname, price
FROM book;
-- [���� 3-2] ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��Ͻÿ�.

SELECT bookid, bookname, publisher,price
FROM book;

-- [���� 3-3] ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.

SELECT publisher
FROM book;

-- [���� 3-4] ������ 20,000�� �̸��� ������ �˻��Ͻÿ�.

SELECT *
FROM book
WHERE price < 20000;

-- [���� 3-5] ������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ�.

SELECT *
FROM book
WHERE price BETWEEN 10000 AND 20000;

-- [���� 3-6] ���ǻ簡 ���½������� Ȥ�� �����ѹ̵� �� ������ �˻��Ͻÿ�.

SELECT *
FROM book
WHERE publisher IN('�½�����','���ѹ̵��');

-- [���� 3-7] ���౸�� ���硯�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�.

SELECT publisher
FROM book
WHERE bookname = '�౸�� ����';

-- [���� 3-8] �����̸��� ���౸�� �� ���Ե� ���ǻ縦 �˻��Ͻÿ�.

SELECT publisher
FROM book
WHERE bookname LIKE '%�౸%';

--[���� 3-9] �����̸��� ���� �� ��° ��ġ�� ��������� ���ڿ��� ���� ������ �˻��Ͻÿ�.

SELECT *
FROM book
WHERE bookname LIKE '_��%';

--[���� 3-10] �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.

SELECT *
FROM book
WHERE price >= 20000;

--[���� 3-11] ���ǻ簡 ���½������� Ȥ�� �����ѹ̵� �� ������ �˻��Ͻÿ�.

SELECT *
FROM book
WHERE publisher IN('�½�����','���ѹ̵��');


--[���� 3-12] ������ �̸������� �˻��Ͻÿ�. 

SELECT *
FROM book
ORDER BY bookname ASC;

--[���� 3-13] ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�.

SELECT *
FROM book
ORDER BY price ASC, bookname ASC;

--[���� 3-14] ������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ ����Ͻÿ�.

SELECT *
FROM book
ORDER BY price DESC, publisher ASC;

--[���� 3-15] ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.

SELECT SUM(price)
FROM book;

--[���� 3-16] 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.

SELECT SUM(saleprice)
FROM orders
WHERE custid = 2;

--[���� 3-17] ���� �ֹ��� ������ �� �Ǹž�, ��հ�, ������, �ְ��� ���Ͻÿ�.

SELECT SUM(saleprice), ROUND(AVG(saleprice)), MIN(saleprice), MAX(saleprice)
FROM orders
GROUP BY custid;


--[���� 3-18] ���缭���� ���� �Ǹ� �Ǽ��� ���Ͻÿ�.

SELECT COUNT(*)
FROM orders;

==[���� 3-19] ������ �ֹ��� ������ �� ������ �� �Ǹž��� ���Ͻÿ�.

SELECT COUNT(*), SUM(saleprice)
FROM orders;

--[���� 3-20] ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. 
-- ��, �� �� �̻� ������ ���� ���Ͻÿ�.

SELECT custid, COUNT(*)
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >= 2;


--[���� 3-21] ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�.

SELECT *
FROM customer c JOIN orders o
ON c.custid = o.custid;




--[���� 3-22] ���� ���� �ֹ��� ���� �����͸� ������ �����Ͽ� ���̽ÿ�.

SELECT *
FROM customer c JOIN orders o
ON c.custid = o.custid
ORDER BY c.custid ASC;

--[���� 3-23] ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.

SELECT e.name, o.saleprice
FROM customer e JOIN orders o
ON e.custid = o.custid;

--[���� 3-24] ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.

SELECT e.name, SUM(o.saleprice)
FROM customer e JOIN orders o
    ON e.custid = o.custid
GROUP BY e.custid, e.name
ORDER BY e.custid ASC;

--[���� 3-25] ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�. 

SELECT c.name, b.bookname
FROM customer c 
    JOIN orders o  ON c.custid = o.custid 
    JOIN book b ON o.bookid = b.bookid;


--[���� 3-26] ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.

SELECT c.name, b.bookname
FROM customer c 
    JOIN orders o  ON c.custid = o.custid 
    JOIN book b ON o.bookid = b.bookid
WHERE o.saleprice = 20000;

--[���� 3-27] ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.

SELECT c.name, o.saleprice
FROM customer c 
    LEFT OUTER JOIN orders o  ON c.custid = o.custid 
    LEFT OUTER JOIN book b ON o.bookid = b.bookid;

--[���� 3-28] ���� ��� ������ �̸��� ���̽ÿ�.



--[���� 3-30] �����ѹ̵����� ������ ������ ������ ���� �̸��� ���̽ÿ�.



--[���� 3-31] ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�. 







--[���� 3-32] ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�. 



--[���� 3-33] �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.


--[���� 3-34] Customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� �����ѹα� �λꡯ���� �����Ͻÿ�.


--[���� 3-35] Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.



--[���� 3-36] Customer ���̺��� ����ȣ�� 5�� ���� ������ �� ����� Ȯ���Ͻÿ�.


--[���� 3-37] ��� ���� �����Ͻÿ�.

*/
