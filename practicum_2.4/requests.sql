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

/* f* Выведите название отдела, сотрудники которого получат наибольшую премию по итогам года. 
Как рассчитать премию можно узнать в последнем задании предыдущей домашней работы */

SELECT  departments.dep_title, AVG(first_score * second_score * third_score * fourth_score) as avg_score
    FROM (
        SELECT *,
        CASE
            WHEN first_quarter = 'A' THEN 1.2
            WHEN first_quarter = 'B' THEN 1.1
            WHEN first_quarter = 'C' THEN 1
            WHEN first_quarter = 'D' THEN 0.9
            WHEN first_quarter = 'E' THEN 0.8
            ELSE 1 END AS first_score,

        CASE
            WHEN second_quarter = 'A' THEN 1.2
            WHEN second_quarter = 'B' THEN 1.1
            WHEN second_quarter = 'C' THEN 1
            WHEN second_quarter = 'D' THEN 0.9
            WHEN second_quarter = 'E' THEN 0.8
            ELSE 1 END AS second_score,

        CASE
            WHEN third_quarter = 'A' THEN 1.2
            WHEN third_quarter = 'B' THEN 1.1
            WHEN third_quarter = 'C' THEN 1
            WHEN third_quarter = 'D' THEN 0.9
            WHEN third_quarter = 'E' THEN 0.8
            ELSE 1 END AS third_score,

        CASE
            WHEN fourth_quarter = 'A' THEN 1.2
            WHEN fourth_quarter = 'B' THEN 1.1
            WHEN fourth_quarter = 'C' THEN 1
            WHEN fourth_quarter = 'D' THEN 0.9
            WHEN fourth_quarter = 'E' THEN 0.8
            ELSE 1 END AS fourth_score
        FROM employee_scores
        JOIN employee_main ON employee_scores.score_id = employee_main.employee_id
        WHERE (employee_scores.score_id = employee_main.employee_id)
    )quarter_score
    JOIN employee_main ON quarter_score.score_id = employee_main.employee_id
    JOIN departments ON quarter_score.department_id = departments.department_id
    GROUP BY departments.dep_title
    ORDER BY avg_score DESC

/* g* Проиндексируйте зарплаты сотрудников с учетом коэффициента премии. 
Для сотрудников с коэффициентом премии больше 1.2 – размер индексации составит 20%, 
для сотрудников с коэффициентом премии от 1 до 1.2 размер индексации составит 10%. 
Для всех остальных сотрудников индексация не предусмотрена. */

WITH bonus AS(
    SELECT employee_main.employee_id, 
           employee_main.full_name, 
           employee_main.salary, 
           first_score * second_score * third_score * fourth_score AS bonus_score
    FROM (
        SELECT *,
        CASE
            WHEN first_quarter = 'A' THEN 1.2
            WHEN first_quarter = 'B' THEN 1.1
            WHEN first_quarter = 'C' THEN 1
            WHEN first_quarter = 'D' THEN 0.9
            WHEN first_quarter = 'E' THEN 0.8
            ELSE 1 END AS first_score,

        CASE
            WHEN second_quarter = 'A' THEN 1.2
            WHEN second_quarter = 'B' THEN 1.1
            WHEN second_quarter = 'C' THEN 1
            WHEN second_quarter = 'D' THEN 0.9
            WHEN second_quarter = 'E' THEN 0.8
            ELSE 1 END AS second_score,

        CASE
            WHEN third_quarter = 'A' THEN 1.2
            WHEN third_quarter = 'B' THEN 1.1
            WHEN third_quarter = 'C' THEN 1
            WHEN third_quarter = 'D' THEN 0.9
            WHEN third_quarter = 'E' THEN 0.8
            ELSE 1 END AS third_score,

        CASE
            WHEN fourth_quarter = 'A' THEN 1.2
            WHEN fourth_quarter = 'B' THEN 1.1
            WHEN fourth_quarter = 'C' THEN 1
            WHEN fourth_quarter = 'D' THEN 0.9
            WHEN fourth_quarter = 'E' THEN 0.8
            ELSE 1 END AS fourth_score
        FROM employee_scores
        JOIN employee_main ON employee_main.employee_id = employee_scores.score_id
        WHERE (employee_scores.score_id = employee_main.employee_id)
    )quarter_score
    RIGHT JOIN employee_main ON quarter_score.score_id = employee_main.employee_id
), index_salary_tmp AS(
SELECT *,
    CASE
        WHEN bonus_score >= 1.2 THEN salary * 1.2
        WHEN bonus_score >= 1 THEN salary * 1.1
        ELSE salary END AS index_salary
     FROM bonus)
