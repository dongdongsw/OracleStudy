-- 4장 (SQL 고급)

/*
	1. 내장 함수 
	-----------
		사용처 :  SELECT 뒤에, WHERE 뒤에, GROUP BY , HAVING, ORDER BY
			ㄴ 컬럼처럼 사용
			ㄴ 리턴값을 가지고 있다 
			ㄴ 리턴형(처리 결과 값) / 매개변수(사용자입력)
				CREATE FUNCTION func_name(매개변수)
				RETURN 데이터형
				BEGIN 
					SQL 문장 처리
					RETURN 값
				END;
			ㄴ 컬럼 단위 처리, ROW 단위 처리
			   ------------- --------------
			   집계함수			단일행 함수
			  
			  1) 단일행 함수
					ㄴ 문자 관련 => 웹 : 자바 (String), 오라클
						ㄴ 문자 자르기 : SUBSTR(문자열|컬럼명,시작위치,갯수)
										ㄴ 문자 시작번호 : 1, 자바 : 0
										ㄴ 자바, 자바스크립트 : substring()
										----------------------------------
											= AJAX / VUE / REACT => 
												자바스크립트 라이브러리
												
						ㄴ 문자 위치 찾기 : INSTR(문자열 | 컬럼명, 찾는 문자, 시작위치, 몇번째)
											Hello Java => a
											ㄴ indexOf / lasIndexOf 동시 처리
											
						ㄴ 문자 대체 : RPAD => 아이디 찾기
									  RPAD(문자열, 출력 갯수, 대체문자)
									  RPAD('ADMIN',10,'#')
									  => ADMIN#####
									  => AD***
									  
						ㄴ 문자 갯수 : LENGTH(문자열)
						
						ㄴ 문자변경 : REPLACE(문자열,찾는 문자, 변경문자)
									& => URL(이미지) => | => 저장			
									-- URL => 데이터 구분
									localhost/board.jsp?no=10^name=aaa
											
					ㄴ 숫자 관련 => 자바(Math)
						ㄴ MOD : 나머지 MOD(10,3) => 10 % 3
						ㄴ ROUND : 반올리
						ㄴ CEIL : 올림 => 총페이지
						
					ㄴ 날짜 관련 => 자바(Calendar)
						ㄴ SYSDATE : 시스템의 시간, 날짜 => 정수형처럼 사용
						ㄴ SYSDATE - 1(어제) / SYSDATE + 1 (내일)
						ㄴ MONTHS_BETWEEN(최신, 이전)
										SYSDATE,	hiredate
						
					ㄴ 변환 => DecimalFormat / SimpleDateFormat
						ㄴ TO_CHAR : 문자열 변환
							ㄴ 패턴
								ㄴ YYYY / RRRR, MM, DD, HH/HH24, MI, SS, DY
								ㄴ 999,999,999
					
					ㄴ 기타 => 자바에서는 존재하지 않는다(NVL)
						ㄴ NVL : null 값 대신 다른 값으로 대체
						
			  2) 집계 함수
					ㄴ COUNT : ROW의 갯수
					ㄴ MAX,MIN
					ㄴ SUM : 합
					ㄴ AVG : 평균
					ㄴ CUBE : ROW 단위 평균
					ㄴ ROLLUP : ROW, Column 평균
					
	2. 서브쿼리 => 단계별
	
	3. 인덱스 => 검색 최적화 / 정렬	
	
	5장 : 프로그램
		1) PL/SQL => 오라클 프로그램
			=> FUNCTION / PROCEDURE / TRIGGER => 호불호 (ERP)
			
		2) JDBC
		
		3) 웹 프로로그램 : JSP (보류)
		
	6장 : 데이터베이스 설계 (개념 설계, 논리 설계, 물리설계 => 데이터 모델)
	
	7장 : 정규화
	
	8장 : 트랜잭션
	
	---------------------------------
	
	9장 : 어드민 => 복구, 백업, 보안
		=> 
		
		
		
		
		
		
		
		
		
*/ 







-- -- 2025-09-09 ROWNUM (222page) => 페이지 나누기
-- /*
    -- ROWNUM
        -- 쿼리 결과값에 붙는 가상 컬럼 => SQL문장에서만 사용이 가능
        -- 결과에 따라 ROWNUM의 번호가 변경된다 (유동성)
        -- --- ORDER BY / 실행 결과
        -- => DEFAULT => 오라클에서 설정 (SQL에서 임의로 변경이 가능)
-- */
-- SELECT empno, ename, hiredate, sal, job, ROWNUM
-- FROM emp;

-- SELECT empno, ename, hiredate, sal, job, ROWNUM
-- FROM (SELECT * FROM emp ORDER BY sal DESC);
-- -- 사용처 : 페이지나누기, 인기순위, 공지사항 10개
-- -- TOP-N => 단점 : 중간에 자를 수 없다
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

-- -- 최신 개발
-- SELECT empno, ename, hiredate, sal, job
-- FROM (SELECT empno, ename, hiredate, sal, job,
        -- ROW_NUMBER() OVER(ORDER BY sal DESC) AS RN
        -- FROM emp)
-- WHERE RN BETWEEN 6 AND 10;

-- -- CRUD : 게시판
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
-- VALUES(board_no_seq.nextval, '홍길동', 'CRUD 연습', 'INSERT/UPDATE/DELETE', '1234');


--



































