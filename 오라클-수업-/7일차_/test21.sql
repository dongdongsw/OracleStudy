-- 3장 (SQL기본) -4장(SQL 고급)
/*
	179page ~ 
	----------
	1. DDL : 정의 언어
		생성, 수정, 삭제, 이름 변경, 데이터 잘라내기
		= 생성 : CREATE
			ㄴ ★★★TABLE : 데이터 저장 메모리 => 파일과 유사한 역할
			ㄴ CREATE TABLE
			ㄴ VIEW : 가상 테이블(보안, 단순한 SQL)
			ㄴ CREATE VIEW
			ㄴ ★★★★★SEQUENCE : 자동 증가 번호
			ㄴ CREATE SEQUENCE
			ㄴ INDEX : 검색의 최적화 => 정렬
			ㄴ CREATE INDEX
			ㄴ FUNCTION : 리턴형을 가지고 있는 함수 (내장함수)
					ㄴ 사용자 정의
			ㄴ CREATE FUNCTION
			ㄴ PROCEDURE : 기능만 수행
			ㄴ CREATE PROCEDURE
			ㄴ TRIGGER : 자동 이벤트 처리
			ㄴ CREATE TRIGGER
			
		= 수정 : ALTER
			ㄴ 추가(컬럼), 제약조건 ==> ADD
				ㄴ ALTER TABLE table_name ADD 컬럼명 데이터형 [제약조건]
			ㄴ 수정(컬럼), 제약조건 ==> MODIFY
				ㄴ ALTER TABLE table_name MODIFY 컬럼명 데이터형
										  ------ 데이터의 크기 변경
			ㄴ 삭제(컬럼), 제약 조건 ==> DROP
				ㄴ ALTER TABLE table_name DROp COLUMN 컬럼명
				
		= 삭제 : DROP 
			ㄴ DROP TABLE  table_name
			ㄴ DROP SEQUENCE seq_name
			
		= 이름 변경 : RENAME
			ㄴ RENAME old_name TO new_name
			   --------------------------- 테이블 변경
			ㄴ ALTER TABLE table_name RENAME COLUMN old_name TO new_name
		
		= 테이블은 유지 => 데이터만 지우는 방법
			ㄴ TRUNCATE
			ㄴ TRUNCATE TABLE table_name
		= DDL은 ROLLBACK이 없다 => 복구가 어렵다
		
		1. 테이블 제작
			1) 데이터형
				ㄴ 문자형 : 	CHAR(1 ~ 2000byte), VARCHAR2(1 ~ 4000byte)
							------------------	-----------------------
													ㄴ 가변 바이트 : 일반적으로 가장많이 사용 됨
								ㄴ 고정 바이트(글자수가 동일한 경우)
							CLOB(4기가) : 글자수가 많은 경우 : 댓글, 내용, 줄거리
							오라클은 한글 한글자당 3byte
							글자수를 지정 => 범위를 벗어나면 데이터 추가가 안됨
				
				ㄴ 숫자형 : NUMBER  => 38자리
						ㄴ int / long / double
						ㄴ default 주로 사용 : NUMBER => NUMBER(8,2)
				
				ㄴ 날짜형 : DATE, TIMESTAMP
							ㄴ 시간, 분, 초, 날짜
							
				ㄴ 매칭
					ㄴ  오라클 		자바
						CHAR
						VARCHAR2
						CLOB		String
						NUMBER		int / double
						DATE		java.util.Date
						BFILE/BLOB 	java.io.InputStream
						----------폴더(이미지, 동영상 ..)
						
			2) 테이블, 컬럼명의 식별자
				ㄴ 문자로 시작한다(알파벳, 한글)
										 ---- 운영체제마다 한글 처리가 다르다
										 ---- 소프트웨어 이행
										 
				ㄴ 알파벳은 대소문 구분을 하지 않는다
				
				ㄴ 실제로 오라크클에 저장될 때 => 대문자 저장
				
				ㄴ TABLE 저장 	=> user_tables
				
				ㄴ 제약조건		=> user_constraints
				
				ㄴ VIEW			=> user_views
				
				-------------------------------------확인
				ㄴ table, column의 글자수 => 30byte => 5 ~ 10
					ㄴ 컬럼명과 테이블 명은 동일 할 수 있다
					ㄴ 같은 데이터베이스(XE)에서는 table은 유일 값이다
					ㄴ 키워드는 사용이 불가능
						ㄴ SELECT, INSERT, UPDATE, JOIN, ORDER BY...
					ㄴ 숫자를 사용할 수 있다(앞에 사용할 수 없다)
					ㄴ 특수문자 사용(_)
						ㄴ 단어가 두개이상일 경우
						ㄴ goods_info => goodsInfo
				
			3) 제약 조건 : 이상현상을 방지(수정, 삭제할 때 원하지 않는 데이터에 영향이 있다)
				ㄴ 1 홍길동 서울
				ㄴ 2 홍길동 경기
				ㄴ 3 홍길도 부산
				ㄴ NOT NULL : 반드시 입력값이 필요한 경우
					ㄴ 필수 입력, 메세지 창
					ㄴ "(null) ,'' (space)
					
				ㄴ UNIQUE : 중복이 없는 데이터
					ㄴ 후보키 : 전화번호, 이메일 ...
					
				ㄴ NOT NULL + UNIQUE : 기본키 => PRIMARY KEY
					ㄴ 데이터의  무결성
					ㄴ 자동 증가 번호, 아이디(중복체크)
					   --------------- SEQUENCE
					   
				ㄴ FOREIGN KEY : 다른 테이블을 연결
					ㄴ JOIN / 외래키(참조키)
					
				ㄴ CHECK : 지정 데이터만 사용
					ㄴ 장르, 구분, 직위, 근무지 ...
					
				ㄴ DEFAULT : 데이터가 입력이 안된 경우 처리하는 데이터
					ㄴ SYSDATE, 0, 사용자 / 관리자
					
			형식)
				CREATE TABLE table_name(
					컬럼명 데이터형 [제약조건], => DEFAULT / NOT NULL
					컬럼명 데이터형 [제약조건],
					컬럼명 데이터형 [제약조건],
					[제약조건], => CHECK, FK, PK, UK
					[제약조건]
					);
					
	2. DML : ROW 단위 처리
		ㄴ 데이터 조작언어
			ㄴ INSERT : 추가
				1) 전체 데이터 추가, DEFAULT 포함
					ㄴ INSERT INTO table_name VALUES(값, 값...)
								   ---------- 테이블의 컬럼 순서로
								   ---------- 문자, 날짜 => "
								   
				2) 지정된 데이터만 추가 : DEFAULT, NULL 허용
					ㄴ INSERT INTO table_name(컬럼,컬럼...)
					ㄴ VALUES(값, 값...)
						ㄴ 글쓰기, 회원 가입, 예약, 결제...
						
			ㄴ UPDATE : 수정 => 형식이 1개
				ㄴ UPDATE table_name SET
				ㄴ 컬럼 = 값, 컬럼 = 값, 컬럼 = 값
				ㄴ [조건] WHERE 조건
					ㄴ 글수정, 회원수정, 예약 변경
					
			ㄴ DELETE : 삭제 => 형식이 1개
				ㄴ DELETE FROM table_name
				ㄴ [WHERE 조건]
					ㄴ 글삭제, 회원탈퇴, 예약취소, 결제 취소 ...
			ㄴ 웹 개발자 => SELECT, INSERT, UPDATE, DELETE
*/
/* 
DROP TABLE student;
 */
 /*
	제약조건 : 한개의 테이블에 동시에 저장 => 중복이 되면 오류 발생
			  ----------- user_constraints
			  
	1) 테이블 제작
		= 데이터 추출 : 어떤 데이터를 저장할 지
		= 데이터 형 확인
		= 제약 조건
			NOT NULL => 컬럼 뒤에서
			DEFAULT
			PK, FK, CK, UK
			  
*/
/* 
CREATE TABLE student(
	hakbun NUMBER,
	name VARCHAR2(51) CONSTRAINT std_name_nn NOT NULL,
	kor NUMBER(3),
	eng NUMBER(3),
	math NUMBER(3),
	regdate DATE DEFAULT SYSDATE,
	CONSTRAINT std_hakbun_pk PRIMARY KEY(hakbun),
	CONSTRAINT std_kor_ck CHECK(kor >= 0 AND kor <= 100),
	CONSTRAINT std_eng_ck CHECK(eng >= 0 AND eng <= 100),
	CONSTRAINT std_math_ck CHECK(math >= 0 AND math <= 100)
	);
 */
