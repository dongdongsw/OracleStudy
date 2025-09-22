-- 8장 =========> 웹 프로그램 제작시 응용

/*
	3장 : SELECT => 데이터 검색
			ㄴ JOIN / SUBQUERY
			ㄴ 연산자
			
	4장 : 내장 함수 / DDL (CREATE, ALTER, DROP, RENAME, TRUNCATE)
			ㄴ DML (INSERT , UPDATE , DELETE)
			
	5장 : PL / SQL (FUNCTION , PROCEDURE , TRIGGER)
	
	6장 : ER-MODEL (관계 1:1, 1:N, N:M)
	
	7장 : 정규화
			1 정규화 => 원자값(컬럼은 단일 값 우선)
			2 정규화 => 중복 제거
			3 정규화 => 컬럼 => 모든 ROW의 컬럼을 제어
			
	8장 : 트랜잭션
			ㄴ 일괄처리
			ㄴ 오라클 일괄처리 => 자바(AUTO COMMIT)
									ㄴ 여러개의 SQL을 동시에 처리(commit 해제)
			try{
					연결
					conn.setAutoCommit(false)
					INSERT => COMMIT
					UPDATE => COMMIT
					INSERT => COMMIT
					INSERT => COMMIT (여기 뒤에서 커밋을 날려야 이상현상이 생기지  않음)
				}
			catch(Exeption ex){
					ROLLBACK
				}
				COMMIT 수행
					ㄴ INSERT / UPDATE / DELETE => 오라클 데이터 변경이 되는 상태
					ㄴ COMMIT이 수행이되면 ROLLBACK은 사용할 수 없다
					ㄴ 자동
						CREATE / DROP / ALTER / TRUNCATE
				ROLLBACK 수행
					ㄴ 지정 : SAVEPOINT (특정 지점을 저장) => 부분 ROLLBACK
					
	
	
	
	
	
	
	
*/

/*
CREATE TABLE emp_tr
AS
	SELECT empno, ename, job, sal, deptno
	FROM emp
	WHERE 1=2;
	*/

/*	
INSERT INTO emp_tr VALUES(100,'홍길동','대리', 3500,10);
	ㄴ 커밋을 하지 않으면 실제 메모리 저장된 상태가 아니다
COMMIT;
*/

/*
ROLLBACK
	ㄴ 커밋을 하면 롤백은 안된다
*/

/*
SELECT * FROM emp_tr;
*/

/*
INSERT INTO emp_tr VALUES(101,'박문수','과장', 4000,20);
SAVEPOINT sp1;
INSERT INTO emp_tr VALUES(102,'심청이','부장', 6000,30);
ROLLBACK TO sp1; 
-- 심청이 INSERT는 실행해도 sp1로 돌아가라는 느낌이라 저장이 안됨
COMMIT;
*/

/*
SELECT * FROM emp_tr;
*/

/*
UPDATE emp_tr SET sal=5000 WHERE deptno = 10;
SAVEPOINT sp1;
UPDATE emp_tr SET sal=sal+200 WHERE deptno = 20;
SAVEPOINT sp2;
UPDATE emp_tr SET sal=sal+300 WHERE deptno = 30;
ROLLBACK TO sp2;

COMMIT;
SELECT * FROM emp_tr;
*/

/*
COMMIT => 영구적인 저장
ROLLBACK => 취소 (명령어 취소 => INSERT / UPDATE/ DELETE)
SAVEPOINT => 취소 위치 => ROLLBACK TO savepoint명

=> Spring => 메소드위에 @Transactional => AOP
*/
-- 답변형 게시판
-- 테이블 제작

/*	
					no 	group	step 	tab
	AAAAAAA			1	  1		  0		 0
	  => BBBBBBB	2	  1		  1	 	 1
		=> CCCCCCC	3	  1		  2		 2
	DDDDDDD			4	  2		  0 	 0




*/


/*
CREATE SEQUENCE jjim_jno_seq
    START WITH 1
    INCREMENT BY 1
    NOCYCLE
    NOCACHE;
*/



















