-- 179page 데이터 정의 언어

/*
	1. table : 실제 데이터 저장 공간
		ㄴ 데이터형
		ㄴ 정형화 : 출력에 필요한 데이터만 수집
		
	2. view : 가상 테이블
		ㄴ 실제 데이터를 저장하지 않고, SELECT 쿼리 결과를 이름 붙여 둔 것
		
	3. sequence: 자동 증가 번호
		ㄴ 주로 기본 키(PK) 값 자동 생성에 사용
	
	4. 시노님 : 테이블의 별칭
	
	5. ★★★INDEX : 속도를 최적화 => 검색 , 정렬
			ㄴ 단, 인덱스는 삽입/삭제 성능 저하 부작용이 있음
	6. PL/SQL
		ㄴ FUNCTION(함수), PROCEDURE(프로시저), TRIGGER(트리거)
												ㄴ  연쇄 반응 = 자동화 처리
													게시물 = 댓글
													입고 = 재고
													출고 = 재고
							ㄴ 메소드와 동일 (리턴 값이 필수는 아님)
							ㄴ 특정 작업을 수행하는 코드 블록
			ㄴ 리턴형이 있는 함수 (내장 함수) => SELECT
	-------------------------------------------------------
	데이터 베이스 설계(정규화 = 1,2,3 정규화)
		ㄴ	1정규화: 반복되는 속성 제거, 원자값 유지

			2정규화: 부분 함수 종속 제거 (복합키일 때)

			3정규화: 이행적 함수 종속 제거
	
	=> DML(Data Manipulation Language, 데이터 조작 언어)
		ㄴ (SELECT, INSERT, UPDATE, DELETE)
		ㄴ 테이블의 구조를 바꾸는게 아닌 테이블에 담긴 데이터만 조작
		
	1. DDL(Date Definition Language, 데이터 정의어) => 복구가 없다(COMMIT / ROLLBACK)
		ㄴ 테이블, 뷰, 시퀀스 같은 데이터베이스 객체 구조를 정의/수정/삭제 하는 언어
		ㄴ 명령어 : CREATE, ALTER, DROP, TRUNCATE, RENAME
		ㄴ 생성 
			ㄴ CREATE TABLE
			ㄴ CREATE VIEW
			ㄴ CREATE SEQUENCE
			ㄴ CREATE FUNCTION
			
		ㄴ 삭제
			ㄴ DROP TABLE
			ㄴ DROP VIEW
			ㄴ DROP SEQUENCE
			
		ㄴ 수정
			ㄴ ALTER TABLE table명 ADD 		=> 컬럼 추가
			ㄴ ALTER TABLE table명 MODIFY 	=> 컬럼 변경
			ㄴ ALTER TABLE table명 DROP 		=> 컬럼 제거
			
		ㄴ 잘라내기
			ㄴ TRUNCATE TABLE table_name
			
		ㄴ 이름변경
			ㄴ RENAME old_name TO new_name
			
		ㄴ 테이블 명
			ㄴ XE폴더에 저장 => 유일 값이 필요하다(중복할 수 없다)
			ㄴ 글자수 : 30자 내외
			ㄴ 특수문자 : _
			ㄴ 숫자 사용이 가능 : 앞에 사용이 금지
			ㄴ 알파벳이나 한글 사용
				----- 대소문자 구분이 없다
				----- 실제 메모리에 저장될때는 대문자로 저장된다
			
		ㄴ 형식)
			CREATE TABLE table_name(
				컬럼명 데이터형 [제약조건],
				컬럼명 데이터형 [제약조건],
				컬럼명 데이터형 [제약조건]
				);
				
				1) 컬럼 설정 : 어떤 데이터를 저장할 지 분석 = 요구사항
				
				2) 데이터형 
					ㄴ 문자 저장
						CHAR(1 ~ 2000byte) => 고정 바이트
							ㄴ 같은 크기의 데이터가 있는 경우
						VARCHAR2(1 ~ 4000byte) => 가변 바이트
							ㄴ 일반적으로 사용되는 문자
						CLOB 4기가 => 가변
							ㄴ 내용 / 줄거리...
							
					ㄴ 숫자 저장 
						NUMBER : 8자리
						NUMBER(4)
						NUMBER(2,1)
						
					ㄴ 날짜 저장
						DATE / TIMESTAMP
				
				3) 제약 조건
				   ---------
				   NOT NULL => 반드시 입력 값 있어야 함
				   
				   -------------------------------------------
				   
				   UNIQUE => 중복이 없는 값 => NULL값을 허용
				   ------ 전화번호 / 이메일 / 아이디 ...
				   
				   NOT NULL + UNIQUE : PRIMARY KEY (기본키)
				   => 숫자 / 아이디(모든 데이터 찾기)
				   --------------- 자동으로  INDEX
				   
				   FOREIGN KEY(외래키) : 참조키
					ㄴ 다른 테이블의 pk를 참조
					ㄴ 두 테이블의 관계 설정
					ㄴ member 		reverse
						id(PK)			예약번호
									   (FK)id => 값이 존재해야함
				   CHECK
					ㄴ 지정된 문자만 사용이 가능
						ㄴ 남자 / 여자 , 직위 / 지역 / 장르
					ㄴ 값의 범위/조건 제한
					
				   DEFAULT
					ㄴ 미리 값을 지정
					ㄴ 값이 입력되지 않으면 기본값 자동 입력
				   -------------------------------------------
					★한개만 사용하는 것이 아니라 여러개 사용이 가능
					
					실제 테이블 
					---------- 제약 조건에 대한 수정
					중요 : 테이블 한명 / 크롤링
					
					=> 컬럼 레벨 : 컬럼 생성과 동시에 제약조건이 저장
						ㄴ NOT NULL, DEFAULT, UNIQUE, CHECK
						
					=> 테이블 레벨 : 테이블이 생성 후에 제약조건 저장 
						ㄴ PK, FK, CK, UK
						
					**** 모든 제약 조건은 user_constaints안에 저장
										----------------
										
					=> CONSTRAINT는 제약조건을 붙이는 키워드
					
					CREATE TABLE table_name(
						컬럼명 데이터형 CONSTRAINT table명_컬럼명_nn NOT NULL,
						컬럼명 데이터형 DEFAULT 값,
						...,
						CONSTRAINT table명_컬럼명_pk PRIMARY KEY(컬럼),
						CONSTRAINT table명_컬럼명_uk UNIQUE(컬럼),
						CONSTRAINT table명_컬럼명_ck CHECK(컬럼 IN (....)),
						CONSTRAINT table명_컬럼명_fk FOREGIN KEY(컬럼),
						REFERENCES 참조할 테이블(컬럼)
						
					)
					
					
					
*/

/* 
SELECT *
FROM user_tables
WHERE table_name = 'EMP'; 
*/

/* 
CREATE TABLE A(
	name VARCHAR2(10) CONSTRAINT a_name_nn NOT NULL
);

CREATE TABLE B(
	name VARCHAR2(10) CONSTRAINT a_name_nn NOT NULL
); 
*/

/* 
DROP TABLE A;
 */
/*  
 CREATE TABLE A(
	name VARCHAR2(20) CONSTRAINT a_name_nn NOT NULL
 ); 
 */
 /* 
 DROP TABLE A;
  CREATE TABLE A(
	name VARCHAR2(20) CONSTRAINT a_name_nn NOT NULL,
	sex VARCHAR2(20) 
 );
 
ALTER TABLE A CONSTRAINT a_name_nn;

 INSERT INTO A VALUES('홍길동','남자');
 INSERT INTO A VALUES(',', '여자');
 INSERT INTO A VALUES(',', '남자');
 INSERT INTO A VALUES(',', '여자');
 INSERT INTO A VALUES('박문수', '남자');
 
CREATE TABLE A(
	name VARCHAR2(20) NOT NULL,
	sex VARCHAR2(20) NOT NULL 
 );
 */
 
