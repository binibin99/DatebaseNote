-- 15_데이터 추가,수정,삭제.sql

/*
    # 테이블에 데이터 추가하기
    
    - INSERT INTO 테이블명 (컬럼1,컬럼2,...) VALUES(값1,값2,....);
    - INSERT INTO 테이블명 VALUES(반드시 모든 컬럼값을 순서대로);
*/

drop table fruits;

CREATE TABLE fruits (
    fruit_id NUMBER(6),
    fruit_name  VARCHAR2(30),
    fruit_price NUMBER(6),
    fruit_grade VARCHAR2(2),
    country_id  CHAR(2) NOT NULL
);

CREATE SEQUENCE fruits_seq
                   START WITH 1 -- 시작 번호 설정
                   INCREMENT BY 1  -- 증가 숫자 설정
                    NOCYCLE -- 숫자 순환 여부 설정
                    NOCACHE; -- 번호를 미리 만들어놓을 양을 설정

SELECT
    *
FROM
    fruits;

INSERT INTO fruits (
    fruite_id,
    fruit_name,
    fruit_price,
    fruit_grade,
    country_id
) VALUES (
    '1',
    'Apple',
    1300,
    'A+',
    'KR'
);

-- # iNSERT시에 컬럼 순서를 꼭 지킬 필요는 없다
--   컬럼 순서를 바꿨다면 값의 순서도 바꿔야 한다;
INSERT INTO fruits (
    country_id,
    fruit_grade,
    fruit_price,
    fruit_name
) VALUES (
    'AU',
    'SS',
    2800,
    'Banana'
);

SELECT
    *
FROM
    fruits;
-- # INSERT시에 컬럼을 모두 적지 않을 수 있다
--   단, 적지 않은 컬럼에는 행 추가시 자동으로 null이 들어간다
--   적지 않은 컬럼이 null을 허용하지 않는 컬럼인 경우 에러가 발생한다

--   hr.fruits.country_id에는 null값을 넣을 수 없다
--   생략한 컬럼인 fruit_grade와 fruit_price에는  null이 들어갔다
INSERT INTO fruits (
    fruit_name,
    country_id
) VALUES (
    'Grape',
    'FR'
);

--   생략한 컬럼중 하나인 country_id에서  null을 허용하지 않아서 insert가 거부되었다
INSERT INTO fruits (
    fruit_name,
    fruit_price
) VALUES (
    'Grape',
    3000
);

-- # 컬럼명을 아예 생략하면 모든 커럼값을 순서대로 적어야 한다
INSERT INTO fruits VALUES (
    'Peach',
    1800,
    'A',
    'KR'
);

-- # 서브쿼리로 INSERT하기 (테이블 구조가 동일한 경우에만 가능)
INSERT INTO fruits
    (
        SELECT
            *
        FROM
            fruits
    );

/*
    # 테이블 데이터 수정하기
    
    - UPDATE 테이블명 SET 컬럼1 = 값1, 컬럼2 = 값2 ... WHERE 조건절;
    - 만약 조건을 지정하지 않으면 모든 행이 수정된다
    - 하나의 행만 수정하기 위해서 기본키와 함께 자주 활용된다
*/
COMMIT; -- 현재까지의 변경 사항을 저장한다 (DCL)

-- 조건을 지정하지 않으면 해당 테이블의 모든 행이 수정되므로 주의해야한다
UPDATE fruits
SET
    fruit_name = 'PineApple';

UPDATE fruits
SET
    fruit_name = 'PineApple',
    fruit_price = 5000
WHERE
    fruit_name = 'Apple';

ROLLBACK; -- 변경 사항을 모두 취소하고 가장 최근의 COMMIT 상태로 돌아간다 (DCL)


/*
    # 테이블 데이터 삭제하기
    
    - DELETE FROM 테이블명 WHERE 조건절;
    - 조건을 적지 않으면 해당 테이블의 모든 데이터가 삭제된다 (※ 주의)
*/

COMMIT;

-- 조건을 적지 않으면 모든 행이 삭제되므로 주의해야 한다
DELETE FROM fruits;

-- 조건을 적어야 원하는 행만 삭제할 수 있다
DELETE FROM fruits
WHERE
    fruit_grade IS NULL;

ROLLBACK;

SELECT
    *
FROM
    fruits
WHERE
    country_id = 'KR';

SELECT
    *
FROM
    fruits;

DROP TABLE fruits;

PURGE RECYCLEBIN;

-- 연습1 : 직접 설계하고 정의했던 테이블에 알맞은 데이터들을 넣어보세요

CREATE TABLE books (
    book_name           VARCHAR2(70),
    book_price          NUMBER(6),
    book_num            VARCHAR2(30),
    book_author         VARCHAR2(30),
    book_publisher      VARCHAR2(30),
    book_published_date VARCHAR2(10)
);

DROP TABLE books;

PURGE RECYCLEBIN;

COMMIT;

ROLLBACK;

INSERT INTO books VALUES (
    '트렌드 코리아 2024',
    19000,
    'ISBN : 9788959897179',
    '김난도 외 9명',
    '미래의 창',
    '2023/10/12'
);

INSERT INTO books VALUES (
    '더 마인드',
    19800,
    'ISBN : 9788901276571',
    '하와이 대저택',
    '웅진지식하우스',
    '2023/11/25'
);

INSERT INTO books 
VALUES(
    '퓨처 셀프',
    19800,
    'ISBN : 9791192389325',
    '벤저민 하디',
    '상상스퀘어',
    '2023/08/30'
);