/* 
SELECT * FROM user_constraints
WHERE table_name = 'STUDENT';
	제약조건 명
		C(NN, CK) / P(PK) / R(FK)
 */
 
-- INSERT => hakbun은 자동으로 증가
-- MAX
/* 
INSERT INTO student VALUES((SELECT NVL(MAX(hakbun)+1,100) FROM student),
'홍길동', 90, 90, 80, SYSDATE);
 */
 /* 
INSERT INTO student(hakbun,name,kor,eng,math)
VALUES((SELECT NVL(MAX(hakbun)+1,100) FROM student),
'심청이', 80, 90, 70);
INSERT INTO student(hakbun,name,kor,eng,math)
VALUES((SELECT NVL(MAX(hakbun)+1,100) FROM student),
'이순신', 82, 92, 72);
INSERT INTO student(hakbun,name,kor,eng,math)
VALUES((SELECT NVL(MAX(hakbun)+1,100) FROM student),
'강감찬', 83, 93, 73);
INSERT INTO student(hakbun,name,kor,eng,math)
VALUES((SELECT NVL(MAX(hakbun)+1,100) FROM student),
'박문수', 85, 95, 75);

COMMIT;
 */
/* 
SELECT hakbun, name, kor, eng, math, kor + eng + math "total",
	ROUND((kor + eng + math) /3.0,2) "avg",
	RANK() OVER(ORDER BY(kor + eng + math) DESC) "rank"
FROM student;

 */

-- 점수 수정
/* 
UPDATE student
SET kor = 95, eng = 90, math = 89;
SELECT * FROM student;

ROLLBACK;

SELECT * FROM student;
 */
 /* 
select * from student;

UPDATE student
SET kor = 95, eng = 90, math = 89
WHERE hakbun=103;

COMMIT;

select * from student;
 */

-- 삭제
/* 
DELETE FROM student
WHERE MOD(hakbun,2) = 1;

select * from student;

ROLLBACK;

select * from student;
 */

/*
	DELETE : 삭제
	--------------------COMMIT
	=> executeQuery => SELECT
	=> executeUpdate => commit() =>< INSERT / UPDATE / DELETE
	
	형식)
		UPDATE table_name
		SET 컬럼 = 값 , 컬럼 = 값.. : 컬럼 데이터형 => 문자 날짜 => '값'
		[WHERE 조건문]
		
		DELETE FROM table_name 
		[WHERE 조건문]
*/





























