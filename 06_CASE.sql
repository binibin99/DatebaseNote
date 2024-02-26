-- 06_CASE.sql

/*
    #CASE
    
    - DECODE() �� switch-case ó�� ��Ȯ�ϰ� ��ġ�ϴ� ��츸 ������ �����ϴ�
    - CASE �� if��ó�� ���ϴ� ���ǿ� ���� ���ϴ� ������ �� �� �ִ�
    
    CASE
        WHEN ���� THEN ���
        WHEN ����2 THEN ���2
        ...
        ELSE �⺻��
    END
    
*/
select * from employees;
select 
    first_name,
    job_id,
    CASE 
        WHEN job_id = 'IT_PROG' THEN salary*1.2
        WHEN job_id = '%_CLERK' THEN salary * 1.3
        ELSE salary 
    END AS "increased salary"
FROM employees;
    