SELECT * FROM index_salary_tmp

/* h.  ***По итогам индексации отдел финансов хочет получить следующий отчет:
Вам необходимо на уровень каждого отдела вывести следующую информацию:
i. Название отдела   
ii. Фамилию руководителя
iii. Количество сотрудников
iv. Средний стаж
v. Средний уровень зарплаты
vi. Количество сотрудников уровня junior
vii. Количество сотрудников уровня middle
viii. Количество сотрудников уровня senior
ix. Количество сотрудников уровня lead
x. Общий размер оплаты труда всех сотрудников до индексации
xi. Общий размер оплаты труда всех сотрудников после индексации
xii. Общее количество оценок А
xiii. Общее количество оценок B
xiv. Общее количество оценок C
xv. Общее количество оценок D
xvi. Общее количество оценок Е
xvii. Средний показатель коэффициента премии
xviii. Общий размер премии.
xix. Общую сумму зарплат(+ премии) до индексации
xx. Общую сумму зарплат(+ премии) после индексации(премии не индексируются)
xxi. Разницу в % между предыдущими двумя суммами(первая/вторая)
*/

WITH
    bonus AS(
        SELECT employee_main.employee_id, 
               employee_main.full_name, 
               employee_main.salary AS tmp_salary, 
               departments.department_id AS d_id, 
               departments.dep_title,
               first_score * second_score * third_score * fourth_score AS bonus_score

        FROM (
            SELECT *,
            CASE
                WHEN first_quarter = 'A' THEN 1.2
                WHEN first_quarter = 'B' THEN 1.1
                WHEN first_quarter = 'C' THEN 1
                WHEN first_quarter = 'D' THEN 0.9
                WHEN first_quarter = 'E' THEN 0.8
                ELSE 1 END AS first_score,

            CASE
                WHEN second_quarter = 'A' THEN 1.2
                WHEN second_quarter = 'B' THEN 1.1
                WHEN second_quarter = 'C' THEN 1
                WHEN second_quarter = 'D' THEN 0.9
                WHEN second_quarter = 'E' THEN 0.8
                ELSE 1 END AS second_score,

            CASE
                WHEN third_quarter = 'A' THEN 1.2
                WHEN third_quarter = 'B' THEN 1.1
                WHEN third_quarter = 'C' THEN 1
                WHEN third_quarter = 'D' THEN 0.9
                WHEN third_quarter = 'E' THEN 0.8
                ELSE 1 END AS third_score,

            CASE
                WHEN fourth_quarter = 'A' THEN 1.2
                WHEN fourth_quarter = 'B' THEN 1.1
                WHEN fourth_quarter = 'C' THEN 1
                WHEN fourth_quarter = 'D' THEN 0.9
                WHEN fourth_quarter = 'E' THEN 0.8
                ELSE 1 END AS fourth_score

            FROM employee_scores
            JOIN employee_main on employee_main.employee_id = employee_scores.score_id
            WHERE (employee_scores.score_id = employee_main.employee_id)
        )quarter_score
        RIGHT JOIN employee_main ON quarter_score.score_id = employee_main.employee_id
        JOIN departments ON employee_main.department_id = departments.department_id),

    index_salary_tmp AS(
        SELECT *,
            CASE
                WHEN bonus_score >= 1.2 THEN tmp_salary * 0.2
                WHEN bonus_score >= 1 THEN tmp_salary * 0.1
                ELSE 0 END AS index_salary,
            CASE
           WHEN bonus_score IS NOT NULL THEN tmp_salary * (bonus_score-1)
           ELSE 0 END AS sum_reward,
            CASE
           WHEN bonus_score IS NOT NULL THEN tmp_salary * bonus_score
           ELSE tmp_salary END AS salary_and_reward
         FROM bonus),

    score_count AS(
        SELECT departments.department_id AS dep_id, departments.dep_title,
           COUNT (*) FILTER ( WHERE first_quarter = 'A' ) +
           COUNT (*) FILTER ( WHERE second_quarter = 'A' ) +
           COUNT (*) FILTER ( WHERE third_quarter = 'A' ) +
           COUNT (*) FILTER ( WHERE fourth_quarter = 'A' ) AS grade_a,

           COUNT (*) FILTER ( WHERE first_quarter = 'B' ) +
           COUNT (*) FILTER ( WHERE second_quarter = 'B' ) +
           COUNT (*) FILTER ( WHERE third_quarter = 'B' ) +
           COUNT (*) FILTER ( WHERE fourth_quarter = 'B' ) AS grade_b,

           COUNT (*) FILTER ( WHERE first_quarter = 'C' ) +
           COUNT (*) FILTER ( WHERE second_quarter = 'C' ) +
           COUNT (*) FILTER ( WHERE third_quarter = 'C' ) +
           COUNT (*) FILTER ( WHERE fourth_quarter = 'C' ) AS grade_c,

           COUNT (*) FILTER ( WHERE first_quarter = 'D' ) +
           COUNT (*) FILTER ( WHERE second_quarter = 'D' ) +
           COUNT (*) FILTER ( WHERE third_quarter = 'D' ) +
           COUNT (*) FILTER ( WHERE fourth_quarter = 'D' ) AS grade_d,

           COUNT (*) FILTER ( WHERE first_quarter = 'E' ) +
           COUNT (*) FILTER ( WHERE second_quarter = 'E' ) +
           COUNT (*) FILTER ( WHERE third_quarter = 'E' ) +
           COUNT (*) FILTER ( WHERE fourth_quarter = 'E' ) AS grade_e

            FROM employee_scores
            JOIN employee_main ON employee_scores.score_id = employee_main.employee_id
            JOIN departments ON employee_main.department_id = departments.department_id
            GROUP BY departments.department_id, departments.dep_title
    ),
    sum_reward AS(
        SELECT CASE
           WHEN bonus_score IS NOT NULL THEN tmp_salary * (bonus_score-1)
           ELSE 0 END AS sum_rewards
            FROM bonus)

