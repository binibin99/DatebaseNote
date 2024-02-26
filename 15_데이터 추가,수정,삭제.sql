-- 15_������ �߰�,����,����.sql

/*
    # ���̺� ������ �߰��ϱ�
    
    - INSERT INTO ���̺�� (�÷�1,�÷�2,...) VALUES(��1,��2,....);
    - INSERT INTO ���̺�� VALUES(�ݵ�� ��� �÷����� �������);
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
                   START WITH 1 -- ���� ��ȣ ����
                   INCREMENT BY 1  -- ���� ���� ����
                    NOCYCLE -- ���� ��ȯ ���� ����
                    NOCACHE; -- ��ȣ�� �̸� �������� ���� ����

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

-- # iNSERT�ÿ� �÷� ������ �� ��ų �ʿ�� ����
--   �÷� ������ �ٲ�ٸ� ���� ������ �ٲ�� �Ѵ�;
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
-- # INSERT�ÿ� �÷��� ��� ���� ���� �� �ִ�
--   ��, ���� ���� �÷����� �� �߰��� �ڵ����� null�� ����
--   ���� ���� �÷��� null�� ������� �ʴ� �÷��� ��� ������ �߻��Ѵ�

--   hr.fruits.country_id���� null���� ���� �� ����
--   ������ �÷��� fruit_grade�� fruit_price����  null�� ����
INSERT INTO fruits (
    fruit_name,
    country_id
) VALUES (
    'Grape',
    'FR'
);

--   ������ �÷��� �ϳ��� country_id����  null�� ������� �ʾƼ� insert�� �źεǾ���
INSERT INTO fruits (
    fruit_name,
    fruit_price
) VALUES (
    'Grape',
    3000
);

-- # �÷����� �ƿ� �����ϸ� ��� Ŀ������ ������� ����� �Ѵ�
INSERT INTO fruits VALUES (
    'Peach',
    1800,
    'A',
    'KR'
);

-- # ���������� INSERT�ϱ� (���̺� ������ ������ ��쿡�� ����)
INSERT INTO fruits
    (
        SELECT
            *
        FROM
            fruits
    );

/*
    # ���̺� ������ �����ϱ�
    
    - UPDATE ���̺�� SET �÷�1 = ��1, �÷�2 = ��2 ... WHERE ������;
    - ���� ������ �������� ������ ��� ���� �����ȴ�
    - �ϳ��� �ุ �����ϱ� ���ؼ� �⺻Ű�� �Բ� ���� Ȱ��ȴ�
*/
COMMIT; -- ��������� ���� ������ �����Ѵ� (DCL)

-- ������ �������� ������ �ش� ���̺��� ��� ���� �����ǹǷ� �����ؾ��Ѵ�
UPDATE fruits
SET
    fruit_name = 'PineApple';

UPDATE fruits
SET
    fruit_name = 'PineApple',
    fruit_price = 5000
WHERE
    fruit_name = 'Apple';

ROLLBACK; -- ���� ������ ��� ����ϰ� ���� �ֱ��� COMMIT ���·� ���ư��� (DCL)


/*
    # ���̺� ������ �����ϱ�
    
    - DELETE FROM ���̺�� WHERE ������;
    - ������ ���� ������ �ش� ���̺��� ��� �����Ͱ� �����ȴ� (�� ����)
*/

COMMIT;

-- ������ ���� ������ ��� ���� �����ǹǷ� �����ؾ� �Ѵ�
DELETE FROM fruits;

-- ������ ����� ���ϴ� �ุ ������ �� �ִ�
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

-- ����1 : ���� �����ϰ� �����ߴ� ���̺� �˸��� �����͵��� �־����

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
    'Ʈ���� �ڸ��� 2024',
    19000,
    'ISBN : 9788959897179',
    '�賭�� �� 9��',
    '�̷��� â',
    '2023/10/12'
);

INSERT INTO books VALUES (
    '�� ���ε�',
    19800,
    'ISBN : 9788901276571',
    '�Ͽ��� ������',
    '���������Ͽ콺',
    '2023/11/25'
);

INSERT INTO books 
VALUES(
    'ǻó ����',
    19800,
    'ISBN : 9791192389325',
    '������ �ϵ�',
    '�������',
    '2023/08/30'
);

INSERT INTO books 
VALUES(
    '������ �ڼ�����',
    22000,
    'ISBN : 9791130646664',
    '�ڼ�����',
    '�ٻ������',
    '2023/10/12'
);

INSERT INTO books 
VALUES(
    '�ô뿹��:�ٰ����� �ô�',
    21000,
    'ISBN : 9791170610359',
    '�۱濵',
    '��������',
    '2023/09/25'
);

