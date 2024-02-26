-- 07_�׷��Լ�.sql

/*
    #�׷��Լ�
    - ���ϴ� �÷��� �������� �׷��� ��� ����� �� �ִ� �Լ���
    - �׷��� ���� �� ������ �Ǵ� �÷��� GROUP BY ���� ���� �� �� �ִ�
    - �׷� �Լ��� ����ϸ� �Ϲ� �÷��� �Բ� ����� �� ���� 
    - �׷� �Լ��� ����ϸ� �׷� �Լ��� ����� �׷��� ������ �Ǵ� �÷��� ����� �� �ִ�
    
*/

-- sum(column) : �ش� �÷��� ������ �����ִ� �׷� �Լ�
SELECT sum(SALARY) FROM employees;

-- ��å�� ���� ����
SELECT 
    sum(SALARY),
    job_id
FROM employees GROUP BY job_id;

-- �μ��� ���� ����
SELECT 
    sum(SALARY),
    department_id
FROM employees GROUP BY department_id;

-- avg(column) : �� �׷��� �ش� �÷� ��հ��� �� �� �ִ�
SELECT avg(salary), sum(salary), job_id FROM employees GROUP BY job_id;

-- count(column) : �ش� �÷��� ���� ������ ���� �� �ִ� (null���� ���� �ʴ´�)
SELECT count(commission_pct) FROM employees;
SELECT department_id, count(commission_pct) FROM employees GROUP BY department_id;

-- max(column) : �׷캰 �� �÷� �ִ밪�� ���� �� �ִ�
SELECT max(salary), job_id FROM employees GROUP BY job_id;

-- min(column) : �׷캰 �� �÷� �ּҰ��� ���� �� �ִ�
SELECT min(salary), job_id FROM employees GROUP BY job_id;

-- ����1: �� ��å�� ��� ������ ���غ����� (�ؿ��� �ƴ�)

-- ����2: �� �μ����� ���� �ֱٿ� ����� �Ի��� ��¥�� ���� ������ �Ի��� ��¥�� ��ȸ�� ������ 

-- ����1
select * from employees;
SELECT
    manager_ID,
    (avg(salary*12)||'$') AS "�������"
FROM employees GROUP BY manager_ID;
      
-- ����2      
    select * from employees;
    SELECT
    (select sysdate from dual) as "����",
        max(hire_date) AS "�ֱ�",
        min(hire_date) AS "������",
        department_id
    FROM employees
    GROUP BY department_id;
    
  /*
    # HAVING
    
    - �׷� �Լ��� ��� ����� ����� ���� ������ ������ �����ϰ� ���� ��� ����ϴ� ����
    - WHERE���� �׷����� ���� �� ����Ǳ� ������ 
      �׷� �Լ��� ����� WHERE���� �������� ����� �� ����

*/
-- ex) ��� ������ 8000�� �Ѵ� ��å�� ��ȸ�ϰ� ���� ��
SELECT AVG(salary) ,job_id FROM employees GROUP BY job_id Having avg(salary)>8000;

-- ex: ������ 8000�� �Ѵ� ������� ��å�� ��տ���

SELECt avg(salary),job_id From employees
Where salary > 8000 Group by job_id;

--����1: ������ 8õ�޷� �̻��� ����� 3���̻��� �μ��� ����غ�����

SELECT 
    department_id
FROM employees 
    where salary >=8000
    GROUP BY department_id  
    Having count(*)>=3;  
    

