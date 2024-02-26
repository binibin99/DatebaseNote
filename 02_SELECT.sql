--02_SELECT.sql

/*
    # SELECT �÷��� FROM ���̺��;
    
    - ���ϴ� ���̺��� ���ϴ� �÷��� ��ȸ�� �� �ִ� ������
    - ���� �÷��� ��ȸ�� ���� , �� ����Ѵ�
    - �÷��� �ڸ��� * �� ���°��� ��� �÷��� �ǹ��Ѵ�
    - �÷���� ���̺���� ��ҹ��ڸ� �������� �ʴ´�
*/

SELECT
    country_name,
    country_id
FROM
    countries;

SELECT
    country_id,
    country_name
FROM
    countries;

SELECT
    *
FROM
    countries;

SELECT
    country_name,
    country_id
FROM
    countries;

-- ����1: ���μ��� �μ���ȣ�� �μ����� ��ȸ�غ�����
SELECT
    *
FROM
    departments;

SELECT
    department_id,
    department_name
FROM
    departments;

-- ����2: ��� ����� ���/�̸�/����/������� ��ȸ�غ�����
SELECT
    *
FROM
    employees;
--select
--        EMPLOYEE_ID
--       ,FIRST_NAME
--       ,SALARY
--       ,HIRE_DATE 
--  from employees 
--  order by salary desc ;
  
  /*
    # DESC ���̺��
    - �ش� ���̺��� �÷������� �� �� �ִ�.
    - �÷���, NULL ��� ����, �÷�Ÿ�� �� ũ�⸦ �� �� �ִ�
    
    # NUMBER(n), NUMBER(n,m)
    
    - ���� �����͸� ������ �� �ִ� �÷�Ÿ��
    - ���ڰ� �ϳ��� ���������� ������ ���̸� ��Ÿ����
    - ���ڰ� �ΰ� ���������� ���� ��ü�� ���̿� �Ҽ��� �ڸ����� ��Ÿ����
    
    NUMBER(6) : ���� 6�ڸ�
    NUMBER(8,2) : ���� 6�ڸ� +�Ҽ�2�ڸ�
    NUMBER(2,2) : �Ҽ� 2�ڸ�
    
    #VARCHAR2(n)
    
    - ���ڸ� ������ �� �ִ� Ÿ��
    - ����Ǵ� �������� ũ�⿡ ���� �˸��� ������ ����ϵ��� ����Ǿ� �ִ�
    
    # CHAR(n)
    
    - ���ڸ� ������ �� ������ ũ�Ⱑ �ڵ����� �������� �ʴ� �÷� Ÿ��
    - �����͸� ũ�⿡ ������ �ʰ� �׻� ������ ������ �����Ѵ�
    - �ش� �÷��� ���ݿ� ���� ���� ������ ���� ������ �� �ִ�
    - ���� �ڵ� (KR, EN,JP..)ó�� ���̰� �����Ǿ� �ִ� �ุ ���� �÷��� 
      CHARŸ���� �� ȿ������ �� �ִ�
      
   # DATE
   
   - ��¥ �� �ð� �����͸� ������ �� �ִ� �÷� Ÿ��
   
    
  */
DESC countries; 
DESC  employees;

SELECT
    *
FROM
    employees;

-- # �÷� ��ȸ�� AS�� �̿��� �ش� �÷��� �̸��� ���ϴ� �̸����� �����Ͽ� ��ȸ�� �� �ִ�
SELECT
    first_name AS �̸�,
    salary     AS ����
FROM
    employees;

-- # �÷��� ��� �����ڸ� Ȱ���Ͽ� �� �÷��� ����� ����� ��ȸ�� �� �ִ�
SELECT
    salary     AS "�� ��ġ",
    salary * 2 AS "�� ��ġ",
    salary * 3 AS "�� ��ġ",
    first_name AS "�̸�"
FROM
    employees;

-- #�÷������� ����� �� �ִ�
SELECT
    *
FROM
    employees;

SELECT
    first_name,
    commission_pct * salary AS "�Ǵ� Ŀ�̼�"
FROM
    employees;
    
    -- #NVL(column,value) �Լ�
    -- ����� �� �ش� �÷� ���� null�� ��� ��� ����� ���� �������ش�

SELECT
    first_name,
    nvl(commission_pct, 0) * salary AS "�Ǵ� Ŀ�̼�"
FROM
    employees;
    
    -- # �÷��� �̾�ٿ��� ����ϱ�

SELECT
    first_name
    || ' '
    || last_name AS full_name
FROM
    employees;

SELECT
    first_name
    || ":"
    || salary AS "name:salary"
FROM
    employees;

SELECT
    salary
    || '/'
    || nvl(commission_pct, 0) AS "salary"
FROM
    employees;
    
    -- # SELECT DISTINCT : �� �����͸� �� ������ ��ȸ�Ѵ� (������ �� �ִ� �� ��ȸ)
SELECT DISTINCT
    job_id
FROM
    employees;

SELECT DISTINCT
    department_id
FROM
    employees;

SELECT DISTINCT
    first_name,
    salary
FROM
    employees;
    
    -- ���� 1 : ��� ������� ���/Ǯ����/��å/������ ��ȸ�غ�����

SELECT
    *
FROM
    employees;

SELECT
    employee_id AS ���,
    first_name || ' '|| last_name AS Ǯ����,
    job_id AS ��å,
    salary*12 AS ����,
    nvl(commission_pct, 0) * salary AS "�Ǵ� Ŀ�̼�"
FROM
    employees;