INSERT INTO books 
VALUES(
    '����',
    15800,
    'ISBN : 9788932923581',
    '�������� ��������',
    '����å��',
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
    '��������â������',
    '031-550-2936',
    '�迵��',
    '00001',
    'Ʈ���� �ڸ��� 2024',
    'ISBN : 9788959897179'
);

INSERT INTO librarys 
VALUES(
    '��������â������',
    '031-550-2936',
    '�迵��',
    '00001',
    '�� ���ε�',
    'ISBN : 9788901276571'
);

INSERT INTO librarys 
VALUES(
    '��������â������',
    '031-550-2936',
    '�迵��',
    '00001',
    'ǻó ����',
    'ISBN : 9791192389325'
);

INSERT INTO librarys 
VALUES(
    '��������â������',
    '031-550-2936',
    '�迵��','00001',
    '������ �ڼ�����',
     'ISBN : 9791130646664'
);

INSERT INTO librarys 
VALUES(
    '��������â������',
    '031-550-2936',
    '�迵��',
    '00001',
    '�ô뿹��:�ٰ����� �ô�',
    'ISBN : 9791170610359'
);

INSERT INTO librarys 
VALUES(
    '��������â������',
    '031-550-2936',
    '�迵��',
    '00001',
    '����',
    'ISBN : 9788932923581'
);

INSERT INTO librarys 
VALUES(
    '���򵵼���',
    '031-550-8325',
    '���ذ�',
    '00002',
    'Ʈ���� �ڸ��� 2024',
    'ISBN : 9788959897179'
);

INSERT INTO librarys 
VALUES(
    '���򵵼���',
    '031-550-8325',
    '���ذ�',
    '00002',
    '�� ���ε�',
    'ISBN : 9788901276571'
);

INSERT INTO librarys 
VALUES(
    '���򵵼���',
    '031-550-8325',
    '���ذ�',
    '00002',
    'ǻó ����',
    'ISBN : 9791192389325'
);

INSERT INTO librarys 
VALUES(
    '���򵵼���',
    '031-550-8325',
    '���ذ�',
    '00002',
    '������ �ڼ�����',
    'ISBN : 9791130646664'
);

INSERT INTO librarys 
VALUES(
    '���򵵼���',
    '031-550-8325',
    '���ذ�',
    '00002',
    '�ô뿹��:�ٰ����� �ô�',
    'ISBN : 9791170610359'
);

INSERT INTO librarys 
VALUES(
    '����������',
    '031-550-2593',
    '�����',
    '00003',
    'Ʈ���� �ڸ��� 2024',
    'ISBN : 9788959897179'
);

INSERT INTO librarys 
VALUES(
    '����������',
    '031-550-2593',
    '�����',
    '00003',
    '�� ���ε�',
    'ISBN : 9788901276571'
);

INSERT INTO librarys 
VALUES(
    '����������',
    '031-550-2593',
    '�����',
    '00003',
    'ǻó ����',
    'ISBN : 9791192389325'
);

INSERT INTO librarys 
VALUES(
    '����������',
    '031-550-2593',
    '�����',
    '00003',
    '������ �ڼ�����',
    'ISBN : 9791130646664'
);

INSERT INTO librarys 
VALUES(
    '����������',
    '031-550-2593',
    '�����',
    '00003',
    '�ô뿹��:�ٰ����� �ô�',
    'ISBN : 9791170610359'
);

INSERT INTO librarys 
VALUES(
    '���ŵ�����',
    '031-550-8999',
    '������',
    '00004',
    'Ʈ���� �ڸ��� 2024',
    'ISBN : 9788959897179'
);

INSERT INTO librarys 
VALUES(
    '���ŵ�����',
    '031-550-8999',
    '������',
    '00004',
    '�� ���ε�',
    'ISBN : 9788901276571'
);

INSERT INTO librarys 
VALUES(
    '���ŵ�����',
    '031-550-8999',
    '������',
    '00004',
    'ǻó ����',
    'ISBN : 9791192389325'
);

INSERT INTO librarys 
VALUES(
    '���ŵ�����',
    '031-550-8999',
    '������',
    '00004',
    '������ �ڼ�����',
    'ISBN : 9791130646664'
);

INSERT INTO librarys 
VALUES(
    '���ŵ�����',
    '031-550-8999',
    '������',
    '00004',
    '�ô뿹��:�ٰ����� �ô�',
    'ISBN : 9791170610359'
);

SELECT * FROM librarys;

-- ����2 : �� ���̺� �̻��� JOIN�Ͽ� ���ϴ� �����͸�  ��ȸ�غ�����
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
    AND b.book_name = '����';

    















