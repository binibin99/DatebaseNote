-- 14_테이블 생성.sql
/*
 # CRUD
    
    - 대부분의 프로그램들이 가지고 있는 기본적인 기능들
    - Create (데이터 생성)
    - Read   (데이터 읽기)
    - Update (데이터 수정)
    - Delete (데이터 삭제)
    
    # DML (Data Mainpulate Language, 데이터 조작어)
    
    - 테이블의 데이터를 조작하는 명령어들
    - INSERT : 테이블에 데이터 추가하기 (Create)
    - SELECT : 테이블의 데이터 읽기 (Read)
    - UPDATA : 테이블의 데이터 수정하기 (Updata)
    - DELETE : 테이블의 데이터 삭제하기 (Delete)


    #  DDL (DATA Definition Language, 데이터 정의어)
    
    - 다양한 DB 오브젝트를 정의하는 명령어들
    (* DB 오브젝트 : 테이블, 시퀀스, 뷰, 인덱스, 계정 ...)
    - CREATE : DB 오브젝트 생성(C)
    - ALTER : DB 오브젝트 수정(U)
    - DROP : DB 오브젝트 삭제 (휴지통에서 복구 가능)(D)
    - TRUNCATE : DB 오브젝트 완전 삭제 (복구 불가능) (D)   
    
    # DCL (DATA Comtrol Language, 데이터 제어 명령어)
    
    - 데이터의 흐름을 제어하기 위해 사용하는 명령어들
    - GRANT : 권한부여(권한이 없으면 데이터 접근을 막는다)
    - REVOKE : 권한 회수
    - ROLLBACK : 작업 되돌리기
    - COMMIT : 작업 확정짓기(롤백이 불가능한 상태로 만들기)
*/

/*

    # 테이블 생성하기 
    
    CREATE TABLE 테이블명(컬럼1, 컬럼타입1, 컬럼2, 컬럼타입2, ....)

*/

CREATE TABLE fruits(
    fruit_name VARCHAR2(30),
    fruit_price NUMBER(6),
    fruit_grade VARCHAR(2),
    country_id CHAR(2)
);
DESC fruits;
SELECT * FROM  countries;

-- # 테이블 삭제 : DROP TABLE 테이블명;
DROP TABLE fruits;

-- DROP으로 삭제된 DB 오브젝트는 휴지통에서 확인할 수 있다
SHOW recyclebin;

-- 휴지통에 있는 테이블 복원하기
FLASHBACK TABLE fruits TO BEFORE DROP;

-- 휴지통 비우기
PURGE recyclebin;

-- 기존 테이블을 복사하여 새 테이블 만들기
CREATE TABLE employees2 AS (SELECT * FROM employees);

-- 테이블의 데이터 및 구조가 함께 복사된다
SELECT * FROM empolyees2;
DESC empolyees2;

-- 여러가지 테스트를 마음놓고 할 수 있다
SELECT * FROM empolyees2 INNER JOIN departments USING (department_id);

-- 테이블 구조만 복사하기 (데이터는 복상하고 싶지 않을 때)
CREATE TABLE employees3 AS (SELECT * FROM empolyees WHERE 1=0);

-- 일부러 거짓 조건을 사용하여 테이블의 구조만 복사하였다
DESC employees3;
SELECT * FROM employees3;

-- TRUNCATE TABLE 테이블명 : 구조만 남기고 모든 내용을 잘라버린다
TRUNCATE TABLE employees2;
SELECT * FROM employees2;
DESC employeess;

DROP TABLE employees2;
DROP TABLE employees3;
PURGE recyclebin;


/*
    저번에 설계했던 1:N 관계의 개체들을 테이블로 생성해 보세요
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
    (1) 사원과 부서처럼 1:N 관꼐로 설정할 수 있는 실제 사례를 하나 생각해보세요
        
        축구팀 - 축구선수
        
    (2) 1:N 관계로 설정한 각 개체를 테이블 형태로 설계해보세요
  
        - 테이블 이름 : 축구팀
        - 컬럼명 : 팀번호(PK)/팀이름(VARCHAR2)/구단주(VARCHAR2)/홈 경기장(NUMBER)/수익...   
        - 각 컬럼의 타입 
        - 기본키 컬럼 : 팀번호
        - 외래키 컬럼 : 경기장번호
        
        - 테이블 이름 : 경기장
        - 컬럼명 : 경기장번호(PK)/수용인원/주소/경기장타입/...
        - 컬럼 타입 : NUMBER / NUMBER / VARCHAR2 / CHAR/ ....
        - 기본키 컬럼 : 경기장번호
        - 외래키 컬럼 : X
        
        - 테이블 이름 : 축구선수
        - 컬럼명 : 선수번호(PK) / 이름 / 나이 / 포지션 / 국적(FK) / 소속팀(FK) 
        - 컬럼 타입 : NUMBER / VARCHAR2 / NUMBER / CHAR / NUMBER
        - 기본키 컬럼 : 선수번호
        - 외래키 컬럼 : 국적, 소속팀 번호
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
    team_leader_id NUMBER(8), -- 1:1 관계이지만 외래키를 사용하는 경우
    home_stadium_id NUMBER(5)
);
CREATE TABLE SoccerPlayer(
    player_id NUMBER(8),
    player_eng_name VARCHAR2(25), -- 영어는 한 글자가 1바이트 정도 차지한다
    player_kor_name VARCHAR2(40), -- 한글은 한 글자가 3바이트 정도 차지한다
    player_position VARCHAR2(3),
    plater_back_number NUMBER(2),
    country_id CHAR(2), -- Countries 테이블로부터 땡겨올 외래키
    team_id NUMBER(5) -- SoccerTeam 테이블로부터 땡겨올 외래키
);














