-- 20_������.sql

/*
    # ������(Sequence)
    
    - �⺻Ű�� ����ϱ� ���ϵ��� ��ȣ�� �ڵ����� �������ִ� DB ������Ʈ
        
    CREATE SEQUENCE ��������
                    [START WITH n] - ���� ��ȣ ����
                    [INCREMENT BY n] - ���� ���� ����
                    [MAXVALUE n | NOMAXVALUE] - �ִ� ���� ����
                    [MINVALUE n | NOMINVALUE] - �ּ� ���� ����
                    [CYCLE | NOCYCLE] - ���� ��ȯ ���� ����
                    [CACHE n | NOCACHE] - ��ȣ�� �̸� �������� ���� ����
*/
-- ������ ������ ��ųʸ� ��
SELECT * FROM user_sequences;
SELECT * FROM all_sequences;

CREATE SEQUENCE coffee_seql;

CREATE SEQUENCE fruit_id_seql START WITH 10 INCREMENT BY 10;

-- �׽�Ʈ�� ���̺�
SELECT * FROM dual;
SELECT 10*10 FROM dual;
SELECT upper ('apple') FROM dual;
SELECT lower('Smith') FROM dual;

-- ������.nextval : ���� ��ȣ�� ����Ѵ�(�ٽô� ���� ��ȣ�� ���ư� �� ����)
SELECT coffee_seql.nextval FROM dual;
SELECT fruit_id_seql.nextval FROM dual;

-- ������.currcal : ���� ��ȣ�� Ȯ���Ѵ� (nextval�� ������ �̷翡�� Ȯ�� ����)
SELECT coffee_seql.currval FROM dual;
SELECT fruit_id_seql.currval FROM dual;

-- �������� ����� ���̺� INSERT�ϱ� 
ALTER TABLE fruits MODIFY(
    fruit_id NUMBER(10) 
        CONSTRAINT fruit_id_pk PRIMARY KEY
);        

-- �⺻Ű ���� ���� ����ϸ� ����� ������ �������� ����� ����Ѵ�
INSERT INTO fruits(fruit_id, fruit_name, fruit_price)
VALUES (fruit_id_seq.nextval, 'Apple',1234); 

-- CYCLE �ɼ� ����ؼ� ��ȯ�ϴ� ��ȣ �����
CREATE SEQUENCE bank_waiting_seq 
    START WITH 10 INCREMENT BY 20 MINVALUE 10 MAXVALUE 100 CYCLE NOCACHE;

DROP SEQUENCE bank_waiting_seq;

SELECT bank_waiting_seq.nextval FROM dual;

-- ������ �����ϱ� : DROP SEQUENCE ��������;
-- ������ �����ϱ� : ALTER SEQUENCE �������� [�ɼ��� CREATE SEQUENCE�� ����]


