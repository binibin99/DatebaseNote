--05_DECODE.sql


/*
    # DECODE
    
    - �ڹ��� switch-case�� ������ ����
    - DECODE(column, case1, value1, case2, value2..., default value)
*/

SELECT 
    first_name,
   DECODE( department_id,
   10,'������',
   20,'�����ú�',
   30,'���ź�',
   40, '�λ��',
   50, 'IT',
   department_id) AS department_name 
FROM 
    EMPLOYEES;

SELECT * FROM departments;

/*
    ����: ��å�� ���� ������ ���� �λ�� �޿��� ����غ����� (�̸�/ �޿� ����ϱ�)
    
    IT_PROG : 20%
    SH_CLERK : 5%
    ST_CLERK : 3%
    �� ��: ��������
    
*/
select * from employees;
SELECT
    (first_name ||' '|| last_name) as full_NAME,
    JOB_ID,
    salary,
    DECODE( JOB_ID,
   'IT_PROG',salary*1.2,
  'SH_CLERK',salary*1.05,
   'ST_CLERK', salary*1.03,
   salary
) AS upper_salary 
    from employees;
