-- 내장 함수 / DML => view , sequence / DDL
-- 1차 프로젝트 : 수업에 충실 (사용법, CRUD, 흐름)
/*
	내장 함수
	---------
	= 단일행 함수 : ROW 단위 처리
		문자 함수
			ㄴ UPPER / LOWER => 함수 기반 INDEX
			ㄴ SUBSTR : 문자 자르기
					=> 주소 동/구 => 인접한 맛집 / 명소...
					SUBSTR(문자열/컬럼, 자르는 시작위치, 몇글자)
			ㄴ INSTR : 문자 찾기(문자 번호)
					ㄴ INSTR(문자열/컬럼, 찾는 문자, 시작위치, 몇번째)
					ㄴ 서울시 마포구 서교동....
			ㄴ RPAD : 출력 문자 갯수 지정 => 모자라는 경우 지정된 문자 출력
					ㄴ ad***
					ㄴ RPAD(문자열/컬럼, 몇글자 출력, 대체문자)
					ㄴ RPAD('hong', 10, '*')
					ㄴ hong*******
			ㄴ LENGTH : 문자의 갯수
					ㄴ LENGTH(문자열) => 한글 / 알파벳이 동일
					ㄴ 비밀번호 / 닉네임 => 몇글자 이상
		숫자 함수
			ㄴ MOD : 나머지 값
				ㄴ MOD(10,2) => 10%2
			ㄴ ROUND : 반올림 => 평균
				ㄴ ROUND(실수, 소수점 자리)
				ㄴ ROUND(실수) => 소수점 지우기
			ㄴ CEIL : 올림 => 총페이지
				ㄴ CEIL(실수)
				
		날짜 함수
			ㄴ SYSDATE : 시스템의 시간/날짜
							ㄴ 계산 : 산술 연산
							ㄴ SYSDATE -1 / SYSDATE + 1
			ㄴ MONTHS_BETWEEN : 기간의 개월 수
								------------- LONG (시간, 분,  초)
								ROUND
			=> 인사 관리 / 보험 / 적금 => ERP
			
		변환 함수
			ㄴ TO_CHAR : 숫자, 날짜를 문자열 변환
			ㄴ TO_DATE : 문자열 날짜 형태로 변경
			ㄴ TO_NUMBER : 문자열을 숫자 형태로 변경
			ㄴ SELECT * FROM emp WHERE empno='7788' => 튜닝시 속도 저하
				ㄴ TO_NUMBER('7788')
			ㄴ SELECT * FROM emp WHERE TPCHAR(hiredate,'YYYY') = 1981
				ㄴ 함수안에 포함된 컬럼은 인덱스가 적용이 안됨
			ㄴ TABLE Full Scan
				SELECT * FROM emp WHERE hiredate BETWEEN TO_DATE('1981-01-01','YYYY-MM-DD')
				AND TO_DATE('1981-12-31','YYYY-MM-DD')
				1) 조건문(WHERE)안에서 컬럼에 함수(x)
				2) 인덱스 컬럼이 있는 경우 => 그대로 사용해야한다
				3) 함수 기반의 인덱스
					CREATE INDEX idx_hiredate ON emp(TO_CHAR(hiredate
		기타 함수
			ㄴ NVL : NULL값을 다른 대체
				ㄴ 데이터 형이 일치가 되야 한다
				NVL (comm, '없음') => 오류
					NUMBER VARCHAR2
				=> NVL(TO_CHAR(comm), '없음')
				NVL(컬럼, 대체값)
				=> NULL값은 연산처리가 안된다
				
	= 집계 함수 : COLUMN 단위 처리
			ㄴ COUNT : ROW의 갯수
				=> 존재 여부
			ㄴ MAX / MIN =>  MAX는 자동 증가 번호 => SEQUENCE
			ㄴ AVG / SUM
			ㄴ RANK / DENSE_RANK => 순위
			---------------------
			RANK 		DENSE_RANK
			1				1
			2				2
			3				3
			4				4
			----------------------------------------
			RANK() OVER(ORDER BY sal ASC) => 자동 정렬
			CUBE / ROLLUP / GROUPING
			
	= GROUP BY가 없는 상태에서 같이 사용할 수 없다
	
	DML : 데이터 조작언어
		ㄴ CRUD
		1) SELECT : 데이터 검색 => 75%
			SELECT * | column_list(튜닝) => 5
			FROM table_name | view_name | SELECT ~ => 1
			[
				WHERE 조건문 => 2
				GROUP BY 그룹 컬럼|함수 => 3
				HAVING 그룹 조건 => 4
				ORDER BY 컬럼 | 함수 => 6
			
			]
		----------------------
		2) INSERT : 데이터 추가
			INSERT INTO table_name(컬럼.....)
			VALUES(값....) => default / null 허용
			=> 전체 추가
			** 문자,날짜 =-> ''
			''(null), '' (space)
		3) UPDATE : 데이터 수정
			UPDATE table_name
			SET 컬럼=값, 컬럼 = 값....
			[WHERE 조건문] => 튜닝
		4) DELETE : 데이터 삭제
			DELETE FROM table_name
			[WHERE 조건문]
		----------------------------- 조건을 제시
		CRUD : 순수하게 자바로만 제어
			   ------------
			   Servlet => JSP => MVC => Spring
				  |		  ---
				 보안	   |
						  view

*/

-- 게시판 테이블
/*
CREATE TABLE web_board(
	no NUMBER,
	name VARCHAR2(51) CONSTRAINT wb_name_nn NOT NULL,
	subject VARCHAR2(2000) CONSTRAINT wb_sub_nn NOT NULL,
	content CLOB CONSTRAINT wb_cont_nn NOT NULL,
	pwd VARCHAR2(10) CONSTRAINT wb_pwd_nn NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	hit NUMBER DEFAULT 0,
	CONSTRAINT wb_no_nn PRIMARY KEY(no)
);
*/
/*
CREATE SEQUENCE wb_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCYCLE
	NOCACHE;

*/
/*
CREATE INDEX idx_wb_name ON web_board(name);
CREATE INDEX idx_wb_sub ON web_board(subject);
*/
-- CREATE INDEX idx_wb_cont ON web_board(content);			   
-- LOB => index를 사용할 수 없다
/*			   
INSERT INTO web_board(no,name,subject, content, pwd)
VALUES(wb_no_seq.nextval,'홍길동','CRUD/HTML태그',
'게시판(CRUD) CREATE(INSERT) READ(SELECT) UPDATE DELETE','1234');			   
*/
/*
commit;

select * FROM web_board;			   
		
*/		

SELECT no, subject, name,regdate, hit, num			   
FROM (SELECT no, subject, name,regdate, hit, rownum as num			   
FROM (SELECT no, subject, name,regdate, hit
FROM web_board ORDER BY no DESC))
WHERE num BETWEEN 1 AND 10;

-- 최근에 쓰이는 방법
SELECT no, subject, name,regdate, hit
FROM web_board
ORDER BY no DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY; 			   
			   
			   
			   
			   
			   
			   

*/