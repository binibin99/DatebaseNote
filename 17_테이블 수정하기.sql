-- 17_���̺� �����ϱ�.sql
/*
    # ���̺� �� �÷� �߰��ϱ�
    
    - ALTER TABLE ���̺�� ADD (�÷��� �÷�Ÿ�� ��������,....);
    - �� �÷��� �߰��Ǹ� ������ �����ϴ� ����� �ش� �÷����� null�� �ȴ�
    - �� �÷� NOT NULL �÷��� �߰��� ���� �⺻���� �ݵ�� �����ؾ� �Ѵ�
*/

ALTER TABLE coffee ADD ( 
    coffee_taste VARCHAR2(20) DEFAULT 'Bitter'
        CONSTRAINT coffee_taste_nn NOT NULL,
    coffee_satis NUMBER(2, 1)
);

-- countries�� countries2�� ������ �� �⺻Ű ���������� �Բ� ������� �ʴ´�
CREATE TABLE countries2 AS (SELECT * FROM countries);

-- countries2.country_id�� �ܷ�ų�� ������ ���� ���ؼ� �⺻Ű ���� ������ �߰�
ALTER TABLE countries2 MODIFY(
    country_id CHAR(2)
        CONSTRAINT countries2_c_id_pk PRIMARY KEY
);

ALTER TABLE coffee ADD ( 
 country_id CHAR(2)
    CONSTRAINT coffee_c_id_fk REFERENCES countries2(country_id)
);

-- ���̺� �÷� �����ϱ� : ALTER TABLE ���̺�� DROP TABLE �÷���
ALTER TABLE coffee DROP COLUMN coffee_taste;
ALTER TABLE coffee DROP COLUMN coffee_satis;

SELECT * FROM coffee;
UPDATE coffee SET country_id = 'AR';

-- ���̺� �÷� �̸� �����ϱ� : ALTER TABLE ���̺�� RENAME COLUMN �����̸� TO �ٲ��̸�
ALTER TABLE coffe RENAME COLUMN coffee_satis TO coffee_satisfaction;

-- ���̺� �������� �̸� �����ϱ� : ALTER TABLE ���̺�� RENAME CONSTRAINT �����̸� TO �ٲ��̸�;
SELECT * FROM user_constraints WHERE table_name = 'COFFE';
ALTER TABLE coffe RENAME CONSTRAINT coffee_price_positive TO coffee_price_pos;

-- ���̺� �̸� ���� �ϱ� : RENAME ���̺�� TO �ٲ��̸�;
RENAME countries2 TO countries3;
-- �������Ǹ��� ����ȭ ������ �����Ƿ� ���� �����ؾ��Ѵ�
ALTER TABLE countries3 RENAME CONSTRAINT 
countries2_c_id_pk To countries3_c_id_pk;

