--04_����.sql

SELECT * FROM employees; -- 107��

SELECT * FROM employees WHERE first_name LIKE '%a%'; -- 66��
SELECT * FROM employees WHERE first_name LIKE '%e%'; -- 56��

-- INTERSECT : ������
SELECT * FROM employees WHERE first_name LIKE '%a%'
INTERSECT
SELECT * FROM employees WHERE first_name LIKE '%e%'; -- 27��

-- UNION : ������
-- �̸��� a�� ���Եǰų� �Ǵ� e�� ���ԵǴ� ��� ������� ��ȸ
SELECT * FROM employees WHERE first_name LIKE '%a%'
UNION
SELECT * FROM employees WHERE first_name LIKE '%e%'; --95��

-- UNION ALL : ������ (�ߺ��� ���� ����)
-- �̸��� a�� ���ԵǴ� ������� ��ȸ �� e�� ���ԵǴ� ������� ��ȸ 
SELECT * FROM employees WHERE first_name LIKE '%a%'
UNION ALL
SELECT * FROM employees WHERE first_name LIKE '%e%'; --122��

-- MINUS : ������
-- first_nam�� a�� ���Ե����� e�� ���Ե��� �ʴ� ����� ��ȸ
SELECT * FROM employees WHERE first_name LIKE '%a%'
MINUS
SELECT * FROM employees WHERE first_name LIKE '%e%'; --39��
-- first_nam�� e�� ���Ե����� a�� ���Ե��� �ʴ� ����� ��ȸ
SELECT * FROM employees WHERE first_name LIKE '%e%'
MINUS
SELECT * FROM employees WHERE first_name LIKE '%a%'; --29��

-- �̸��� a�� ���Եǰ� e�� ���Եǰ� o�� ���ԵǴ� ����� ��� ��ȸ
SELECT * FROM employees WHERE first_name LIKE '%a%'
INTERSECT
SELECT * FROM employees WHERE first_name LIKE '%e%'
INTERSECT
SELECT * FROM employees WHERE first_name LIKE '%o%';