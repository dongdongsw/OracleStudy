-- ¿¬»êÀÚ (³í¸® ¿¬»êÀÚ) µÎ°³ÀÇ Á¶°ÇÀ» ºñ±³ÇÒ °æ¿ì¿¡ AND, OR
-- AND => Æ÷ÇÔ, µÎ°³ÀÇ Á¶°ÇÀÌ µ¿½Ã¾Ö true
-- Á÷À§°¡ SALEMANÀÌ°í ±Þ¿©°¡ 1500 ÀÌ»óÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸
/*
SELECT *
FROM emp
WHERE job = 'SALESMAN' AND sal >= 1500;
*/

-- 81³â¿¡ ÀÔ»çÇÑ ¸ðµç »ç¿øÀÇ Á¤º¸¸¦ Ãâ·Â
/*
SELECT *
FROM emp
WHERE hiredate >= '81/01/01' AND hiredate <= '81/12/31';

SELECT *
FROM emp
WHERE hiredate LIKE '81%';

SELECT *
FROM emp
WHERE SUBSTR(hiredate, 1, 2)= 81;
*/

-- OR => µÑÁß¿¡ ÇÑ°³ÀÌ»óÀÌ trueÀÏ °æ¿ì
-- Á÷À§°¡ MANAGER / CLERK ÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸
/*
SELECT *
FROM emp
WHERE job = 'MANAGER' OR job = 'CLERK';
*/
-------------------------------------------------------------------------
-- ¿À¶óÅ¬¿¡¼­ Á¦°øÇÏ´Â ¿¬»êÀÚ
-- BEETWEEN ~ AND : ±â°£, ¹üÀ§ = ÀÚ¹Ù(¿¹¾à ±â°£, Ã¼Å©ÀÎ ±â°£, ÆäÀÌÁö)
-- >= AND <=
-- ±Þ¿©°¡ 1000¿¡¼­ 3000»çÀÌÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸
/*
SELECT *
FROM emp
WHERE sal >= 1000 AND sal <= 3000;

SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 3000;
*/

-- 80³âµµ¿¡ ÀÔ»çÇÑ ¸ðµç »ç¿øÀÇ Á¤º¸ Ãâ·Â
/*
SELECT * 
FROM emp 
WHERE hiredate BETWEEN '80/01/01' AND '80/12/31';
*/

-- 5°³¸¸ Ãâ·Â
/*
SELECT empno, ename, job, hiredate, rownum
FROM emp
WHERE rownum BETWEEN 1 AND 5;
*/

-- IN => OR°¡ ¿©·¯°³ÀÎ °æ¿ì¿¡ »ç¿ë
-- deptno(ºÎ¼­¹øÈ£) 10 20 30
/*
SELECT *
FROM emp
WHERE deptno = 10 OR deptno = 20 OR deptno = 30;
*/

-- WHERE ÄÃ·³¸í IN(°ª...)
/*
SELECT *
FROM emp
WHERE deptno IN(10,20,30);
*/

-- ¹®ÀÚ
-- KING, ADAMS , SCOTT, FORD, MARTIN
/*
SELECT *
FROM emp
WHERE ename = 'KING' OR ename = 'ADAMS' OR ename = 'SCOTT'
	OR ename = 'FORD' OR ename = 'MARTIN';

SELECT *
FROM emp
WHERE ename IN('KING', 'ADAMS', 'SCOTT', 'FORD', 'MARTIN');
*/

-- NOT (ºÎÁ¤ ¿¬»êÀÚ)
-- jobÀÌ MANAGER, CLERKÀÌ ¾Æ´Ñ »ç¿øÀÇ ¸ðµç Á¤º¸
/*
SELECT *
FROM emp
WHERE NOT (job = 'MANAGER' OR job ='CLERK');
*/

-- 'KING', 'ADAMS', 'SCOTT', 'FORD', 'MARTIN'»ç¿øÀÌ ¾Æ´Ñ ¸ðµç »ç¿ø Á¤º¸
/*
SELECT *
FROM emp
WHERE ename NOT IN('KING', 'ADAMS', 'SCOTT', 'FORD', 'MARTIN');
*/

