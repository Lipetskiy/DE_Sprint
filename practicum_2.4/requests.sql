/* a. Попробуйте вывести не просто самую высокую зарплату во всей команде, 
а вывести именно фамилию сотрудника с самой высокой зарплатой. */

SELECT SUBSTR (full_name, 1, POSITION(' ' IN full_name)-1) AS surname
FROM employee_main
WHERE salary = (SELECT MAX(salary) FROM employee_main);

/* b. Попробуйте вывести фамилии сотрудников в алфавитном порядке */

SELECT SUBSTR (full_name, 1, POSITION(' ' IN full_name)-1) AS name
FROM employee_main
ORDER BY name

/* c. Рассчитайте средний стаж для каждого уровня сотрудников */

SELECT experience_level, 
       AVG((NOW()::date - employment_date)/365) AS avg_work
FROM employee_main
GROUP BY experience_level;

/* d. Выведите фамилию сотрудника и название отдела, в котором он работает */

SELECT SUBSTR (full_name, 1, POSITION(' ' IN full_name)-1) AS surname, 
       departments.dep_title
FROM employee_main
JOIN departments ON employee_main.department_id = departments.department_id

/* e. Выведите название отдела и фамилию сотрудника с самой высокой зарплатой в данном отделе и саму зарплату также. */

SELECT SUBSTR (employee_main.full_name, 1, POSITION(' ' IN employee_main.full_name)-1) AS surname,
       departments.dep_title,
	   employee_main.salary
FROM employee_main,
     departments
WHERE salary IN (
	SELECT MAX(employee_main.salary) AS max_salary
	FROM employee_main INNER JOIN departments ON employee_main.department_id = departments.department_id
	GROUP BY departments.dep_title) AND employee_main.department_id = departments.department_id
ORDER BY salary;