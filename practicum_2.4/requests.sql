/* a. Попробуйте вывести не просто самую высокую зарплату во всей команде, 
а вывести именно фамилию сотрудника с самой высокой зарплатой. */

SELECT SUBSTR (full_name, 1, POSITION(' ' IN full_name)-1) AS name
FROM emploee_main
WHERE salary = (SELECT MAX(salary) FROM employee_main);

---------------------------------------------------------b
-- Попробуйте вывести фамилии сотрудников в алфавитном порядке

SELECT SUBSTR (full_name, 1, POSITION(' ' IN full_name)-1) AS name
FROM staff
ORDER BY name

---------------------------------------------------------c
--Рассчитайте средний стаж для каждого уровня сотрудников

SELECT title, (
    SELECT  AVG((NOW()::date - start_work)/365)AS work
    FROM staff
    WHERE level_id = level.id)
FROM level


-------------------------------------------------------d
-- Выведите фамилию сотрудника и название отдела, в котором он работает

SELECT SUBSTR (full_name, 1, POSITION(' ' IN full_name)-1) AS surname, department.title
FROM staff
JOIN department ON staff.department_id = department.id



-------------------------------------------------------e
--Выведите название отдела и фамилию сотрудника с самой высокой зарплатой в данном отделе и саму зарплату также.

--Тут у меня не получилось вывести  фамилию сотрудника т.к. postgres ругался на группировку, пока не смог решить эту проблему.
SELECT title,  MAX(staff.salary) as max_salary
FROM department
JOIN staff on department.id = staff.department_id
GROUP BY title
order by title


--*****************************************************f
-- *Выведите название отдела, сотрудники которого получат наибольшую премию по итогам года. 
--Как рассчитать премию можно узнать в последнем задании предыдущей домашней работы

--Не очень понял задачу, на всякий случай сделал 2 варианта:

--1) посчитан средний коэфициент бонусов на отдел и отсортирован от большего к меньшему

SELECT  department.title, AVG(first_score * second_score * third_score * fourth_score) as avg_score
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
        FROM score
        JOIN staff ON score.staff_id = staff.id
        WHERE (score.staff_id = staff.id)
    )quarter_score
    JOIN staff ON quarter_score.staff_id = staff.id
    JOIN department ON quarter_score.department_id = department.id
    GROUP BY department.title
    ORDER BY avg_score DESC




------------------------------------------------------------
--2) Посчитана сумма премий на отдел и так-же отсортирована от большего к меньшему.

SELECT  department.title, SUM(((first_score * second_score * third_score * fourth_score)-1)*staff.salary) as sum_bonus
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
        FROM score
        JOIN staff ON score.staff_id = staff.id
        WHERE (score.staff_id = staff.id)
    )quarter_score
    JOIN staff ON quarter_score.staff_id = staff.id
    JOIN department ON quarter_score.department_id = department.id
    GROUP BY department.title
    ORDER BY sum_bonus DESC




--********************************************************g
--*Проиндексируйте зарплаты сотрудников с учетом коэффициента премии. 
--Для сотрудников с коэффициентом премии больше 1.2 – размер индексации составит 20%, 
--для сотрудников с коэффициентом премии от 1 до 1.2 размер индексации составит 10%. 
--Для всех остальных сотрудников индексация не предусмотрена.


WITH bonus AS(
    SELECT staff.id, staff.full_name, staff.salary, first_score * second_score * third_score * fourth_score as bonus_score
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
        FROM score
        JOIN staff on staff.id = score.staff_id
        WHERE (score.staff_id = staff.id)
    )quarter_score
    RIGHT JOIN staff ON quarter_score.staff_id = staff.id
), index_salary_tmp AS(
SELECT *,
    CASE
        WHEN bonus_score >= 1.2 THEN salary * 1.2
        WHEN bonus_score >= 1 THEN salary * 1.1
        ELSE salary END AS index_salary
     FROM bonus)
SELECT * FROM index_salary_tmp



--h.  ***По итогам индексации отдел финансов хочет получить следующий отчет:
-- вам необходимо на уровень каждого отдела вывести следующую информацию:

WITH
    bonus AS(
        SELECT staff.id, staff.full_name, staff.salary as tmp_salary, department.id AS d_id, department.title,
               first_score * second_score * third_score * fourth_score as bonus_score

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

            FROM score
            JOIN staff on staff.id = score.staff_id
            WHERE (score.staff_id = staff.id)
        )quarter_score
        RIGHT JOIN staff ON quarter_score.staff_id = staff.id
        JOIN department ON staff.department_id = department.id),

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
        SELECT department.id as dep_id, department.title,
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

            FROM score
            JOIN staff ON staff_id = staff.id
            JOIN department ON staff.department_id = department.id
            GROUP BY department.id, department.title
    ),
    sum_reward AS(
        SELECT CASE
           WHEN bonus_score IS NOT NULL THEN tmp_salary * (bonus_score-1)
           ELSE 0 END AS sum_rewards
            FROM bonus)

       -- i.Название отдела
SELECT department.title,
       -- ii.Фамилию руководителя
       full_name_chief,
       -- iii.Количество сотрудников
       count(s.id) AS number_of_employees,
       -- iv.Средний стаж
       AVG((NOW()::date - start_work)/365) AS avg_exp_year,
       -- v.Средний уровень зарплаты
       AVG(s.salary),
       -- vi.Количество сотрудников уровня junior
       COUNT(*) FILTER (WHERE level_id=1) AS junior,
       -- vii.Количество сотрудников уровня middle
       COUNT(*) FILTER (WHERE level_id=2) AS middle,
       -- viii.Количество сотрудников уровня senior
       COUNT(*) FILTER (WHERE level_id=3) AS senior,
       -- ix.Количество сотрудников уровня lead
       COUNT(*) FILTER (WHERE level_id=4) AS lead,
       -- x.Общий размер оплаты труда всех сотрудников до индексации
       SUM(s.salary) AS sum_salary,
       -- xi.Общий размер оплаты труда всех сотрудников после индексации
       SUM(index.index_salary + salary) AS sum_indexed_salary,
       -- xii., xiii., xiv., xv., xvi. Общее количество оценок А, B, C, D, E
       score_count.grade_a, score_count.grade_b, score_count.grade_c, score_count.grade_d, score_count.grade_e,
       --xvii. Средний показатель коэффициента премии
       AVG(index.bonus_score) AS avg_bonus_score,
       -- xviii. Общий размер премии.
       SUM(sum_reward) AS sum_reward,
       -- xix. Общую сумму зарплат(+ премии) до индексации
       SUM(salary_and_reward) AS salary_and_reward,
       -- xx. Общую сумму зарплат(+ премии) после индексации(премии не индексируются)
       SUM((CASE
           WHEN bonus_score IS NOT NULL THEN tmp_salary * (bonus_score)
           ELSE tmp_salary END) + index_salary) AS index_salary_reward,
       --xxi. Разницу в % между предыдущими двумя суммами(первая/вторая)
       SUM(sum_reward)/SUM(salary_and_reward)*100 AS percent_of_diff

FROM department
JOIN staff s ON s.department_id = department.id
JOIN level l ON L.id = s.level_id
JOIN index_salary_tmp index ON index.id = s.id
LEFT JOIN score_count ON score_count.dep_id = department.id

GROUP BY department.title, full_name_chief,
         score_count.grade_a, score_count.grade_b, score_count.grade_c, score_count.grade_d, score_count.grade_e