-- 81³âµµ¿¡ ÀÔ»çÇÏÁö ¾ÊÀº ¸ðµç »ç¿øÀÇ Á¤º¸
/*
SELECT *
FROM emp
WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';
*/
-- NOT IN, NOT BETWEEN, NOT LIKE
-- NULL => NULL °ªÀÌ ¾ø´Â »óÅÂ => ¿¬»êÃ³¸®°¡ ¾ÈµÈ´Ù
-- ¿¬»êÃ³¸®¸¦ À§ÇÑ ¿¬»êÀÚ Á¦°ø => IS NULL. IS NOT NULL;

-- »ç¼ö (mgr)°¡ ¾ø´Â »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
/*
SELECT *
FROM emp
WHERE mgr IS NULL;
*/

-- »ç¼ö (mgr)°¡ ÀÖ´Â »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
/*
SELECT *
FROM emp
WHERE mgr IS NOT NULL;
*/

/*
 LIKE ===> ÁøÈ­ REGEXP_LIKE(ename, '[°¡-ÆR]')
	= % : ¹®ÀÚÀÇ °¹¼ö¸¦ ¸ð¸¥ °æ¿ì(Á¦ÇÑ ¾ø´Ù)
	= _ : ÇÑ±ÛÀÚ

	=== °Ë»ö

	= ½ÃÀÛ ¹®ÀÚ¿­ ==> ¹®ÀÚ¿­ % IN%
	= ³¡³ª´Â ¹®ÀÚ¿­ ==> %¹®ÀÚ¿­ %EN
	= Æ÷ÇÔµÇ¾îÀÖ´Â ¹®ÀÚ¿­ ==> %EN%
	= ±ÛÀÚ¼ö¸¦ ¾Ë°í ÀÖ´Ù ____ __ __
*/

-- »ç¿ø Áß¿¡ AÀÚ·Î ½ÃÀÛÇÏ´Â »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
/*
SELECT * 
FROM emp
WHERE ename LIKE 'A%';
*/

-- »ç¿ø Áß¿¡ TÀÚ·Î ³¡³ª´Â »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
/*
SELECT * 
FROM emp 
WHERE ename LIKE '%T';
*/

-- »ç¿ø ÀÌ¸§ Áß¿¡ IN·Î ³¡³ª°Å³ª ENÀ¸·Î ³¡³ª´Â »ç¿øÀÇ ¸ðµç Ãâ·Â
/*
SELECT * 
FROM emp
WHERE ename LIKE '%IN' OR ename LIKE '%EN';
*/

-- »ç¿ø ÀÌ¸§ Áß¿¡ O¸¦ Æ÷ÇÔÇÏ°í ÀÖ´Â »ç¿øÀÇ ¸ðµç Ãâ·Â
/*
SELECT *
FROM emp 
WHERE ename LIKE '%O%';
*/

-- ÀÌ¸§ Áß¿¡ AÀÚ·Î ½ÃÀÛ 5±ÛÀÚÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸
/*
SELECT *  
FROM emp
WHERE ename LIKE 'A____';
*/

-- ÀÌ¸§ÀÌ 5±ÛÀÚÀÎµ¥ °¡¿îµ¥°¡ OÀÎ »ç¶÷ ÀÇ ¸ðµç Á¤º¸
/*
SELECT *
FROM emp
WHERE ename LIKE '__O__' ;
*/

-- book =-> Ãà±¸
/*
SELECT *
FROM book
WHERE BOOKNAME LIKE '%Ãà±¸%';
*/

-- name , type
/*
SELECT name, type
FROM food
WHERE type LIKE '%ÇÑ½Ä%';
*/

-- ¸¶Æ÷¿¡ ÀÖ´Â °É Ã£¾Æ¶ó
/*
SELECT name, address
FROM food
WHERE address LIKE '%¸¶Æ÷%';
*/

-- emp : »ç¿ø ÀÌ¸§ Áß¿¡ A, D, K, E, S
SELECT ename
FROM emp
WHERE ename LIKE '%A%' 
OR ename LIKE '%D%' 
OR ename LIKE '%K%' 
OR ename LIKE '%E%' 
OR ename LIKE '%S%';


SELECT ename
FROM emp
WHERE REGEXP_LIKE(ename, 'A|D|K|E|S');
















