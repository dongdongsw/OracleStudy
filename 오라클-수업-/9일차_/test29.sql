-- ������ ����

/*
	1. ��������
		= ���� : CHAR(1 ~ 200byte), VARCHAR2(1~4000byte), CLOB
		= ���� : NUMBER = int / double NUMBER(2,1)
		= DATE
	2. ����
		CREATE TABLE table_name(
			�÷��� �������� [��������],
			�÷��� �������� [��������],
			�÷��� �������� [��������], => DEFAULT / NOT NULL
			[��������] ... // PK, UK, CK, FK
		)
	3. �÷� ���� = �������� Ȯ�� = ���̺� ����
								------------- �ߺ� ���� / ���ϰ� ����
	
	4. ����
		�̹���(Main)  / �̹��� ������
		��ü�� / ���� / ��ȭ / �ּ� / ���� / �׸� / ���� �ð� / ���� / �Ұ�
			���ݴ�
		
		

*/
/*
DROP TABLE myfood;
*/
/* 
CREATE TABLE menupan_food(
	fno NUMBER,
	name VARCHAR2(200) CONSTRAINT mf_name_nn NOT NULL,
	type VARCHAR2(100) CONSTRAINT mf_type_nn NOT NULL,
	phone VARCHAR2(20),
	address VARCHAR2(500) CONSTRAINT mf_address_nn NOT NULL,
	score NUMBER(2,1),
	theme CLOB,
	price VARCHAR2(50),
	time VARCHAR2(100),
	parking VARCHAR2(100),
	poster VARCHAR2(260) CONSTRAINT mf_poster_nn NOT NULL,
	images CLOB,
	content CLOB,
	hit NUMBER DEFAULT 0,
	CONSTRAINT mf_fno_pk PRIMARY KEY(fno)
);
 */
DROP SEQUENCE mf_fno_seq;

CREATE SEQUENCE  mf_fno_seq
	START WITH 1
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;
-- �̸� �˻� ����ȭ
/*
CREATE INDEX idx_mf_name;
CREATE INDEX idx_mf_type;
CREATE INDEX idx_mf_adress;
CREATE INDEX idx_mf_score;
CREATE INDEX idx_mf_hit;
*/

CREATE INDEX idx_mf_name ON menupan_food(name);

-- ���� ���� ����ȭ
CREATE INDEX idx_mf_type ON menupan_food(type);

-- �ּ� �˻�
CREATE INDEX idx_mf_adress ON menupan_food(adress);

-- ���� ����
CREATE INDEX idx_mf_score ON menupan_food(score);

-- ��ȸ�� (�α� ���� �˻�)
CREATE INDEX idx_mf_hit ON menupan_food(hit);


