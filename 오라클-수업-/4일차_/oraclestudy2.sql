/*
-- [질의 3-1] 모든 도서의 이름과 가격을 검색하시오.

SELECT bookname, price
FROM book;
-- [질의 3-2] 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오.

SELECT bookid, bookname, publisher,price
FROM book;

-- [질의 3-3] 도서 테이블에 있는 모든 출판사를 검색하시오.

SELECT publisher
FROM book;

-- [질의 3-4] 가격이 20,000원 미만인 도서를 검색하시오.

SELECT *
FROM book
WHERE price < 20000;

-- [질의 3-5] 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오.

SELECT *
FROM book
WHERE price BETWEEN 10000 AND 20000;

-- [질의 3-6] 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’ 인 도서를 검색하시오.

SELECT *
FROM book
WHERE publisher IN('굿스포츠','대한미디어');

-- [질의 3-7] ‘축구의 역사’를 출간한 출판사를 검색하시오.

SELECT publisher
FROM book
WHERE bookname = '축구의 역사';

-- [질의 3-8] 도서이름에 ‘축구’ 가 포함된 출판사를 검색하시오.

SELECT publisher
FROM book
WHERE bookname LIKE '%축구%';

--[질의 3-9] 도서이름의 왼쪽 두 번째 위치에 ‘구’라는 문자열을 갖는 도서를 검색하시오.

SELECT *
FROM book
WHERE bookname LIKE '_구%';

--[질의 3-10] 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.

SELECT *
FROM book
WHERE price >= 20000;

--[질의 3-11] 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’ 인 도서를 검색하시오.

SELECT *
FROM book
WHERE publisher IN('굿스포츠','대한미디어');


--[질의 3-12] 도서를 이름순으로 검색하시오. 

SELECT *
FROM book
ORDER BY bookname ASC;

--[질의 3-13] 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오.

SELECT *
FROM book
ORDER BY price ASC, bookname ASC;

--[질의 3-14] 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 출력하시오.

SELECT *
FROM book
ORDER BY price DESC, publisher ASC;

--[질의 3-15] 고객이 주문한 도서의 총 판매액을 구하시오.

SELECT SUM(price)
FROM book;

--[질의 3-16] 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오.

SELECT SUM(saleprice)
FROM orders
WHERE custid = 2;

--[질의 3-17] 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구하시오.

SELECT SUM(saleprice), ROUND(AVG(saleprice)), MIN(saleprice), MAX(saleprice)
FROM orders
GROUP BY custid;


--[질의 3-18] 마당서점의 도서 판매 건수를 구하시오.

SELECT COUNT(*)
FROM orders;

==[질의 3-19] 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.

SELECT COUNT(*), SUM(saleprice)
FROM orders;

--[질의 3-20] 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 
-- 단, 두 권 이상 구매한 고객만 구하시오.

SELECT custid, COUNT(*)
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >= 2;


--[질의 3-21] 고객과 고객의 주문에 관한 데이터를 모두 보이시오.

SELECT *
FROM customer c JOIN orders o
ON c.custid = o.custid;




--[질의 3-22] 고객과 고객의 주문에 관한 데이터를 고객별로 정렬하여 보이시오.

SELECT *
FROM customer c JOIN orders o
ON c.custid = o.custid
ORDER BY c.custid ASC;

--[질의 3-23] 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.

SELECT e.name, o.saleprice
FROM customer e JOIN orders o
ON e.custid = o.custid;

--[질의 3-24] 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.

SELECT e.name, SUM(o.saleprice)
FROM customer e JOIN orders o
    ON e.custid = o.custid
GROUP BY e.custid, e.name
ORDER BY e.custid ASC;

--[질의 3-25] 고객의 이름과 고객이 주문한 도서의 이름을 구하시오. 

SELECT c.name, b.bookname
FROM customer c 
    JOIN orders o  ON c.custid = o.custid 
    JOIN book b ON o.bookid = b.bookid;


--[질의 3-26] 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.

SELECT c.name, b.bookname
FROM customer c 
    JOIN orders o  ON c.custid = o.custid 
    JOIN book b ON o.bookid = b.bookid
WHERE o.saleprice = 20000;

--[질의 3-27] 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.

SELECT c.name, o.saleprice
FROM customer c 
    LEFT OUTER JOIN orders o  ON c.custid = o.custid 
    LEFT OUTER JOIN book b ON o.bookid = b.bookid;

--[질의 3-28] 가장 비싼 도서의 이름을 보이시오.



--[질의 3-30] ‘대한미디어’에서 출판한 도서를 구매한 고객의 이름을 보이시오.



--[질의 3-31] 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오. 







--[질의 3-32] 도서를 주문하지 않은 고객의 이름을 보이시오. 



--[질의 3-33] 주문이 있는 고객의 이름과 주소를 보이시오.


--[질의 3-34] Customer 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산’으로 변경하시오.


--[질의 3-35] Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.



--[질의 3-36] Customer 테이블에서 고객번호가 5인 고객을 삭제한 후 결과를 확인하시오.


--[질의 3-37] 모든 고객을 삭제하시오.

*/
