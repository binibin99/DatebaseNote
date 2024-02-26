-- 16_��������.sql

/*
    # ���Ἲ
    
    - ������ ���� ����
    - �����͸� ���Ծ��� ���·� �ùٸ��� �����ϴ� ��
    - �����͸� �ùٸ��� �����ϱ� ���ؼ��� �پ��� ������ ���Ἲ�� �������Ѿ� �Ѵ�
    - �����ͺ��̽����� �پ��� ���Ἲ���� ��Ű�� ���� ����ϴ� ���� ���������̴�

    # ��ü ���Ἲ
    
    - ���̺��� �����ʹ� �ݵ�� �ϳ��� ���� ������ �� �־�� �Ѵ�
    - �� �ุ ������ �� ���� �����ʹ� ��ü ���Ἲ�� �������̴�
    - DB������ ������ ��ü ���Ἲ�� ��Ű�� ���ؼ� �⺻Ű(PK) ���������� ����Ѵ�
    
    # ���� ���Ἲ
    
    - ���� ���迡 �ִ� �����ʹ� ��ȿ�� �����͸� �����ؾ� �Ѵ�
    - DB������ �������� ���� ���Ἲ�� ��Ű�� ���� �ܷ�Ű(FK) ���������� ����Ѵ�
    
    # ������ ���Ἲ
    
    - �ϳ��� ������(�÷�)�� �����ϴ� ��ü���� ��� ���� Ÿ���̾�� �Ѵ�
    - DB������ �÷� Ÿ���� �����Ͽ� �ش� �÷��� ������ ���Ἲ�� �����Ѵ�
    
    # ������ ���Ἲ
    
    - �����Ͱ� ��Ȯ��, �ϰ���, ��ȿ���� �����ϴ� ��
    - CHECK ���� ���ǰ� NOT NULL ���������� ���� ������ ���Ἲ�� ������ �� �ִ�
    
    # DB�� ���� ���ǵ�
    
    - UNIQUE : �ش� �����ο� �ߺ��Ǵ� ���� ������� �ʴ´� (null ���)
    - NOT NOULL : �ش� �����ο� null�� ������� �ʴ´�
    - PRIMARY KEY : �⺻Ű, NOT NULL + UNIQUE, �� ���̺� �� �ϳ��� ���� ����
    - FOREIGN KEY : �ܷ�Ű, �ش� �������� �ܷ�Ű�� ����.
                    ��� �÷��� �������� �����ؾ��Ѵ�.
                    �⺻Ű �Ǵ� UNIQUE ���������� ������ �÷��� ������ �� �ִ�.
    - CHECK : ���ϴ� ������ ���� �����Ͽ� �ش� ������ �����ϴ� ��ü�� �߰� ����                
    
*/

/*
    # ������ ��ųʸ�(Data Dictionary)
    
    - �����Ϳ� ���� ������ (������ ����, ��Ÿ ������)
    - ���� DB�� ��Ȳ�� ����, DB�� �˾Ƽ� �����ϴ� ������
    - DB����ڴ� ������ ��ųʸ��� ���� ������ �� ����
    
    # ������ ��ųʸ� ��(Data Dictionary View)
    
    - ������ ��ųʸ��� ����ڰ� Ȯ���� �� �ְԲ� �����ϴ� ��(View)
        * ��(View) - DB ������Ʈ �� �ϳ��� ��ü �������� �Ϻθ� ���� ���� ���·� 
                    ��ȸ�� �� �ִ� �̴� ���̺� (���� ���̺��� �κ� ����)
    
    - �տ� user_�� ���̸� ���� ���� DB������ ������ ��ųʸ��� Ȯ���� �� �ִ�
    - �տ� all_�� ���̸� ��ü ������ ������ ��ųʸ��� Ȯ���� �� �ִ�
*/
--  ��� ������ �� �� �ִ� ������ ��ųʸ� ��
SELECT * FROM all_users;

-- ���� ������ ���̺� ����� �� �� �ִ� ������ ��ųʸ� ��
SELECT * FROM user_tables;

-- ��� ������ ���̺� ����� �� �� �ִ� ������ ��ųʸ� ��
SELECT * FROM all_tables;

-- ���� ������ �����ϴ� �������� ����
SELECT * FROM user_constraints;
SELECT * FROM user_constraints WHERE table_name = 'EMPLOYEES';

-- ��� ������ �����ϴ� �������� ����
SELECT * FROM all_constraints;

/*
    # CONSTRAINT_TYPE
    
    - P : Primary Key
    - R : References (Foreign Key)
    - U : Unique
    - C : Check, NOT NULL
*/

/*
    1. ���̺� ������ ���ÿ� �������� �߰��ϱ�
    
    - ���̺� ������ �÷����� �÷�Ÿ�� �ڿ� ���������� �߰��� �� �ִ�
    - ������ �߰�/����/������ ���������� ������ �޴´�
    - �������� �̸��� �������� ������ ����Ŭ���� ������ �ڵ� �̸��� ����Ѵ�
       (� �߸����ؼ� ���������� �����ߴ��� �˱� ���������)
    - "�÷��� �÷�Ÿ�� CONSTRAINT �������Ǹ� ��������Ÿ��"�� ���� 
      ���� ������ �̸��� ���� ������ �� �ִ�
    -  �� �����ο� �������� ���������� ������ �� �ִ�
       
*/