INSERT INTO books 
VALUES(
    '기적의 자세요정',
    22000,
    'ISBN : 9791130646664',
    '자세요정',
    '다산라이프',
    '2023/10/12'
);

INSERT INTO books 
VALUES(
    '시대예보:핵개인의 시대',
    21000,
    'ISBN : 9791170610359',
    '송길영',
    '교보문고',
    '2023/09/25'
);

INSERT INTO books 
VALUES(
    '개미',
    15800,
    'ISBN : 9788932923581',
    '베르나르 베르베르',
    '열린책들',
    '2023/10/05'
);

SELECT * FROM books;

CREATE TABLE librarys (
    library_name   VARCHAR2(30),
    phone_number   VARCHAR2(30),
    librarian_name VARCHAR2(12),
    librarian_id   NUMBER(10),
    book_name      VARCHAR2(70),
    book_num       VARCHAR2(20)
);

DROP TABLE librarys;

PURGE RECYCLEBIN;

COMMIT;

ROLLBACK;

INSERT INTO librarys 
VALUES(
    '구리시인창도서관',
    '031-550-2936',
    '김영미',
    '00001',
    '트렌드 코리아 2024',
    'ISBN : 9788959897179'
);

INSERT INTO librarys 
VALUES(
    '구리시인창도서관',
    '031-550-2936',
    '김영미',
    '00001',
    '더 마인드',
    'ISBN : 9788901276571'
);

INSERT INTO librarys 
VALUES(
    '구리시인창도서관',
    '031-550-2936',
    '김영미',
    '00001',
    '퓨처 셀프',
    'ISBN : 9791192389325'
);

INSERT INTO librarys 
VALUES(
    '구리시인창도서관',
    '031-550-2936',
    '김영미','00001',
    '기적의 자세요정',
     'ISBN : 9791130646664'
);

INSERT INTO librarys 
VALUES(
    '구리시인창도서관',
    '031-550-2936',
    '김영미',
    '00001',
    '시대예보:핵개인의 시대',
    'ISBN : 9791170610359'
);

INSERT INTO librarys 
VALUES(
    '구리시인창도서관',
    '031-550-2936',
    '김영미',
    '00001',
    '개미',
    'ISBN : 9788932923581'
);

INSERT INTO librarys 
VALUES(
    '토평도서관',
    '031-550-8325',
    '이준경',
    '00002',
    '트렌드 코리아 2024',
    'ISBN : 9788959897179'
);

INSERT INTO librarys 
VALUES(
    '토평도서관',
    '031-550-8325',
    '이준경',
    '00002',
    '더 마인드',
    'ISBN : 9788901276571'
);

INSERT INTO librarys 
VALUES(
    '토평도서관',
    '031-550-8325',
    '이준경',
    '00002',
    '퓨처 셀프',
    'ISBN : 9791192389325'
);

INSERT INTO librarys 
VALUES(
    '토평도서관',
    '031-550-8325',
    '이준경',
    '00002',
    '기적의 자세요정',
    'ISBN : 9791130646664'
);

INSERT INTO librarys 
VALUES(
    '토평도서관',
    '031-550-8325',
    '이준경',
    '00002',
    '시대예보:핵개인의 시대',
    'ISBN : 9791170610359'
);

INSERT INTO librarys 
VALUES(
    '교문도서관',
    '031-550-2593',
    '김경희',
    '00003',
    '트렌드 코리아 2024',
    'ISBN : 9788959897179'
);

INSERT INTO librarys 
VALUES(
    '교문도서관',
    '031-550-2593',
    '김경희',
    '00003',
    '더 마인드',
    'ISBN : 9788901276571'
);

INSERT INTO librarys 
VALUES(
    '교문도서관',
    '031-550-2593',
    '김경희',
    '00003',
    '퓨처 셀프',
    'ISBN : 9791192389325'
);

INSERT INTO librarys 
VALUES(
    '교문도서관',
    '031-550-2593',
    '김경희',
    '00003',
    '기적의 자세요정',
    'ISBN : 9791130646664'
);

INSERT INTO librarys 
VALUES(
    '교문도서관',
    '031-550-2593',
    '김경희',
    '00003',
    '시대예보:핵개인의 시대',
    'ISBN : 9791170610359'
);

INSERT INTO librarys 
VALUES(
    '갈매도서관',
    '031-550-8999',
    '김정미',
    '00004',
    '트렌드 코리아 2024',
    'ISBN : 9788959897179'
);

INSERT INTO librarys 
VALUES(
    '갈매도서관',
    '031-550-8999',
    '김정미',
    '00004',
    '더 마인드',
    'ISBN : 9788901276571'
);

INSERT INTO librarys 
VALUES(
    '갈매도서관',
    '031-550-8999',
    '김정미',
    '00004',
    '퓨처 셀프',
    'ISBN : 9791192389325'
);

INSERT INTO librarys 
VALUES(
    '갈매도서관',
    '031-550-8999',
    '김정미',
    '00004',
    '기적의 자세요정',
    'ISBN : 9791130646664'
);

INSERT INTO librarys 
VALUES(
    '갈매도서관',
    '031-550-8999',
    '김정미',
    '00004',
    '시대예보:핵개인의 시대',
    'ISBN : 9791170610359'
);

SELECT * FROM librarys;

-- 연습2 : 두 테이블 이상을 JOIN하여 원하는 데이터를  조회해보세요
SELECT * FROM books;
SELECT * FROM librarys;


SELECT 
    l.book_name,
    l.book_num,
    library_name,
    phone_number
FROM  
    books b,
    librarys l
WHERE 
    b.book_num = l.book_num
    AND b.book_name = '개미';

    