SELECT departments.dep_title,
       SUBSTR (departments.boss_name, 1, POSITION(' ' IN departments.boss_name)-1) AS surname_chief,
       count(emp.employee_id) AS number_of_employees,
       AVG((NOW()::date - employment_date)/365) AS avg_exp_year,
       AVG(emp.salary),
       COUNT(*) FILTER (WHERE experience_level IN ('Junior')) AS junior,
       COUNT(*) FILTER (WHERE experience_level IN ('Middle')) AS middle,
       COUNT(*) FILTER (WHERE experience_level IN ('Senior')) AS senior,
       COUNT(*) FILTER (WHERE experience_level IN ('Lead')) AS lead,
       COUNT(*) FILTER (WHERE experience_level IN ('Not applicable')) AS not_app,
       SUM(emp.salary) AS sum_salary,
       SUM(index.index_salary + salary) AS sum_indexed_salary,
       score_count.grade_a, 
       score_count.grade_b, 
       score_count.grade_c, 
       score_count.grade_d, 
       score_count.grade_e,
       AVG(index.bonus_score) AS avg_bonus_score,
       SUM(sum_reward) AS sum_reward,
       SUM(salary_and_reward) AS salary_and_reward,
       SUM((CASE
           WHEN bonus_score IS NOT NULL THEN tmp_salary * (bonus_score)
           ELSE tmp_salary END) + index_salary) AS index_salary_reward,
       SUM(sum_reward)/SUM(salary_and_reward)*100 AS percent_of_diff

FROM departments
JOIN employee_main AS emp ON emp.department_id = departments.department_id
JOIN index_salary_tmp AS index ON index.employee_id = emp.employee_id
LEFT JOIN score_count ON score_count.dep_id = departments.department_id

GROUP BY departments.dep_title, 
         surname_chief,
         score_count.grade_a, 
         score_count.grade_b, 
         score_count.grade_c, 
         score_count.grade_d, 
         score_count.grade_e