-- 222page (rownum) , 서브 쿼리, 시노님, 시퀀스, 인덱스

/*
	전체 정리, 튜닝
		ㄴ PL/SQL : FUNCTION, PROCEDURE, TRIGGER
		ㄴ 데이터베이스 설계 / 정규화
	1. ROWNUM
		ㄴ 실제 컬럼이 아니다, 가상 컬럼 => 각 ROW 번호 (오라클 처리)
		ㄴ 결과 값에 따라 변경이 가능
		ㄴ ORDER BY, INDEX를 이용하면 변경
		ㄴ 주로 사용처
		ㄴ 인기 순위 10개, 페이징 기법
		ㄴ 사용시에는 SELECT, WHERE에서 주로 사용
		

*/
/* 
SELECT empno, ename, job,hiredate, sal , ROWNUM
FROM emp;
 */


--rownum의 순서 변경 => 인라인뷰
/* 
SELECT empno, ename, job, hiredate, sal, ROWNUM
FROM (SELECT * FROM emp ORDER BY sal DESC);
 */

-- 가장 많이 사용되는 형태
-- 인기 순위 5개
/* 
SELECT name, ROWNUM
FROM (SELECT name, hit, FROM food ORDER BY hit DESC)
WHERE rownum <=5;
 */
/* 
	rownum의 단점
	1. TOP-N : 1부터 ~ 원하는 갯수 출력
	   ------ 중간에는 자를 수 없다
	2. rownum을 변경 => 서브 쿼리 사용 => ORDER BY
	
	
 */
-- 범위 => sal 값이 6 ~ 10 => 페이징 기법
-- 중첩 서브 쿼리 사용
-- 1. 방법
/* 
SELECT empno, ename, job, num
FROM (SELECT empno, ename, job, rownum as num
FROM (SELECT empno, ename, job
FROM emp ORDER BY empno ASC))
WHERE num BETWEEN 6 AND 10;
 */
 -- 2. 방법
 /* 
SELECT empno, ename, job
FROM (SELECT empno, ename, job, rownum as rn
FROM (SELECT empno, ename , job
FROM emp ORDER BY empno ASC) e
WHERE rownum <= 10
)
WHERE rn >= 10;
 */
 -- 3. 방법 => ROW_NUMBER => 1개의 서브쿼리 사용 => 12c
 /* 
 SELECT empno, ename, job
 FROM (SELECT empno, ename , job, ROW_NUMBER() OVER(ORDER BY empno) AS rn
 FROM emp)
 WHERE rn BETWEEN 6 AND 10;
 */

/*
	11. INSERT => rownum / rowid(인덱스)
	전체 번호 설정 : SELECT rownum .... => 이전 / 다음의 상세보기 이동
	상위 N (TOP-N) : WHERE rownum <= N => 인기 순위 / 급상승
	N부터 N까지  : rownum 서브 쿼리 + BETWEEN N AND M
	정렬 후 번호 설정(변경) => 서브 쿼리 이용
	최신 방ㅂ법 : ORW_NUMBER() => 권장
*/

/*
	시퀀스 : SEQUENCE
	-----------------
	= 독립적으로 존재, 테이블과 직접적으로 연결되지 않는다
	= 값을 읽는 경우
		현재 값 : currval
		다음 값 : nextval
	= PRIMARY KEY => 	중복이 있으면 안된다
						중복없는 자동 증가 번호 생성
	= 초기값 : START WITH
	= 증가값 : INCREMENT BY
	= CACHE : 메모리에 미리 값을 저장한 후에 사용
	= 대용량 데이터를 INSERT할 경우에는 성능이 저하
	  ------------ SELECT NVL(MAX(no)+1,1) FROM food
					MyBatis에서 증가 번호
					<selectKey statement = ""> : 자동 증가번호
					@SelectKey
	= 속성 값
		START WITH => 초기값 i = 1
		INCREMENT BY => 증가값 i++, i += 2
		MINVALUE 1
		MAXVALUE 100
		CACHE 20
		NOCACHE
		CYCLE => 10까지 도달 => 다시 1부터
		NOCYCLE => 100
		단점은 삭제시에 변경이 없다(일괄적이 아니다)
		장점은 중복이 되는 번호가 없다
*/

-- 테이블 정보 한개의 테이블에 저장
	
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
-- 중복 방지 : user_sequence
-- => constraint : 제약 조건 => user_constraints
/* 
CREATE SEQUENCE myfood_fno_seq
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 100
	NOCACHE
	NOCYCLE;
*/

-- 시퀀스 이용 방법 => 초기화
-- 크롤링 => TRUNCATE / DROP SEQUENCE
/* 
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'김밥','한식',2500);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'라면','한식',4000);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'피자','양식',5000);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'치킨','양식',5000);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'짜장','중식',3000);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'꼬마 김밥','한식',800);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'초밥','일식',1990);
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'된장찌개','한식',1500);
COMMIT;
 */
 
/* 
SELECT myfood_fno_seq.currval FROM DUAL;

SELECT myfood_fno_seq.nextval FROM DUAL;
 */
 
/* 
INSERT INTO myFood VALUES(myfood_fno_seq.NEXTVAL,'우동','일식',1800);
COMMIT;
 */


















