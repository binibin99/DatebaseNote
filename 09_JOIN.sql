-- 09_JOIN.sql

/*
    # �⺻Ű (primary Key, PK)
    
    - �� ���̺��� �ϳ��� ���� �����ϰ� ������ �� �ִ� �÷�
    - �� ���̺��� �⺻Ű�� �ϳ��� ������ �� �ִ�
    - �⺻Ű�� ������ �÷����� �ߺ� ���� ����� �Ѵ� (UNIQUE)
    - �⺻Ű�� ������ �÷����� null�� ����� �Ѵ� (NOT NULL)
    
    # �ĺ�Ű (Candidata Key)
    
    - �⺻Ű�� �� �ڰ��� ������ �⺻Ű�� �������� ���� �÷�
    
    # �ܷ�Ű (Foreign Key)
    
    - �ٸ� ���̺����� �⺻Ű(�Ǵ� �ĺ�Ű)������ ���� ���̺�����
      �ߺ��Ǵ� ���� ���� �Ϲ� �÷��� ���
      ex: employees�� department_id�� �ܷ�Ű
          departments�� department_id�� �⺻Ű
    - �ܷ�Ű �÷����� �����ϴ� �⺻Ű(�Ǵ� �ĺ�Ű) �÷��� ���� ����
      �����ؼ��� �ȵȴ� (���� ���Ἲ)
    - � ���̺��� �⺻Ű(�Ǵ� �ĺ�Ű)�� �ٸ� ���̺��� �ܷ�Ű�� �����Ǿ��ٸ�
      �� ���̺����� 1:N ����(�ϴ�� ����)�� �����Ǿ��ٰ� �� �� �ִ�
      ex: �μ� �ϳ����� ����� ������ �Ҽ��� �� �ִ�
      
    # ��ü �� ������ ����
    
    - 1:1 ���� : ���� ���̺� �ȿ� �÷����� �ִ´�
    - 1:N ���� : �μ� - ���, �Խñ� - ���, ȸ�� - �Խñ�, ...
    - N:N ���� : �п� - �л�, ���� - �л�, ���� - ����, ��Ʈī - �뿩��
    
    # JOIN
    
    - �⺻Ű�� �ܷ�Ű�� ���� ���谡 �����Ǿ� �ִ� �����̺��� ������ �����Ͽ�
      ���ϴ� ������ ����� ��ȸ�ϴ� ��
*/

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM jobs;

/*
    # CROSS JOIN
    
    - JOIN�� ���Ǵ� ���̺���� ��� ���� �����Ͽ� ���� �� �ִ�
      ��� ��츦 ����ϴ� JOIN
    - ���� ��� ���� �������� ���� ������� ����
*/
SELECT * FROM employees; -- 107rows
SELECT * FROM departments; -- 27rows
SELECT * FROM employees, departments; -- 2889rows (107 * 27)

SELECT 
    employee_id, 
    first_name, 
    last_name, 
    employees.department_id AS "emp_dept_id", 
    departments.department_id AS "dept_dept_id", 
    department_name
FROM 
    employees, 
    departments;

/*
    ���̺� �̸��� �ʹ� �� ���� ���� �� ���̺� �̸����� ��Ī�� ������ �� �ִ�
*/
SELECT 
    employee_id, 
    first_name, 
    last_name, 
    emp.department_id AS "emp_dept_id", 
    dept.department_id AS "dept_dept_id", 
    department_name
FROM 
    employees emp, 
    departments dept;
    
/* 
    # EQUI JOIN
    
    - �� ���̺��� ���� ������ ���� ���� �÷�(�ַ� �⺻Ű�� �ܷ�Ű)���� �̿��Ͽ�
      CORSS JOIN���� ���� �ǹ̾��� �����͵鸸 �ɷ����� JOIN  
*/
SELECT 
    employee_id,
    first_name,
    department_name
FROM 
    employees   emp, 
    departments dept
WHERE 
    emp.department_id = dept.department_id
ORDER BY
    employee_id ASC;
    
    
-- ����1 : ��� ������� �����ȣ/�̸�/��å�̸�(jop_title)�� ��ȸ�غ�����
SELECT 
    e.employee_id,
    e.first_name,
    j.job_title
FROM  
    employees e, 
    jobs      j 
WHERE 
    e.job_id = j.job_id
ORDER BY
    employee_id;

-- ����2 : jop_title�� Programmer�� ������� �����ȣ/�̸�/�μ���ȣ/�μ����� ��ȸ�غ�����
SELECT 
    employee_id,
    first_name,
    e.department_id,
    department_name
FROM  
    employees e, 
    jobs      j,
    departments d
WHERE 
    e.job_id = j.job_id
    AND job_title = 'Programmer'
    AND e.department_id = d.department_id
 ORDER BY
    employee_id;
-- ����3 : Ŀ�̼��� �޴� ������� ��å�̸�(job_title)�� ����� �ִ��� ��ȸ�غ�����
SELECT DISTINCT job_title FROM employees e, jobs j
WHERE e.job_id  = j.job_id AND e.commission_pct IS NOT NULL;

-- ����4 : Seattle���� �ٹ��ϴ� ������� �̸�/����/�μ���/�����ȣ�� ��ȸ�غ�����
--         Hint. Seattle�� locations ���̺� �ִ�
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;

SELECT
    first_name,
    salary,
    department_name,
    postal_code
FROM
    employees   e,
    departments d, 
    locations   l
WHERE
    e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND city = 'Seattle';
    
/*
    (1) ����� �μ�ó�� 1:N ������ ������ �� �ִ� ���� ��ʸ� �ϳ� �����غ�����
        
        �౸�� - �౸����
        
    (2) 1:N ����� ������ �� ��ü�� ���̺� ���·� �����غ�����
  
        - ���̺� �̸� : �౸��
        - �÷��� : ����ȣ(PK)/���̸�(VARCHAR2)/������(VARCHAR2)/Ȩ �����(NUMBER)/����...   
        - �� �÷��� Ÿ�� 
        - �⺻Ű �÷� : ����ȣ
        - �ܷ�Ű �÷� : ������ȣ
        
        - ���̺� �̸� : �����
        - �÷��� : ������ȣ(PK)/�����ο�/�ּ�/�����Ÿ��/...
        - �÷� Ÿ�� : NUMBER / NUMBER / VARCHAR2 / CHAR/ ....
        - �⺻Ű �÷� : ������ȣ
        - �ܷ�Ű �÷� : X
        
        - ���̺� �̸� : �౸����
        - �÷��� : ������ȣ(PK) / �̸� / ���� / ������ / ����(FK) / �Ҽ���(FK) 
        - �÷� Ÿ�� : NUMBER / VARCHAR2 / NUMBER / CHAR / NUMBER
        - �⺻Ű �÷� : ������ȣ
        - �ܷ�Ű �÷� : ����, �Ҽ��� ��ȣ
*/
    
    

    
