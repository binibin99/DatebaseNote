-- 08_����.sql

/*
    # ORDER BY �÷��� [ASC|DESC}
    - ��ȸ �� ���ϴ� �÷� �������� �����Ͽ� ��ȸ�ϴ� ����
    - ASC : �������� (Ascending)
    - DESC : �������� (Descending)
    - �Է��� ���� ������ �⺻������ ASC�� �����Ѵ�
    
*/

SELECT * FROM employees ORDER BY first_name;
SELECT * FROM employees ORDER BY first_name desc;
SELECT * FROM employees ORDER BY phone_number desc;

-- �������� �� null�� ���� ���߿� �����Ѵ�
SELECT first_name, job_id, commission_pct FROM employees order by commission_pct ASC;

-- �������� �� null�� ���� ���� �����Ѵ�
SELECT first_name, job_id, commission_pct FROM employees order by commission_pct desc;

-- ���� ������ ���� �� ������ �� �ִ�

-- ex: �μ���ȣ�� �����ϰ�, �μ���ȣ�� ������ �� �������� �����ϰ�,
-- ���� ������ �̸����� �����Ѵ�
SELECT * FROM employees ORDER BY department_id ASC, last_name ASC, first_name ASC;
SELECT * FROM employees ORDER BY department_id, last_name, first_name;

-- ����1: �̸��� i�� ���ԵǾ� �ִ� ������� ���� ���� �޴� ������ ��ȸ

select 
    * 
from employees 
where last_name like '%i%'
order by salary desc;

-- ����2: ��� ������� �� �������� �������� �����ϰ� ���� ������� �̸��������� ��������
    SELECT 
        * 
    FROM employees
    ORDER BY first_name, last_name;
    
-- ����3: �� �μ��� ��տ���, ������� ��ȸ�ϰ� ��� �������� �������� �����Ͽ� ��ȸ
    select 
        avg(salary) AS "��տ���",
        count(*),
        department_id
    from employees
    group by department_id  order by avg(salary) desc