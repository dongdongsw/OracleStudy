-- 2025 09 22 : 오라클 정리 / SQL 튜닝 / 웹 개발시 필요한 SQL 

/*
    1. SQL 튜닝 : SQL 실행 속도를 최적화
        ㄴ  database에 저장된 데이터를 효율적으로 사용
		ㄴ 응답 시간 단축: 쿼리가 빠르게 실행되도록 개선
		ㄴ 시스템 자원 절약: CPU, 메모리, 디스크 I/O 사용량 최소화
		ㄴ 동시 사용자 처리 향상: 여러 사용자가 동시에 이용할 때도 안정적인 성능 보장.
    
	ㄴ 불필요한 컬럼은 사용하지 않는다
        SELECT * FROM table_name(X)
        SELECT 컬럼 나열 ....
        
    ㄴ DISTINCT / UNION => 사용 => 최소화
                 ------ UNION ALL
	
	ㄴ WHERE 절 조건 최소화
		WHERE SUBSTR (name, 1,3) = 'ABC' (X)
		WHERE name LIKE 'ABC%'
		OR대신 UNION ALL / IN
	
	ㄴ ORDER BY 최소한만 사용 => 필요시에만 사용
	   ---------- INDEX
	  
	ㄴ 튜닝 대상
		ㄴ 1. 비효율적인 SQL 문장: 불필요한 연산, 중복된 조인, 서브쿼리 남용 등
		ㄴ 2. 인덱스 활용 부족: 적절한 인덱스가 없어 풀스캔 발생
		ㄴ 3. 통계 정보 부재: 옵티마이저가 잘못된 실행 계획을 선택하는 경우
		ㄴ 4. 데이터 모델링 문제: 테이블 구조 설계상의 비효율성
	  
	ㄴ 튜닝 방법
		1. 실행 계획 확인: EXPLAIN, AUTOTRACE 등을 사용해 DB 옵티마이저가 선택한 실행 경로 분석
		2. SQL 문장 개선: 불필요한 컬럼 제거, 조인 순서 최적화, 서브쿼리를 조인으로 변환 등
		3. 인덱스 최적화: 적절한 인덱스 생성, 사용하지 않는 인덱스 정리
		4. 옵티마이저 힌트 사용: 경우에 따라 옵티마이저가 올바른 계획을 선택하도록 힌트 지정
		5. 데이터 구조 개선: 파티셔닝, 정규화/반정규화, 캐싱 전략 도입
	 
	  
	2. INDEX 활용 중심
		예) 검색어로 많이 사용 (Food => title , type)
		ㄴ 데이터 베이스 설계
		ㄴ SEQUENCE / INDEX
		JOIN에서 자주 사용되는 FK / PK 컬럼
		ㄴ WHERE 문장에서 자주 등장하는 다중 조건

	3. JOIN
		ㄴ 데이터가 작은 테이블을 선행 테이블로 배치
		ㄴ emp / dept => dept를 앞에 석ㄹ정
		=> 인덱스가 걸린 컬럼으로 JOIN
		=> 서브 쿼리보다 JOIN 권장
		=> 소량일 때 => IN
		=> 다량일 때 => EXISTS
		
	4. 집계 / 서브 쿼리
		ㄴ GROUP BY / HAVING 최적화
		1) WHERE에서 먼저 데이터를 추출 => GROUP BY
		2) 서브쿼리는 JOIN
		
	5. ORDER BY => 힌트 INDEX / INDEX_ASC INDEX_DESC
		
		
	----------------------------------------------------------------------
	SQL 문장 최적화 => 실행계획 분석 => 인덱스 설정
	=> JOIN / 집계 최적화 = DB 환경 점검
	3장 / 4장 => DDL / DML
	5장 => INDEX
	6장 => DB 설계
	7장 => 정규화
	8장 => 트랜잭션
	-----------------
	1장 ~ 8장 : 기본 문법 => 예외처리
	=> java.lang / java.util / java.io / java.sql
											|
										  Connection / PrepareStatement / ResultSet
		   |		   | 		   | 파일관련		 
								   | FileInputStream / FileOutPutStream
								   | FileReader / FileWriter
								   | BufferReader
					StringTokenizer / Date / Calendar
					Collection
						| List (ArrayList)
						| Map (HashMap)
		String / Object / Math / Wrapper (Integer , Double, Boolean)
		=> 객체 지향 설계 => ~VO / ~ DAO / IO / Open API
		
		자바 + 오라클 : HTML / CSS / JavaScript
					   -----------------------
					   화면 UI
					   속도 / 화면 변경
					   ----------------
						AJAX(Jquery) / VueJS / ReactJS
						
	오라클(3장)
		SQL 문장
		---
		 = DQL : 데이터 검색 => SQL 튜닝
			SELECT => executeQuery()
			
		 = DML : 데이터 조작 => 추가 / 삭제 / 수정 => TCL이 반드시 필요
			INSERT / UPDATE / DELETE => executeUpdate()
											ㄴ 커밋을 포함
											
		 = DDL : 정의 언어 => 테이블 생성 / 뷰 생성 / 시퀀스 생성 / 시
							 함수 / 프로시저 / 트리거
			CREATE / ALTER / DROP / RENAME / TRUNCATE
			
		 = DCL : 권한 부여 / 권한 해제
			=> 계정 : System, / sysdba
			GRANT / REVOKE
			
		 = TCL : 정상적 수행 / 비정상일 때 / 어디 부터 처리
					COMMIT 		ROLLBACK 	SAVEPOINT
		
		1) SELECT 문장
			형식) 
				SELECT (DISTINCT|*) *| column_list
										ㄴ 필요한 컬럼 없이
				FROM table_name | view_name | SELECT ~ 
					 ----------------------------------
					 1) View 이용
					 2) SELECT ~ => 인라인뷰 (보안, ROWNUM)
				[
					WHERE 조건 : 필요한 데이터만 추출
					GROUP BY 그룹 컬럼 : 그룹별 집계
					-------------------------------
								1) 마이페이지
								2) 관리자 페이지
					HAVING 그룹 조건 : GROUP BY가 있는 경우에만 사용
					ORDER BY 정렬 컬럼 / 함수
					---------- 데이터가 많은 경우에 주로 인덱스를 사용
					
				]
			튜닝) 146page
				=> Book(bookid(pk), bookname, publisher, price)
					책정보
				=> Customer (custid(pk), name, address, phone)
					고객 정보
				=> Orders(orderid(pk), custid(fk), bookid(fk),
							saleprice, orderdate)
								|
								매핑 테이블
									N : 1
								-------------
								|			|
				Customer ==== Orders ==== Book
					|			|
					-------------
						1:N
		
				1) 예제 (3-1)
					모든 도서의 이름과 가격을 검색
					SELECT * FROM book;
					ㄴ 테이블의 모든 컬럼과 모든 행을 조회
						ㄴ FULL TABLE SCAN 발생
					ㄴ 테이블의 데이터가 많을 수록 I/O 서버의 부담 증가
					ㄴ 컬럼이 많으면 => 데이터가 크고 네트워크 전송률이 낮아진다
				
				브라우저(HTML / CSS) <========= 자바 <============ 오라클
					|							|					|
					|							---------JDBC--------
					|							|
					----------------------------- JSP
				= 튜닝
					=> SELECT bookid, bookname, publisher
						FROM book
					=> I/O 감소, 
					-------------- 네트워크 속도 향상
			=> 요구사항 분석
					|
				데이터베이스 설계
					|
				데이터 수집
					|
				화면 UI
					|
				   구현
					|
				  테스트
					|
				   배포
		
				2) 조건 ( 149page)
					WHERE 문장 뒤
					= 	연산자
						비교 연산자
						논리 연산자 : AND / OR
									 && : Scanner
									 || : 문자열 결함
									
						BETWEEN ~ AND : 범위 => 체크인 / 체크 아웃, 페이징
										| MySQL => LIMIT
						IN : OR가 여러개 있는 경우
							=> 동적 쿼리 (MyBatis) => 필터
						NOT : 부정 => NOT IN, NOT BETWEEN, NOT LIKE
						LIKE : 유사 문자열 검색
								REGEXP_LIKE()
						NULL : 데이터 NULL인 경우에는 연산 처리가 안된다
								IS NULL / IS NOT NULL
						1) 	SELECT *
							FROM book
							WHERE price > 2000;
							= 전체 스캔 => * : 컬럼 리스트
							= 불필요한 행을 읽을 수 있다
							  -----------
								=> 인덱스 활용 가능
							CREATE INDEX idx_book_price ON book(price);
							DROP INDEX idx_book_price;
							SELECT * => 인덱스 활용이 어렵다
						= 컬럼 리스트를 이용
						= 많이 검색으로 사용되는 컬럼이 있는 경우 : 인덱스
						
						EXPLAIN PLAN FOR
						SELECT * FROM book;
						
						SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());
							
						TABLE ACCESS FULL
						=> INDEX RANGE SCAN
						=> 코드 리뷰 / 리펙토링
							
						EXPLAIN PLAN FOR
						
						SELECT bookid, bookname, price
						FROM book
						WHERE publisher = '굿스포츠';
							
						SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());
							
						CREATE INDEX idx_book_publisher ON book(publisher);
							
						=> BETWEEN ~ AND
						10000이상 ~ 20000원 이하
						SELECT bookid, bookname, publisher, price
						FROM book
						WHERE price BETWEEN 10000 AND 20000;
							  ------ 컬럼 (Index)
						
						-- WHERE price >= 10000 AND 20000
						-- 검색 / 조건에서 많이 사용되는 컬럼
						DESC menupan_food;
							
							
					IN 연산자 => 151page
					--------------------
					3-6 
						출판사 굿 스포츠 / 대한미디어
							   --------------------
							   OR / IN
						SELECT bookid, bookname, publisher, price
						FROM book
						WHERE publisher ='굿스포츠' OR publisher = '대한미디어';
						
						=>IN
							SELECT bookid, bookname, publisher, price
							FROM book
							WHERE publisher IN('굿스포츠' , '대한미디어');
						
							=> foreach => 

							=> 다중값 비교 (IN)
							=> 인덱스 활용
							IN 내부값이 많은 경우 => 실제로는 OR조건 변환 후 처리
							=> 이론상으로는 이런 경우에 속도가 빠르다

						LIKE : 유사 문자열 찾기
						-----------------------
						=> name LIKE '%값%' => 인덱스 적용 x
						=> name LIKE '값%' => 인덱스 적용 x
						=> REGEXP_LIKE(name,'값')
						
						WHERE address LIKE '%서교%'
							OR address LIKE '%동교%'
							OR address LIKE '%신촌%'
							OR address LIKE '%홍대%'
						WHERE REGEXP_LIKE(address, '서교|동교|신촌|홍대')
						
					152page
					LIKE
						SELECT bookname, publisher
						FROM book
						WHERE bookname LIKE '축구의 역사';
						
						SELECT bookname, publisher
						FROM book
						WHERE REGEXP_LIKE(bookname, '축구의 역사');
						=> 단일 연산자를 사용한다
						
						153page LIKE
						= % => 문자열 길이를 모르는 경우
						= _ => 문자 1글자
						
						%데이터% => 인덱스 적용 x
						데이터% => 인덱스 적용
						_데이터% => 부분적으로 인덱스
						_앞에 있으면 적용
						
						SELECT bookname, publisher
						FROM book
						WHERE bookname LIKE '%축구%';
						
						SELECT bookname, publisher
						FROM book
						WHERE bookname LIKE '축구%';
						
					=> 인덱스 활용 => 시작 문자열
					=> REGEXP_LIKE => 중간에 포함
					
					1) 인덱스 활용
					2) 컬럼은 출력에 필요한 컬럼만 선택
					3) OR가 많은 경우에는 IN 사용시에 속도가 늦다
					4) LIKE => 데이터% => startsWith 사용
					
					=> TALBE ACCESS FULL
					=> INDEX RANGE SCAN
					
					
					핵심)
						튜닝 : SQL 실행 속도의 최적화
						=> SELECT의 형식과 순서
						=> 조건 => 연산자
						=> BETWEEN / IN / NOT / NULL / LIKE
						=> SELECT의 핵심
							JOIN / SUBQUERY / 내장함수
						
						-----------------------------------
						JOIN : 데이터 추출 (여러개의 테이블로부터)
							= INNER JOIN(교집합) => 같은 값, 포함된 값
								= null 이있는 경우에는 제외
								= EQUI_JOIN
								= NON_EQUI_JOIN
								
							= OUTER JOIN(교집합 + MINUS)
								= LEFT OUTER JOIN
								= RIGHT OUTER JOIN
								
						SUBQUERY : SQL 문장을 통합
							= SUBQUERY : WHERE에 조건에 해당되는 값
								= 단일 행 : 비교 연산자
								= 다중 행 : IN/ANY/ALL
											  ---------MIN/MAX
								
							= INLINE VUE : 테이블 대신 사용
											FROM 뒤에
							
							= 스칼라 서브쿼리 : 컬럼 대신 사용
												SELECT 뒤에
						
						=> 내장 함수 : SELECT 
						
						
						
						
						
						
						
*/