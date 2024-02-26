--05_DECODE.sql


/*
    # DECODE
    
    - 자바의 switch-case와 유사한 문법
    - DECODE(column, case1, value1, case2, value2..., default value)
*/

SELECT 
    first_name,
   DECODE( department_id,
   10,'관리부',
   20,'마케팅부',
   30,'구매부',
   40, '인사부',
   50, 'IT',
   department_id) AS department_name 
FROM 
    EMPLOYEES;

SELECT * FROM departments;

/*
    연습: 직책에 따라 다음과 같이 인상된 급여를 출력해보세요 (이름/ 급여 출력하기)
    
    IT_PROG : 20%
    SH_CLERK : 5%
    ST_CLERK : 3%
    그 외: 변동없음
    
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
