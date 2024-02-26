-- 19_Ʈ�����.sql

/*
    # Ʈ�����(Transacatoin)
    
    -  �ϳ��� �۾� ����(ex: �۱�)
    - �����ͺ��̽��� �ϳ��� Ʈ����ǿ� ���� ��� �۾���
      ���������� �Ϸᱫ�� ��쿡�� ��������� Ȯ������ �� �ִ� ����� �����Ѵ�
      (All or Nothing)
    - Ʈ������� �����ϱ� ���� COMMIT, ROLLBACK, SAVEPOINT, ROLLBACK TO�� ����Ѵ�
    - �ϳ��� Ʈ������� ������ Ŀ�� ���ĺ��� ���ο� Ŀ�� ���̿��� ����� ��� DML���� �ǹ��Ѵ�
      (INSERT, UPDATE, DELETE�� Ʈ������� ���� ����̳�
      CREATE, ALTER ���� DDL�� Ʈ������� ���� ����� �ƴϴ�)
*/
SELECT * FROM fruits;

DELETE FROM fruits;

-- COMMIT : ���±����� ���� ����� Ȯ�� ���´�(�ϳ��� Ʈ������� �������Ѵ�)
COMMIT;

INSERT INTO fruits VALUES('Apple', 1234, 'c', 'ZM');

-- ROLLBACK : ���� �ֱٿ� �ߴ� Ŀ������ ���ư���
ROLLBACK;
-- ���ٺ���� ���� ������ 500�� ����
UPDATE fruits SET fruit_price = fruit_price + 500 WHERE country_id = 'ZM';

SAVEPOINT mysavepoint2;

UPDATE fruits SET fruit_price = fruit_price + 500 WHERE country_id = 'ZM';

SELECT * FROM fruits;

ROLLBACK TO mysavepoint2;
ROLLBACK TO mysavepoint1;
ROLLBACK TO mysavepoint2; -- 1�� ���ư� �������� savepoint2�� �̷��̹Ƿ� ���ư� �� ����

-- Ʈ������� �۾� �� �Ϻθ� ����ϰ� ����ؼ� ������ ���� ��� 
-- SAVEPOINT�� ROLLBACK TO�� Ȱ���Ѵ�
