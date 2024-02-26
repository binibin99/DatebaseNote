-- 11_OUTER JOIN

/*

    # OUTER JOINJ
    
    - JOIN 조건을 만족하지 못하여 등장하지 못하는 행을 추가로 확인할 수 있는 JOIN
    - (+)를 붙인쪽에 null을 추가해서 조건을 만족하지 못했던 행을 드러낸다
        
*/
SELECT * FROM employees;

-- 사원이 없어서 못나왔던 부서명이 나온다
SELECT 
    employee_id,
    first_name,
    e.department_id AS "edid",
    d.department_id AS "ddid",
    department_name
FROM 
    employees e, 
    departments d
WHERE
e.department_id(+) = d.department_id;

-- 부서가 없어서 못나왔던 사원이 나온다
SELECT 
    employee_id,
    first_name,
    e.department_id,
    department_name
FROM 
    employees e, 
    departments d
WHERE
e.department_id = d.department_id(+);

-- 연습1 : 부서번호/부서명/주소/도시를 조회하되 소속된 부서가 하나도 없는 지역 정보도
--        함께 조회되도록 해보세요
SELECT * FROM departments d, countries c;

SELECT 
    department_id,
    department_name,
    street_address,
    city
FROM 
    departments d, 
    locations l
WHERE
    d.location_id(+) = l.location_id
ORDER BY department_id;

SELECT * FROM locations;
SELECT * FROM departments;

-- 연습2 : 소속된 사원이 없는 부서만 조회해보세요
SELECT * FROM employees;
SELECT * FROM departments;

SELECT 
    d.*
FROM 
    employees e, 
    departments d
WHERE
    e.department_id(+) = d.department_id
    AND e.employee_id IS NULL
ORDER BY 
    d.department_id;

