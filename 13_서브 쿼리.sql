--13_���� ����.sql

/*
    # ���� ����
    
    - ������ ���ο� ���Ե� �� �ٸ� ������
    - ���� ������ �����ϰ� �ִ� ������ ���� ������� �θ���
    - ���� ������ ���� ����� �������� ������������ ���� ���� �� ���������� 
      ���� �� ���������� �з��ȴ�
    - ���� ���� ����� ���Ѵٸ� �ַ� �⺻Ű�� ����Ͽ� �� ���� ��ȸ�Ѵ�
    - ���� �� ���������� ������� �ϴ� �����ڿ�
      ���� �� ���������� ������� �ϴ� �����ڰ� �������� �ִ�
    - ���� ������ ����� ���ؾ� �ϴ� ������� ���ǰų� ���̺� ������� Ȱ��� �� �ִ�
    
    # ���� �� ���� ����
    
    -  ���� ������ ���� ����� �� �� ���� ���
    -  ������ �������� ������(=, >, <, <>, ^=,>=, ...)
    
    # ���� �� ���� ����
    
    - ���� ������ ���� ����� 2�� �̻��� �� �ִ� ���
    - ������ �������� ������(IN, ANY, SOME, ALL, EXISTS ...)
*/

-- 1. �񱳰� ��� �������� Ȱ���ϱ�
SELECT
    *
FROM
    employees
WHERE
    salary >= (
        SELECT
            salary
        FROM
            employees
        WHERE
            employee_id = 169
    );

-- ���� ������ ����� ���� ���� ������ ��� �Ϲ� �����ڴ� ����� �� ����
SELECT
    *
FROM
    employees
WHERE
    salary >= (
        SELECT
            salary
        FROM
            employees
        WHERE
            first_name = 'Alexander'
    );

SELECT
    *
FROM
    employees
ORDER BY
    first_name;

-- 2. ��ȸ�ؾ� �� ���̺� ��� �������� ����ϱ�
SELECT
    *
FROM
    (
        SELECT
            first_name,
            job_id
        FROM
            employees
        WHERE
            job_id = 'IT_PROG'
    );

/*
    # ������ ���� ���� ������
    
    - IN    : ���� ���� �� ��ġ�ϴ� ���� �ϳ��� ������ true
    - ANY   : ���� ���� �� ������ ������Ű�� ���� �ϳ��� ������ true
    - SOME  : ANY�� ����
    - ALL   : ���� ������ ������ ��� ������Ű�� ��쿡�� true
    - EXISTS: ���� �ϳ��� ��ȸ�Ǹ� true

*/
-- IN
-- ex) Alexander��� ����� �����ִ� ��å�� ������ �ִ� ��� ����� ��ȸ
SELECT
    *
FROM
    employees
WHERE
    job_id IN (
        SELECT
            job_id
        FROM
            employees
        WHERE
            first_name = 'Alexander'
    );

SELECT
    job_id
FROM
    employees
WHERE
    first_name = 'Alexander';

-- ANY, SOME
SELECT
    *
FROM
    employees
WHERE
    salary >= ANY ( 5000,
                    8000,
                    9000,
                    15000 );

SELECT
    *
FROM
    employees
WHERE
    salary >= SOME ( 5000,
                     8000,
                     9000,
                     15000 );

-- ex) 60�μ� ������� ���� ������ ������� ���� ���� ������ ��ȸ
SELECT
    *
FROM
    employees
WHERE
    salary >= ANY (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id = 60
    );

SELECT
    *
FROM
    employees
WHERE
    department_id = 60;



-- ALL
SELECT
    *
FROM
    employees
WHERE
    salary > ALL ( 5000,
                   6000,
                   7000,
                   8000,
                   9000 );

-- ex) 60�� �μ��� ��� ����� ���� �� �߹��� ����� ��ȸ
SELECT
    *
FROM
    employees
WHERE
    salary > ALL (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id = 60
    );

-- EXISTS
SELECT
    *
FROM
    employees
WHERE
    EXISTS (
        SELECT
            *
        FROM
            employees
        WHERE
            1 = 2
    );

-- ex)�ִ� �޿��� �޴� ����� �ִ� �μ��� ��ȸ

SELECT
    *
FROM
    departments d
WHERE
    EXISTS (
        SELECT
            *
        FROM
                 employees e
            INNER JOIN jobs j ON e.job_id = j.job_id
        WHERE
                e.salary = j.max_salary
            AND e.department_id = d.department_id
    );
    


-- ����1 : job_title�� Manager�� ���ԵǴ� ������� ��ȭ��ȣ�� �̸����� ��ȸ�غ�����
SELECT
    *
FROM
    jobs;

SELECT
    *
FROM
    employees;

SELECT
    job_title,
    phone_number,
    email
FROM
         employees e
    INNER JOIN jobs j USING ( job_id )
WHERE
    job_title IN (
        SELECT
            job_title
        FROM
            jobs
        WHERE
            job_title LIKE '%Manager%'
    )
ORDER BY
    job_title;

-- ����� Ǯ��
SELECT
    *
FROM
    employees
WHERE
    job_id IN (
        SELECT
            job_id
        FROM
            jobs
        WHERE
            job_title LIKE '%Manager%'
    );
 
-- ����2 : ������� 2007���� ������� �Ҽ��� �μ����� ���� ���� ���� ���� ������� ��ȸ�غ�����
SELECT
    *
FROM
    employees
WHERE
    ( salary, department_id ) IN (
        SELECT
            MAX(salary), department_id
        FROM
            employees
        WHERE
            department_id IN (
                SELECT DISTINCT
                    department_id
                FROM
                    employees
                WHERE
                    hire_date LIKE '07/%'
            )
        GROUP BY
            department_id
    )
ORDER BY
    employee_id;