-- 08_정렬.sql

/*
    # ORDER BY 컬럼명 [ASC|DESC}
    - 조회 시 원하는 컬럼 기준으로 정렬하여 조회하는 문법
    - ASC : 오름차순 (Ascending)
    - DESC : 내림차순 (Descending)
    - 입력을 하지 않으면 기본적으로 ASC로 정렬한다
    
*/

SELECT * FROM employees ORDER BY first_name;
SELECT * FROM employees ORDER BY first_name desc;
SELECT * FROM employees ORDER BY phone_number desc;

-- 오름차순 시 null은 가장 나중에 등장한다
SELECT first_name, job_id, commission_pct FROM employees order by commission_pct ASC;

-- 내림차순 시 null은 가장 먼저 등장한다
SELECT first_name, job_id, commission_pct FROM employees order by commission_pct desc;

-- 정렬 기준은 여러 개 설정할 수 있다

-- ex: 부서번호로 정렬하고, 부서번호가 같으면 성 기준으로 정렬하고,
-- 성도 같으면 이름으로 정렬한다
SELECT * FROM employees ORDER BY department_id ASC, last_name ASC, first_name ASC;
SELECT * FROM employees ORDER BY department_id, last_name, first_name;

-- 연습1: 이름에 i가 포함되어 있는 사원들을 월급 많이 받는 순으로 조회

select 
    * 
from employees 
where last_name like '%i%'
order by salary desc;

-- 연습2: 모든 사원들을 성 기준으로 오름차순 정렬하고 성이 같은경우 이름기준으로 오름차순
    SELECT 
        * 
    FROM employees
    ORDER BY first_name, last_name;
    
-- 연습3: 각 부서의 평균월급, 사원수를 조회하고 평균 월급으로 내림차순 정렬하여 조회
    select 
        avg(salary) AS "평균월급",
        count(*),
        department_id
    from employees
    group by department_id  order by avg(salary) desc