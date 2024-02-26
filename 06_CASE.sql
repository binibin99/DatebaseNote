-- 06_CASE.sql

/*
    #CASE
    
    - DECODE() 는 switch-case 처럼 정확하게 일치하는 경우만 매핑이 가능하다
    - CASE 는 if문처럼 원하는 조건에 따라 원하는 동작을 할 수 있다
    
    CASE
        WHEN 조건 THEN 출력
        WHEN 조건2 THEN 출력2
        ...
        ELSE 기본값
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
    