CREATE TABLE coffee (
    coffee_id    NUMBER(4) PRIMARY KEY,
    coffee_name  VARCHAR2(40) NOT NULL UNIQUE,
    coffee_pirce NUMBER(5) CHECK ( coffee_price >= 0 ),
    coffee_size  CHAR(1) CHECK ( coffee_size IS NOT NULL
                                AND coffee_size IN ( 'T', 'G', 'V' ) )
);

INSERT INTO coffee VALUES(1, '�Ƹ޸�ī��', 1500, null);
INSERT INTO coffee VALUES(2, '�Ƹ޸�ī��(T)', 1200, 'T');
INSERT INTO coffee VALUES(3, '�Ƹ޸�ī��(L)', 1200, 'L');

SELECT * FROM coffee;
SELECT * FROM user_constraints;

DROP TABLE Coffee;
PURGE recyclebin;

CREATE TABLE coffee(
    coffee_id NUMBER(4) -- SYS000��� ���� ������ �������Ǹ��� ����� �� �ִ�
        CONSTRAINT coffee_id_pk PRIMARY KEY,
    coffee_name VARCHAR(40)
        CONSTRAINT coffee_name_UK UNIQUE
        CONSTRAINT coffee_name_nn NOT NULL,
    coffee_price NUMBER(5)
        CONSTRAINT coffee_price_positive CHECK(coffee_price >= 0)
        CONSTRAINT cooffee_price_nn NOT NULL,
    coffee_size CHAR(1)
        CONSTRAINT coffee_size_nn NOT NULL
        CONSTRAINT coffee_size_chk CHECK(coffee_size IN('T', 'G', 'V'))
);

SELECT * FROM user_constraints WHERE table_name = 'COFFEE';

INSERT INTO coffee VALUES(1, 'Americano', 2000, 'T');
INSERT INTO coffee VALUES(2, 'Caffe Latte', 2300, 'T');
INSERT INTO coffee VALUES(1, 'ī���', 2500, 'A');
INSERT INTO coffee VALUES(1, 'ī���', -2500, 'V');

SELECT * FROM coffee;

/*
    2. ���̺� ���� �Ŀ� �������� ���� �߰��ϱ�
    
    - ALTER TABLE ���̺��� ADD CONSTRAINT �������Ǹ� ��������Ÿ��(�÷���);
    - NOT NULL, CHECK�� ALTER TABLE ���̺��� MODIFY�� �÷��� �����ؾ� �Ѵ�
    - ALTER TABLE ���̺��� MODIFY�� CREATE TABLE�� ������ ���� 
*/
CREATE TABLE snacks(
    snack_id    NUMBER(5),
    snack_name  VARCHAR2(50),
    snack_price NUMBER(6)
);

SELECT * FROM snacks;
SELECT * FROM user_constraints WHERE table_name = 'SNACKS';

-- �̹� ������� ���̺��� �������� �߰��ϱ�
ALTER TABLE snacks ADD CONSTRAINT snack_id_pk PRIMARY KEY(snack_id);
ALTER TABLE snacks ADD CONSTRAINT snack_name_uk UNIQUE(snack_name);

-- NOT NULL, CHECK, DEFAULT ���������� ALTER TABLE�� �ƴ� �ٸ� ������ ����ؾ� �Ѵ�

-- ���̺��� �����ϸ鼭 ���������� �߰��� ���� �ִ�
ALTER TABLE snacks MODIFY(
    snack_name VARCHAR(100)-- �������� �� �ƴ϶� �÷� Ÿ�Ե� ���� �����ϴ�
        CONSTRAINT snack_name_nn NOT NULL,
    snack_price NUMBER(6) DEFAULT 1000
        CONSTRAINT snack_price_positive CHECK(snack_price >= 0)
        CONSTRAINT snack_price_nn NOT NULL
);  

INSERT INTO snacks(snack_id, snack_name)VALUES(1,'��īĨ');
INSERT INTO snacks(snack_id, snack_name, snack_price)VALUES(1,'��īĨ', null);
SELECT * FROM snacks;

/*
    # ���̺� �������� �����ϱ�
    
    - ALTER TABLE ���̺��� DROP CONSTRAINT �������Ǹ�;
*/
SELECT * FROM user_constraints WHERE table_name = 'SNACKS';
ALTER TABLE snacks DROP CONSTRAINT snack_name_nn;

/*
    # ���̺� �������� �̸� �����ϱ�
    
    - ALTER TABLE ���̺��� RENAME CONSTRAINT �����̸� TO �ٲ��̸�;
*/
ALTER TABLE snacks RENAME CONSTRAINT snack_id_pk TO snacks_snack_id_pk;

