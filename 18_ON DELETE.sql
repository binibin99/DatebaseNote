-- 18_ON DELETE.sql

/*
    # ON DELETE
    
    - �ܷ�Ű�� ������ �� �θ�Ű�� ������ ���� ��å�� �����Ѵ�
    - ON DELETE RESTRICT : �θ�Ű�� �����Ϸ��� �� �� ������ ���´� (�⺻��)
    - ON DELETE SET NULL : �θ�Ű�� �����ϰ� �����ϴ� �ڽ�Ű���� ����null�� �ٲ۴�
    - ON DELETE CASCADE : �θ�Ű�� �����ϸ� �����ϴ� �ڽ����� ��� �����ع�����

*/

SELECT * FROM user_tables;

SELECT * FROM coffee;
SELECT * FROM fruits;

UPDATE fruits SET country_id = 'AR' WHERE country_id = 'KR';

-- countries3�� ������ ����� fruits���� �����ϴ� ������ ���� null�� �ٲٰڴ�
ALTER TABLE fruits ADD CONSTRAINT fruits_c_id_fk
FOREIGN KEY (country_id) REFERENCES countries3(country_id)
ON DELETE SET NULL;

ALTER TABLE coffee MODIFY(
    country_id CHAR(2) ,
    CONSTRAINT coffee_c_id_fk REFERENCES countries3(country_id)
    ON DELETE CASCADE
);
ALTER TABLE coffee DROP CONSTRAINT coffee_c_id_fk;


-- �θ�� ���� �غ���(coffee�� fruits�� ��� ���� ��å�� �ʿ��ϴ�
DELETE FROM countries3 WHERE country_id = 'AU';

ALTER TABLE fruits ADD CONSTRAINT fruits_c_id_fk;

