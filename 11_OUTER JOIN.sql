-- 11_OUTER JOIN

/*

    # OUTER JOINJ
    
    - JOIN ������ �������� ���Ͽ� �������� ���ϴ� ���� �߰��� Ȯ���� �� �ִ� JOIN
    - (+)�� �����ʿ� null�� �߰��ؼ� ������ �������� ���ߴ� ���� �巯����
        
*/
SELECT * FROM employees;

-- ����� ��� �����Դ� �μ����� ���´�
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

-- �μ��� ��� �����Դ� ����� ���´�
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

-- ����1 : �μ���ȣ/�μ���/�ּ�/���ø� ��ȸ�ϵ� �Ҽӵ� �μ��� �ϳ��� ���� ���� ������
--        �Բ� ��ȸ�ǵ��� �غ�����
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

-- ����2 : �Ҽӵ� ����� ���� �μ��� ��ȸ�غ�����
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