/*
    3. ���̺� �������� �������� �߰��ϱ�
    
    - CREATE TABLE ���ο��� �÷��� ��� ������ ���� ���� ���������� �ļ��ϴ� ���
    - DEFAULT��  NOT NULL�� �÷� �������� �����ؾ� �Ѵ�

*/
CREATE TABLE Clothes(
    -- �÷� ����
    clothes_id NUMBER(5),
    clothes_type VARCHAR2(15)
    CONSTRAINT clothes_type_nn NOT NULL, 
    clothes_name VARCHAR2(50),
    clothes_size VARCHAR2(10),
    -- ���̺� �������� ���� ������ ���� ����
    CONSTRAINT clothes_id_pk PRIMARY KEY(clothes_id),
    CONSTRAINT clothes_size CHECK(clothes_size IN('L', 'XL', 'S', 'XXL', 'M'))
);

SELECT * FROM user_constraints WHERE table_name = 'CLOTHES';

/*
    # �ܷ�Ű �����ϱ�
    
    - �ܷ�Ű ���������� ������ �� �ٸ� ���̺��� PK �Ǵ�  UK�� �����ؾ� �Ѵ�
    - �ܷ�Ű�� ������ �÷��� ���� �߰��� �� �����ϴ� �÷��� �����ϴ� �� 
      �Ǵ� null�� �߰��� �� �ִ�   
*/

-- 1. �÷� ����(���̺� ������ ���ÿ�)���� �ܷ�Ű �������� �����ϱ�
CREATE TABLE CoffeeBeans(
    bean_id NUMBER(5)
        CONSTRAINT coffeebeans_bean_id_pk PRIMARY KEY,
    bean_name VARCHAR2(30)
        CONSTRAINT coffeebeans_bean_name_nn NOT NULL,
    country_id CHAR(2)
        CONSTRAINT coffeebeans_country_id_fk REFERENCES countries(country_id)     
);

ALTER TABLE coffeebeans DROP CONSTRAINT coffeebeans_c_id_fk;

-- 2. ALTER TABLE - ADD CONSTRAINT�� �ܷ�Ű �߰��ϱ�
-- FOREIGN KEY(�ܷ�Ű�÷�) REFERENCES �θ����̺�(�θ��÷�);
ALTER TABLE CoffeeBeans
ADD CONSTRAINT coffeebeans_c_id_fk
FOREIGN KEY(country_id) REFERENCES countries(country_id);

-- 3. ���̺� �������� �߰��ϱ� 
CREATE TABLE CoffeeBeans(
    bean_id NUMBER(5),
    bean_name VARCHAR2(30)
        CONSTRAINT coffeebeans_bean_name_nn NOT NULL,
    country_id CHAR(2),
    CONSTRAINT coffeebeans_b_id_pk PRIMARY KEY (bean_id),   
    CONSTRAINT coffeebeans_c_id_fk FOREIGN KEY (country_id)
        REFERENCES countries(country_id)
);

SELECT * FROM user_constraints WHERE table_name = 'COFFEEBEANS';
SELECT * FROM user_constraints WHERE table_name = 'COUNTRIES';
SELECT * FROM countries;

INSERT INTO coffeebeans VALUES(1,'���ٺ��Ŀ����', 'ZW');
INSERT INTO coffeebeans VALUES(2,'�ѱ�Ŀ����', 'KR');
INSERT INTO coffeebeans VALUES(3,'������𸣴�Ŀ����', null);
INSERT INTO coffeebeans VALUES(4,'�Ϻ�Ŀ����', 'JP');
INSERT INTO coffeebeans VALUES(5,'�Ƹ���Ƽ��Ŀ����', 'AR');

SELECT * FROM coffeebeans;

/*
    ����: 1:N ���̺��� �������� �ùٸ��� �߰��غ���

*/
SELECT * FROM books;
SELECT * FROM librarys;

SELECT * FROM user_constraints WHERE table_name = 'BOOKS';
SELECT * FROM user_constraints WHERE table_name = 'LIBRARYS';
/*
    2. ���̺� ���� �Ŀ� �������� ���� �߰��ϱ�
    
    - ALTER TABLE ���̺��� ADD CONSTRAINT �������Ǹ� ��������Ÿ��(�÷���);
    - NOT NULL, CHECK�� ALTER TABLE ���̺��� MODIFY�� �÷��� �����ؾ� �Ѵ�
    - ALTER TABLE ���̺��� MODIFY�� CREATE TABLE�� ������ ���� 
*/

ALTER TABLE books ADD CONSTRAINT book_price_positive CHECK(book_price >= 0);
ALTER TABLE books ADD CONSTRAINT book_num_pk PRIMARY KEY(book_num);
ALTER TABLE books MODIFY(
    book_name VARCHAR(100)
        CONSTRAINT book_name_nn NOT NULL
);  
ALTER TABLE librarys MODIFY(
    library_name
        CONSTRAINT library_name_nn NOT NULL,
    librarian_id    
        CONSTRAINT librarian_id_nn NOT NULL
);

