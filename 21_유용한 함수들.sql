-- 21_������ �Լ���.sql

/******             ���� Ÿ�� �Լ���           ******/


-- TO NUMBER(data) : �ٸ� Ÿ�� �����͸� ����Ÿ������ ��ȯ�ϴ� �Լ�
SELECT to_number('1234') FROM dual;

-- ������ ����� ������ �ִ� ���ڿ��� ���� Ÿ������ ��ȯ�� �� �ִ�
SELECT to_number('10,000', '999,999') FROM dual;
SELECT to_number('1,000,000', '9,999,999') FROM dual;
SELECT to_number('100,000��', '999,999L') FROM dual;
SELECT to_number('$100', '$999') FROM dual;

-- abs(n) : ���밪
SELECT abs(-5) FROM dual;

-- floor(n) : ����
SELECT floor(123.999) FROM dual;

-- ceil(n) : �ø�
SELECT ceil(123.111) FROM dual;

-- round(n, m) : �ݿø�, �ڸ��� ���� ����
SELECT round(123.12345, 4) FROM dual;

-- mod(n, m) : ������ ����
SELECT mod(10, 3) FROM dual;

-- trunc(n, m) : ���ϴ� �ڸ������� �ڸ���
SELECT trunc(123.12345, 3) FROM dual;
SELECT trunc(112323.12345, -2) FROM dual;
SELECT trunc(112323.12345, -4) FROM dual;


/******             ���� Ÿ�� �Լ���           ******/

-- to_char(data) : �����͸� ���� Ÿ������ ��ȯ
SELECT to_char(1234) FROM dual;
SELECT to_char(sysdate) FROM dual; -- �ð��� ���� Ÿ������ ��ȯ

-- ���ڸ� ���ϴ� ������ ���ڿ��� ��ȯ�� �� �ִ�
SELECT to_char(1000000, '9,999,999') FROM dual;
SELECT to_char(1000000, '$9,999,999') FROM dual;
SELECT to_char(1000000, '9,999,999L') FROM dual;

-- ��¥�� ���ϴ� ����� ���ڿ��� ��ȯ�� �� �ִ�
SELECT to_char(sysdate, 'YYYY/MM/DD HH:MI:SS') FROM dual;
SELECT first_name, to_char(hire_date, 'YYYY/MM/DD HH:MI:SS') FROM employees;

-- substr(str, start, count) : ���ڿ� �ڸ��� (0���� ������ �ƴϹǷ� ����)
SELECT substr('Hellooooo', 2, 5) FROM dual;
SELECT substr('Hellooooo', 1, 5) FROM dual;

-- ltrim(str,���Ŵ���ڵ�) : ������ ���� ��� ���ڵ��� �����Ѵ�
SELECT ltrim('!!!!!!!!!Hello', '!') FROM dual;
SELECT ltrim('         Hello', ' ') FROM dual;
SELECT ltrim('!!!!!@@@!###!!!!!Hello', '!@#') FROM dual;

-- rtrim(str,���Ŵ���ڵ�) : �������� ���� ��� ���ڵ��� �����Ѵ�
SELECT rtrim('ABC!!!!!!@#@#', '!@#')FROM dual;

-- lpad(str, len, char) : ���ϴ� ���̸�ŭ ���ʿ� ���ڵ��� ä���ش�
SELECT lpad('Hello', 20,' ') FROM dual;
SELECT lpad('Nice to meet you', 20,' ') FROM dual;

-- rpad(str, len, char) : ���ϴ� ���̸�ŭ �����ʿ� ���ڵ��� ä���ش�
SELECT rpad('Shoes', 20,'>') FROM dual;

-- upper(str) : �빮�ڷ�
-- lower(str) : �ҹ��ڷ�
-- initcap(str) : ù ���ڸ� �빮�ڷ�
SELECT initcap('employees') FROM dual;
SELECT email FROM employees;
SELECT initcap(email) FROM employees;
SELECT lpad(first_name, 20, ' ') From employees; 

-- replace(str, old, new)
SELECT replace('abc@naver.com', 'naver', 'gmail') FROM dual;

/******             ��¥ Ÿ�� �Լ���           ******/
-- to_date(data) : �����͸� ��¥ Ÿ������ ��ȯ
SELECT TO_DATE ('1999/12/12') FROM dual;
SELECT TO_DATE('1999/12/12 12:12:12', 'YYYY/MM/DD HH:MI:SS') FROM dual;

-- trunc(data) : ���ϴ� ������ ��¥�� �ڸ�
SELECT to_char(sysdate, 'YYYY/MM/DD HH:MI:SS') FROM dual;

SELECT
    to_char(trunc(sysdate, 'HH'), 'YYYY/MM/DD HH:MI:SS')
FROM dual; -- �ð� ���� �ڸ�

SELECT
    to_char(trunc(sysdate, 'DD'), 'YYYY/MM/DD HH:MI:SS')
FROM dual; -- ��¥ ���� �ڸ�

SELECT
    to_char(trunc(sysdate, 'day'), 'YYYY/MM/DD HH:MI:SS')
FROM dual; -- day ������ �ڸ� (������ ����)

SELECT
    to_char(trunc(sysdate, 'month'), 'YYYY/MM/DD HH:MI:SS')
FROM dual; -- month ������ �ڸ�

SELECT
    to_char(trunc(sysdate, 'year'), 'YYYY/MM/DD HH:MI:SS')
FROM dual; -- year ������ �ڸ�













