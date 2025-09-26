-- 총정리 => 예제

/*
	1. 	교재
		데이터베이스 : 연관된 데이터를 모아서 체계적으로 관리 시스템
					  ------------
		DBMS : 데이터를 제어(CRUD)
				ㄴ DML(INSERT / UPDATE / DELETE / SELECT)
				ㄴ Oracle / Mysql / MariaDB
							---------------
							
		RDB : 관계로 테이블 연결 / 해당 데이터 저장
		------------
		DB 특징
			독립성 : 데이터와 프로그램이 독립적
			
			중복 최소화 : 데이터 정규화를 이용해서 중복 제거
				ㄴ 자바 (메소드, 클래스)
				ㄴ 테이블 : 클래스(vo,dto)
				
			무결성 : 데이터의 정확성 / 일관성 보장
					(이상현상 => 추가, 수정, 삭제)
					=> PRIMARY KEY
					=> 테이블에서는 1개 이상의 PRIMARY KEY 사용(권장)
						ㄴ 숫자 (SEQUENCE)
					=> 테이블 설계
						CREATE TABLE
						CREATE SEQUENCE
						CREATE INDEX
							ㄴ 리팩토링 : 알아보기 쉽게
							int a; => int kor;
			보안성 : 권한 부여 / 접근 제어 => Spring Security
					=> GRANT / CONNECT
					
		오라클 DB 구조 
			1) 논리적 구조
				테이블 : 실제 데이터 저장공간
						ROW / COLUMN으로 구성
								| 구분자
						| 실제 데이터가 저장
						2차원 형식으로 되어있다
						
				뷰 : SELECT 문장 저장해서 사용하는 가상 테이블
					=> 보안
					
				인덱스 : 검색 속도 향상, 정렬 속도 향상
				
				시퀀스 : 자동 증가 번호
				
				제약 조건 : 데이터 무결성 / 참조 무결성
						   ------------	  ----------
								PK			 FK
				
			2) 물리적 구조
				데이터 파일 : (Data File)
					ㄴ 실제 데이터 저장 : 이미지 형식
					
				제어파일 : DB 구조 정보
				
				테이블 스페이스 : 테이블 저장 용량
				
				로그 파일 : 트랜잭션 복구용
		SQL 기초
		--------
			1) DQL : 데이터 검색(SELECT)
				ㄴ 연산자 / 내장함수 / 조인 / 서브 쿼리
				
				ㄴ 형식)
					SELECT * | column_list
					FROM table_name | view_name | SELECT ~
					[
						WHERE 조건문 (연산자)
						GROUP BY 그룹 | 함수
						HAVING 그룹 => 집계함수
						ORDER BY 컬럼 | 함수					
						--------------------
						| 대량용 : INDEX 이용
					]
					ㄴ INDEX_ASC()
					ㄴ INDEX_DESC()
					ㄴ INDEX()
					
				ㄴ 연산자 
					ㄴ 비교 연산자 : <> = 같지 않다
					
					ㄴ 논리 연산자 : AND, OR
									& => Scanner, || => 문자열
									
					ㄴ IN : OR가 많은 경우에 주로 사용
						ㄴ WHERE  컬럼 IN(값...)
						
					ㄴ BETWEEN ~ AND : 기간
						ㄴ 포함하고 있다 >= AND <=
						
					ㄴ NOT : 부정 => NOT LIKE , NOT IN, NOT BETWEEN
					
					ㄴ NULL : 컬럼 값이 NULL 경우에는 연산처리가 안된다
							IS NULL, IS NOT NULL
					
					ㄴ LIKE : 포함 문자, 시작문자, 끝문자
						ㄴ '%문자%', '문자%', '%문자'
						ㄴ '%'||?||'%' (자바) => Oracle
						ㄴ CONCAT('%',?,'%') => Mysql
						
				ㄴ 내장 함수
					SUBSTR, INSTR, LENGTH, RPAD
					MOD, CEIL, ROUND
					SYSDATE, MONTHS_BETWEEN
					TO_CHAR, TO_DATE
							 -------- 예약일 => DATE
					NVL
					
				ㄴ JOIN : 한개 이상의 테이블을 연결해서 데이터 추출
					ㄴ INNER JOIN
						ㄴ EQUI_JOIN						
						ㄴ NON_EQUI_JOIN
					
					ㄴ OUTER JOIN(INNER JOIN + 알파)
								INTERSECT + MINUS
						ㄴ LEFT OUTER JOIN
						ㄴ RIGTH OUTER JOIN
						
				ㄴ SUBQUERY : 한개 이상의 SQL 문장을 통합	
						ㄴ 일반 서브 쿼리  : 조건의 값
							SELECT ~ => 4
							FROM table_name => 2
							WHERE 컬럼 연산자(SELECT ~)
											 --------
												1
								3
							=> 서브 쿼리가 다중값 => IN, MAX, MIN
							스칼라 서브쿼리
								=> SELECT 뒤에 컬럼 대신 사용
									SELECT 컬럼,
										(SELECT ~),
										------------ 반드시 결과 값이 1개
										------------ 단일 테이블 연결
									FROM table_name
									
							인라인 뷰 : 보안 
								ㄴ 페이징 => OFFSET
								ㄴ rownum : 오라클 ROW마다 번호 부여
									ㄴ 필요시마다 변경이 가능
								ㄴ 인기 순위 10, 공지사항  10
								
			2) DML : 데이터 조작 (INSERT, UPDATE, DELETE)
				ㄴ INSERT : 데이터 추가
					ㄴ 원하는 데이터만 추가
					   ------------ DEFAULT, NULL  허용한 컬럼
					   INSERT INTO table_name(컬럼,컬럼 ...)
					   VALUES(값,값...)
					   주의점 : 문자 : "
								날짜 : SYSDATE, 'YY/MM/DD'
							ps.setString() => "
					ㄴ 전체 데이터 추가
						
							INSERT INTO table_name
							VALUES(값...)
						** 테이블 생성시 컬럼순서로 추가
                        DESC table명 => 1 순서
                        => ~VO
						UPDATE : 데이터 수정
							UPDATE table_name
							SET 컬럼=값, 컬럼=값 ...
							[WHERE 조건]
						
						DELETE : 데이터 삭제
							DELETE FROM table_name
							[WHERE 조건]
							ㄴ DROP : 테이블을 완전 삭제
							ㄴ TRUNCATE : 테이블은 유지 => 데이터 전체 삭제
							-------------------- AUTO Commit(복구(x))
							ㄴ DELETE : 테이블 유지 => ROW 한개씩 삭제
							-------------------- COMMIT을 추가(복구(o))
							DML : COMMIT 수행
								ㄴ 오라클 자체에서는 수행
								ㄴ 자바에서 수행이 안된다
									ㄴ 메모리에서 데이터를 읽기
							
			3) DCL : 제어언어 (GRANT, REVOKE)
				ㄴ DBA 사용 : View / PS / SQL => 권한이 없다
				ㄴ 권한 계정 : system / sysdba
										| system 계정 처리
								| 일반 계정 처리
				ㄴ 오라클은 3번 이상 연결 => 접속이 안되는 경우
					ㄴ LOCK
					ㄴ conn system / 비번
					ㄴ ALTER USER hr ACCOUNT UNLOCK

				ㄴ 권한 부여
					ㄴ GRANT CREATE VIEW TO hr
					   -----			 --
					   
				ㄴ 권한 해제
					ㄴ REVOKE CREATE VIEW FROM hr
					   ------			  ----
			
				=> GRANT / REVOKE => system
				
			4) TCL : COMMIT , ROLLBACK, SAVEPOINT
				ㄴ 트랜잭션 : 일괄 처리
					ㄴ 여러개 SQL 문장을 이용해서 => 한개의 기능 완성
						ㄴ 한개의 문장마다 COMMIT 수행
							try{
								INSERT --> COMMIT
								UPDATE --> COMMIT
								DELETE --> COMMIT
								INSERT --> COMMIT
							
								conn.commit()
								
							} catch(EXCEPTION ex){
								conn.rollback()
							}
						
				ㄴ COMMIT : 정상적으로 메모리에 저장
					ㄴ executeUpdate()
						ㄴ commit()
						
					ㄴ MyBatis : session session = openConnection() : FALSE
									ㄴ SELECT
								 session session = openConnection(true)
									ㄴ DML
									
					ㄴ JPA : Auto => SAVE()
					
				ㄴ ROLLBACK : 비정상 종료 => 이전 SQL 문장을 취소
					ㄴ 전체 SQL문장 해제
					
				ㄴ SAVEPOINT : 지정된 위치로부터 취소 (부분적 취소)
				
			5) DDL : CREATE, ALTER, DROP, RENAME, TRUNCATE
				ㄴ CREATE : (객체) 생성
						ㄴ Table, View, Sequence, Function
						ㄴ Procedure, Trigger, Index
						
					Table : 저장 공간
						ㄴ 데이터형
							ㄴ 문자 : CHAR(1~2000), VARCHAR2(1~4000byte)
													 | 가변 바이트 (일반)
										| 고정바이트 (글자수가 동일)
									CLOB(4GB)
										| 자바 : String	
							ㄴ 숫자 : NUMBER => NUMBER(8,2) : DEFAULT 
							
							ㄴ 날짜 : DATE , TIMESTAMP
							ㄴ 동영상, 아이콘 : BLOB / BFILE
														| FILE 형태
												| 2진파일
									  -------------- InputStream
									  
						ㄴ 제약조건
							ㄴ PRIMARY KEY : ROW의 식별자 (결정자)
											중복 없는 데이터 / NULL 허용 (x)
											데이터 무결성(이상현상)
								user_constrains : constraint_name
								=> 테이블마다 이름이 다르게 설정
								CONSTRAINT 테이블명_컬럼명_pk PRIMARY KEY(컬럼)
								
							ㄴ FOREIGN KEY : 다른 테이블과 관계설정
											테이블 (컬럼)
								----------------------------------------------		
								CONSTRAINT 테이블명_컬럼명_fk FOREIGN KEY(컬럼)
								REFERENCES 참조테이블(컬럼)
								ON DELETE CASCADE
									댓글 / 묻고 답하기
									예약 / 결제 => 생략
								----------------------------------------------
							ㄴ UNIQUE : 중복없는 데이터 추가 (NULL값 허용)
										=> 아이디가 모르는 경우
										=> 후보키
								CONSTRAINT 테이블명_컬럼명_uk UNIQUE(컬럼)
								
							ㄴ CHECK : 지정된 데이터만 추가
								CONSTRAINT 테이블명_컬럼명_ck CHECK(컬럼 IN(...))
								
							ㄴ NOT NULL : null 값 허용하지 않는다
								ㄴ 반드시 컬럼뒤에 설정
								ㄴ 컬럼명 데이터형 CONSTRAINT 테이블명 테이블명_컬럼명_nn NOT NULL
								
							ㄴ DEFAULT
								ㄴ 반드시 컬럼뒤에 설정
								ㄴ 컬럼명 데이터형 DEFAULT 값
								
						ㄴ 테이블 생성 방법	
								1) 알파벳, 한글로 시작(권장 : 알파벳)
								2) 숫자 사용 (앞에 사용 금지)
								3) 특수 문자
								4) 키워드는 사용 금지
								5) 공백 사용 금지
								6) 30byte까지 사용
								7) 대소문자 구분은 하지 않는다
									ㄴ 실제 오라클에 저장 : 대문자로만 저장
								8) 모든 테이블명은 유일값
								------------
							CREATE TABLE table_name(
								컬럼명 데이터형 [제약조건], => NOT NULL, DEFAULT
								컬럼명 데이터형 [제약조건],
								컬럼명 데이터형 [제약조건],
								...,
								[제약조건], ==> PK,FK,CK,UK
								[제약조건]
								...
							);

					View : 기존의 테이블을 참조해서 만든 가상 테이블
							보안, sql 문장 단순화, 재사용
							= 저장 : sql문장
							= 복합뷰 : JOIN, SUBQUERY
							-------------------------------------
							수정과 동시 생성
							CREATE OR REPLACE View VIEW_NAME
							AS
								SELECT ~
							삭제
							DROP VIEW View_name
							
					Sequence : 자동 증가 번호(PRIMARY KEY)
						CREATE SEQUENCE 테이블명_컬럼명_seq
							START WITH 시작값 => .int a=1
							INCREMENT BY 증가값 => a++
							NOCACHE : 미리 생성이 없이 값 
							NOCYCLE : 다시 처음으로 오지 않는다
								ㄴ 무한대
								
					Function : 리턴형이 있는 함수
						ㄴ 조인 사용, 스칼라 서브쿼리
						ㄴ 	CREATE OR REPLACE FUNCTION func_name(매개변수..)
							RETURN  데이터형
							IS
								지역변수 설정
							BEGIN
								--- SQL 문장
								RETURN 값
							END;
							=> 삭제
							DROP FUNCTION func_name;
							
					Procedure : 기능만 수행 => 리턴형이 없다
								ㄴ 값을 받는 경우 OUT변수 설정
								ㄴ 댓글 => 모든 댓글
							CREATE OR REPLACE PROCEDURE pro_name(매개변수...)
							IS
								지역변수 설정
							BEGIN
								---- 처리
							END;
							=> INSERT / UPDATE / DELETE => IN
							=> SELECT => OUT
							=> 변수는 실제 테이블의 데이터형/크기 일치
								변수명 테이블명.컬럼%TYPE
								데이터 목록 =>  SYS_REFCURSOR
							=> PL / SQL
							
					Trigger : 가독성이 떨어진다 => 자동화 처리
							ㄴ ERP에서 주로 사용
						CREATE OR REPLACE TRIGGER tri_name
						(BEFORE | AFTER) (이벤트) ON 테이블명
								 INSERT / UPDATE / DELETE
						FOR EACH ROW
						BEGIN
							=> 자동화 처리
							   ---------- 테이블 제어
						END;
						
						=> 맛집 ==> 찜 / 좋아요
							++
						
					Index : 검색 속도 향상
						ㄴ JOIN에서 사용하는 컬럼
						ㄴ 대량의 데이터가 있는 경우 검색어로 사용하는 컬럼
						ㄴ NULL값이 많은 컬럼
						ㄴ 소량 / DML이 많은 경우 => 속도가 느리다
						ㄴ FK,PK => 자동 설정
						ㄴ 남발할 경우엔 비용 추가, 메모리 => 속도가 느리다
						CREATE INDEX idx_테이블_컬럼 ON 테이블(컬럼명)
						CREATE INDEX idx_테이블_컬럼 ON 테이블(컬럼명, 컬럼명 DESC)
						CREATE INDEX idx_테이블_컬럼 ON 테이블(UPPER(컬럼명))
															SUBSTR
						
						삭제 
							=> DROP INDEX index_명
							=> 정렬 속도
								INDEX(idx_테이블_컬럼) -> 사용자 정의
								INDEX_ASC() -> 
								INDEX_DESC()

				ㄴ ALTER : 수정이 필요한 경우
						ㄴ 추가 : ADD
						ㄴ 수정 : MODIFY
						ㄴ 삭제 : DROP COLUMN
						ㄴ 데이터가 이미 수집
						ㄴ 예) 맛집 => 크롤링
							likecount / jjimcount / reserveday / hit
							
				ㄴ DROP : 테이블을 완전 삭제
				
				ㄴ TRUNCATE : 데이터를 전부 삭제
				
				ㄴ RENAME : 테이블 이름 변경
			=> 테이블 생성 -> 데이터 조작 -> 검색 -> 제약조건 -> 고급 SQL
				
		SQL 튜닝
			=> 데이터베이스에서 SQL 문장 실행 => 성능 개선
			=> 응답 시간 단축 / 리소스 사용을 최소화, 동시성 향상
			=> 트랜잭션 : 예약 (동시성)
			=> 대상
				SQL : SELECT , JOIN, SUBQUERY, GROUP BY
				구조 : TABLE생성, 인덱스
			=> 성능 저하
				불필요한 전체 데이터 스캔
				------------------------ 인덱스가 적용이 안되는 경우
						1) *을 사용하지 않는다
						2) 필요한 컬럼만 가지고 온다
						3) LIKE -> '%데이터%' => '데이터%'
						4) 함수형 기반의 인덱스
						WHERE UPPER(ename) = 'KING'
						5) 비효율적인 JOIN / SUBQUERY 이용
									 ----   -------- 스칼라 서브쿼리 남발 방지
												| IN을 이용한 서브쿼리
												| NULL값을 포함
													ㄴ 한번에 처리 => JOIN이용
									 | 작은 테이블로부터 조인
									 | 불필요한 LEFT OUTER JOIN 제거
						6) 데이터량 적고 / DML이 많은 경우 => 인덱스(x)
						
						7) WHERE 조건 순서
							인덱스 컬럼 먼저 // 연산자가 복잡한 것을 나중에
							함수 사용 => 인덱스를 무력화 => 가능하면 함수 밖으로
							
						8)  DISTINCT 제거
							ORDER BY => INDEX
							ROWNUM =>  필요 행만 조회
							=> SQL 튜닝
						
						
		데이터베이스 설계
			ER - MODEL / 정규화 / 트랜잭션




*/