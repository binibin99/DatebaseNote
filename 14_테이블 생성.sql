-- 14_���̺� ����.sql
/*
 # CRUD
    
    - ��κ��� ���α׷����� ������ �ִ� �⺻���� ��ɵ�
    - Create (������ ����)
    - Read   (������ �б�)
    - Update (������ ����)
    - Delete (������ ����)
    
    # DML (Data Mainpulate Language, ������ ���۾�)
    
    - ���̺��� �����͸� �����ϴ� ��ɾ��
    - INSERT : ���̺� ������ �߰��ϱ� (Create)
    - SELECT : ���̺��� ������ �б� (Read)
    - UPDATA : ���̺��� ������ �����ϱ� (Updata)
    - DELETE : ���̺��� ������ �����ϱ� (Delete)


    #  DDL (DATA Definition Language, ������ ���Ǿ�)
    
    - �پ��� DB ������Ʈ�� �����ϴ� ��ɾ��
    (* DB ������Ʈ : ���̺�, ������, ��, �ε���, ���� ...)
    - CREATE : DB ������Ʈ ����(C)
    - ALTER : DB ������Ʈ ����(U)
    - DROP : DB ������Ʈ ���� (�����뿡�� ���� ����)(D)
    - TRUNCATE : DB ������Ʈ ���� ���� (���� �Ұ���) (D)   
    
    # DCL (DATA Comtrol Language, ������ ���� ��ɾ�)
    
    - �������� �帧�� �����ϱ� ���� ����ϴ� ��ɾ��
    - GRANT : ���Ѻο�(������ ������ ������ ������ ���´�)
    - REVOKE : ���� ȸ��
    - ROLLBACK : �۾� �ǵ�����
    - COMMIT : �۾� Ȯ������(�ѹ��� �Ұ����� ���·� �����)
*/

/*

    # ���̺� �����ϱ� 
    
    CREATE TABLE ���̺��(�÷�1, �÷�Ÿ��1, �÷�2, �÷�Ÿ��2, ....)

*/

CREATE TABLE fruits(
    fruit_name VARCHAR2(30),
    fruit_price NUMBER(6),
    fruit_grade VARCHAR(2),
    country_id CHAR(2)
);
DESC fruits;
SELECT * FROM  countries;

-- # ���̺� ���� : DROP TABLE ���̺��;
DROP TABLE fruits;

-- DROP���� ������ DB ������Ʈ�� �����뿡�� Ȯ���� �� �ִ�
SHOW recyclebin;

-- �����뿡 �ִ� ���̺� �����ϱ�
FLASHBACK TABLE fruits TO BEFORE DROP;

-- ������ ����
PURGE recyclebin;

-- ���� ���̺��� �����Ͽ� �� ���̺� �����
CREATE TABLE employees2 AS (SELECT * FROM employees);

-- ���̺��� ������ �� ������ �Բ� ����ȴ�
SELECT * FROM empolyees2;
DESC empolyees2;

-- �������� �׽�Ʈ�� �������� �� �� �ִ�
SELECT * FROM empolyees2 INNER JOIN departments USING (department_id);

-- ���̺� ������ �����ϱ� (�����ʹ� �����ϰ� ���� ���� ��)
CREATE TABLE employees3 AS (SELECT * FROM empolyees WHERE 1=0);

-- �Ϻη� ���� ������ ����Ͽ� ���̺��� ������ �����Ͽ���
DESC employees3;
SELECT * FROM employees3;

-- TRUNCATE TABLE ���̺�� : ������ ����� ��� ������ �߶������
TRUNCATE TABLE employees2;
SELECT * FROM employees2;
DESC employeess;

DROP TABLE employees2;
DROP TABLE employees3;
PURGE recyclebin;


/*
    ������ �����ߴ� 1:N ������ ��ü���� ���̺�� ������ ������
*/
CREATE TABLE book(
    book_name VARCHAR2(30),
    book_price NUMBER(6),
    book_num VARCHAR2(20),
    book_author VARCHAR2(10),
    book_publisher VARCHAR2(10)
);
CREATE TABLE library(
    library_name VARCHAR2(30),
    phone_number NUMBER(11),
    librarian_name VARCHAR2(12),
    librarian_id NUMBER(20),
    book_num VARCHAR2(20),
    book_name VARCHAR2(30)
);
/*
    (1) ����� �μ�ó�� 1:N ������ ������ �� �ִ� ���� ��ʸ� �ϳ� �����غ�����
        
        �౸�� - �౸����
        
    (2) 1:N ����� ������ �� ��ü�� ���̺� ���·� �����غ�����
  
        - ���̺� �̸� : �౸��
        - �÷��� : ����ȣ(PK)/���̸�(VARCHAR2)/������(VARCHAR2)/Ȩ �����(NUMBER)/����...   
        - �� �÷��� Ÿ�� 
        - �⺻Ű �÷� : ����ȣ
        - �ܷ�Ű �÷� : ������ȣ
        
        - ���̺� �̸� : �����
        - �÷��� : ������ȣ(PK)/�����ο�/�ּ�/�����Ÿ��/...
        - �÷� Ÿ�� : NUMBER / NUMBER / VARCHAR2 / CHAR/ ....
        - �⺻Ű �÷� : ������ȣ
        - �ܷ�Ű �÷� : X
        
        - ���̺� �̸� : �౸����
        - �÷��� : ������ȣ(PK) / �̸� / ���� / ������ / ����(FK) / �Ҽ���(FK) 
        - �÷� Ÿ�� : NUMBER / VARCHAR2 / NUMBER / CHAR / NUMBER
        - �⺻Ű �÷� : ������ȣ
        - �ܷ�Ű �÷� : ����, �Ҽ��� ��ȣ
*/
CREATE TABLE SoccerStadium(
    stadium_id NUMBER(5),
    stadium_name VARCHAR2(30),
    stadium_address VARCHAR(100)
);

CREATE TABLE SoccerTeam( 
    team_id NUMBER(5),
    team_name VARCHAR2(30),
    team_owner VARCHAR2(20),
    team_leader_id NUMBER(8), -- 1:1 ���������� �ܷ�Ű�� ����ϴ� ���
    home_stadium_id NUMBER(5)
);
CREATE TABLE SoccerPlayer(
    player_id NUMBER(8),
    player_eng_name VARCHAR2(25), -- ����� �� ���ڰ� 1����Ʈ ���� �����Ѵ�
    player_kor_name VARCHAR2(40), -- �ѱ��� �� ���ڰ� 3����Ʈ ���� �����Ѵ�
    player_position VARCHAR2(3),
    plater_back_number NUMBER(2),
    country_id CHAR(2), -- Countries ���̺�κ��� ���ܿ� �ܷ�Ű
    team_id NUMBER(5) -- SoccerTeam ���̺�κ��� ���ܿ� �ܷ�Ű
);














