-- 12_ANSI JOIN.sql

/*
    # ANSI  JOIN
    
    - ANSI���� ������ ǥ�� JOIN ����
    - �ٸ� RDBMS������ ����� �� �ִ� ������ ����
    
    �� ANSI : America National Standard Institute, �̱� ���� ǥ�� �ⱸ

*/

-- CROSS JOIN
SELECT
    *
FROM
         employees
    CROSS JOIN departments;

/*
    # INNER JOIN (���� ������ �����ϴ� �ุ �����ϴ� ����)
    
    - ���� ���ǿ��� ON���� ����ϰ� ���ǿ��� WHERE���� ����� �� �ִ�
    - JOIN�ϴ� �� ���̺��� �����ϱ� ���� ����ϴ� �÷��� �̸��� ������ ���
    ON ��� USING Ű���带 ����� �� �ִ�
    - USING�� ����ϸ� ���ο� ����ߴ� �÷��� �̸� �ߺ������� �ذ�ȴ�
*/
SELECT
    *
FROM
         employees e
    INNER JOIN departments d ON e.department_id = d.department_id
WHERE
    salary >= 8000;

-- ���̺� ���ῡ ���Ǵ� �� �÷��� �̸��� ���� ��� ������ �ξ� ����������
SELECT
    *
FROM
         employees
    INNER JOIN departments USING ( department_id )
WHERE
    salary <= 5000;
    
    
-- ����1 : ��� ������� �����ȣ/�̸�/��å�̸�(jop_title)�� ��ȸ�غ�����

SELECT 
    employee_id,
    first_name || ' ' || last_name,
    job_title
FROM
     employees
    INNER JOIN jobs USING ( job_id )
ORDER BY employee_id

-- ����2 : jop_title�� Programmer�� ������� �����ȣ/�̸�/�μ���ȣ/�μ����� ��ȸ�غ�����

    
-- ����3 : Ŀ�̼��� �޴� ������� ��å�̸�(job_title)�� ����� �ִ��� ��ȸ�غ�����

   

-- ����4 : Seattle���� �ٹ��ϴ� ������� �̸�/����/�μ���/�����ȣ�� ��ȸ�غ�����
--         Hint. Seattle�� locations ���̺� �ִ�

    
/*
    # OUTER JOIN(������ �������� �ʴ� �൵ �����ϴ� ��)
    
     1. LEFT OUTER JOIN : ������ ���̺� (+)�� �߰��ϴ� ȿ��
     2. RIGHT OUTER JOIN : ���� ���̺� (+)�� �߰��ϴ� ȿ��
     3. FULL OUTER JOIN : ���� ��ο� (+)�� �߰��ϴ� ȿ��

*/
-- LEFT OUTER JOIN : ���� ���̺��� �������� ���ߴ� ���� �����ϴ� OUTER JOIN
--                   �����ʿ� (+)�� ���� ȿ��
SELECT * FROM employees LEFT OUTER JOIN departments USING(department_id)
ORDER BY department_id;

-- RIGHT OUTER JOIN : ������ ���̺��� �������� ���ߴ� ���� �����ϴ� OUTER JOIN
--                    ���ʿ� (+)�� ���� ȿ��
SELECT * FROM employees RIGHT OUTER JOIN departments USING(department_id);

-- ANSI JOIN�� ���� ������ ���ʿ� (+)�� ������ ���Ѵ�
SELECT
    *
FROM
    employees   e,
    departments d
WHERE
    e.department_id (+) = d.department_id (+);
-- FULL OUTER JOIN : �� ���̺��� �������� ���ߴ� ���� ��� �����ϴ� OUTER JOIN
--                    
SELECT * FROM employees FULL OUTER JOIN departments USING(department_id);

-- ����1 : ����̸�/���Ŵ����̸��� ��� ����ϵ� ����ϴ� �Ŵ����� ���� ����� ��ȸ�غ�����

    
 -- ����2 : ��� ������ "�Ҽӵ����̸�/�ּ�/�����ȣ/�ҼӺμ����翩�θ�"�� ��ȸ�غ�����
