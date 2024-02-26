-- 03_WHERE.sql

/*
    # SELECT �÷��� FROM ���̺�� WHERE ������;
    
    - SELECT�� �ڿ� WHERE���� �߰��Ͽ� �ش� ������ �����ϴ� �ุ ��ȸ�� �� �ִ�
    - ����Ŭ�� �� �����ڿ� �� �����ڸ� ���� �������� ���� �� �ִ�
    
    # �� ������
    
    =           : ������ ture, (==�� �ȵȴ�)
    !=, <>, ^=  : �ٸ��� true
    <, > <=, >= : ��
    
    # �� ������
    
    AND, OR, NOT

*/

-- ������ 10000�޷� �̻��� ����� ��� ��ȸ
SELECT
    *
FROM
    employees
WHERE
    salary >= 10000;
-- �Ŵ���ID�� 101���� ����� ��� ��ȸ
SELECT
    *
FROM
    employees
WHERE
    manager_id = 101;
-- ���ڿ� �����ʹ� ''�� ����Ѵ� (""�� AS�ϰ� �÷� ��Ī ���Ҷ� ���)
SELECT
    *
FROM
    employees
WHERE
    last_name = 'Austin';
-- �����ʹ� ��ҹ��ڸ� �����Ѵ�
SELECT
    *
FROM
    employees
WHERE
    last_name = 'austin';

SELECT
    first_name,
    salary,
    department_id
FROM
    employees
WHERE
        department_id = 50
    AND salary < 5000;
    
-- �����ͺ��̽��� ���� Ÿ�Ե� �񱳰� �����ϴ�
SELECT
    *
FROM
    employees
WHERE
        first_name >= 'A'
    AND first_name < 'D';
-- ������ �񱳰� �����ϴ�
SELECT
    *
FROM
    employees
WHERE
    first_name <= 'Curtis';

-- ��¥ Ÿ�� ��
SELECT
    *
FROM
    employees
WHERE
    hire_date > '2007/12/31';

-- ����1 : ������ 2000���� 3000������ ������� Ǯ����, ����, ��å�� ��ȸ�غ�����
SELECT
    *
FROM
    employees;

SELECT
    first_name
    || ' '
    || last_name AS full_name,
    job_id,
    salary
FROM
    employees
WHERE
        salary >= 2000
    AND salary <= 3000;

-- ����2 : ��å�� SH_CLERK�̰ų� ST_CLERK�� ������� �̸�, ��ȭ��ȣ�� ��ȸ�غ�����
SELECT
    first_name
    || ' '
    || last_name AS full_name,
    phone_number
FROM
    employees
WHERE
    job_id = 'ST_CLERK'
    OR job_id = 'SH_CLERK';

-- ���� 3 : 30/60/100�� �μ��� ���� ������� �̸�, ������� ��ȸ�غ�����
SELECT
    first_name
    || ' '
    || last_name AS full_name,
    hire_date
FROM
    employees
WHERE
    department_id = 30
    OR department_id = 60
    OR department_id = 100;

-- ���� 4 : ������ 5000$ ������ ����� �ִ� ��å�� ����� �ִ��� ��ȸ�غ�����
SELECT DISTINCT
    job_id
FROM
    employees
WHERE
    salary <= 5000;
    
-- �÷��� BETWEEN A AND B : �ش� �÷� ���� A�� B������ ��� true
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary BETWEEN 2000 AND 3000;

-- �÷��� IN (A, B, C, ...) : ()���� ���뿡 �ش� ���� ������ true
SELECT
    first_name,
    job_id
FROM
    employees
WHERE
    job_id IN ( 'SH_CLERK', 'ST_CLERK' );

SELECT
    first_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 30, 60, 100 );

-- ()���� ���� �����ϴ� ��ҿ� �ٸ� �������� Ȱ���� ���� ������ �� �ִ� (���� ����)
SELECT
    first_name,
    department_id
FROM
    employees
WHERE
    department_id IN (
        SELECT
            department_id
        FROM
            departments
        WHERE
            location_id = 1700
    );

-- null�� ũ�� �񱳰� �Ұ����ϱ� ������ �Ϲ����� �� �����ڸ� ����ϸ� ��� false�̴�
SELECT
    *
FROM
    employees
WHERE
    commission_pct = NULL;

-- null�� ����� ��ȸ�ϰ� ���� ��
SELECT
    *
FROM
    employees
WHERE
    commission_pct IS NULL;

SELECT
    *
FROM
    employees
WHERE
    nvl(commission_pct, 0) = 0;

-- null�� �ƴ� ����� ��ȸ�ϰ� ���� ��
SELECT
    *
FROM
    employees
WHERE
    NOT commission_pct IS NULL;

SELECT
    *
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

-- �����ȣ�� Ȧ���� ����鸸 ��ȸ�غ��� 
-- (% ��� mod(value, divider) �Լ��� ����� �������� ���� �� �ִ�)
SELECT * FROM employees WHERE mod(employee_id, 2) = 1;

/*
    # Like
    
    - �������� �Ϻκ��� ��ġ�ϴ� ���� ��ȸ�� �� �ִ�
    - % : ���ڰ� �־ �ǰ� ��� �Ǵ� �ڸ� (����ǥ���� *�� ����)
    - _ : �ݵ�� �� ���ڰ� �־�� �ϴ� �ڸ�

*/

SELECT first_name, last_name FROM employees WHERE first_name LIKE 'S%';
SELECT first_name, last_name FROM employees WHERE first_name LIKE '_t%';
SELECT first_name, last_name FROM employees WHERE first_name LIKE '_l%';
SELECT first_name, last_name FROM employees WHERE first_name LIKE '__l%';
SELECT first_name, last_name FROM employees WHERE first_name LIKE '%r';
SELECT first_name, last_name FROM employees WHERE first_name LIKE '%e_';

SELECT hire_date FROM employees WHERE hire_date LIKE '%/02/%';
SELECT hire_date FROM employees WHERE hire_date LIKE '%/%/20';


-- ���� 1 : first_name�� a�� ���Ե� ��� ������� �̸��� ��ȸ 
SELECT first_name FROM employees WHERE first_name LIKE '%a%'  or first_name like '%A%' ; 
-- ���� 2 : first_name�� e�� 2�� ���Ե� ��� ������� �̸��� ��ȸ
SELECT first_name FROM employees WHERE first_name LIKE '%e%e%';
-- ���� 3 : first_name�� �ټ� �����̸鼭 r�� ������ ��� ����帣�� �̸��� ��ȸ
SELECT first_name , last_name FROM employees WHERE first_name LIKE '____r';
-- ���� 4 : 8���� �Ի��� ������� �̸��� ����� ��ȸ
SELECT first_name, hire_date FROM employees WHERE hire_date LIKE '%/08/%';
