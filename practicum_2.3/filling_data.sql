-- ЗАПОЛНЕНИЕ ТАБЛИЦ ДАННЫМИ


-- Отдел; Руководитель; Кол-во сотрудников, включая руководителя

INSERT INTO departments
(dep_title, boss_name, staff_size)
VALUES
    ('Бухгалтерия', 'Сафонова Марина Дмитриевна', 4),
    ('Секретариат', 'Кузьмина Светлана Александровна', 4),
    ('Отдел разработки ПО', 'Краснов Александр Александрович', 10),
    ('Служба транспортного обеспечения', 'Теплов Денис Сергеевич', 7),
    ('Служба координации бизнес-процессов', 'Вернер Елена Андреевна', 4),
    ('Отдел продаж', 'Жарова Марина Владимировна', 4),
    ('Отдел Административно-хозяйственного обеспечения', 'Котов Роман Геннадьевич', 9);

-- Информация о сотрудниках

INSERT INTO employee_main
(full_name, birthday, employment_date, position, experience_level, salary, department_id, driver_license)
VALUES
('Сафонова Марина Дмитриевна', '1959.11.24', '1999.02.14', 'Главный бухгалтер', 'Not applicable', 355000, 1, 'False' ),
('Макаров Антон Алексеевич', '1972.02.24', '2011.04.12', 'Ведущий бухгалтер', 'Not applicable', 95000, 1, 'True' ),
('Сиднева Ирина Олеговна', '1959.08.27', '2009.11.01', 'Бухгалтер', 'Not applicable', 55000, 1, 'False'),
('Французова Елена Анатольевна', '1981.06.11', '2010.08.03', 'Бухгалтер по учету расчетов с персоналом', 'Not applicable', 65000, 1, 'False'),
('Кузьмина Светлана Александровна', '1981.04.27', '2011.03.18', 'Управляющий делами', 'Not applicable', 250000, 2, 'True'),
('Шестакова Ольга Дмитриевна', '1995.04.25', '2019.01.14', 'Секретарь', 'Not applicable', 60000, 2, 'True'),
('Яковлева Дарья Андреевна', '1992.01.26', '2017.04.18', 'Помощник Генерального директора', 'Not applicable', 90000, 2, 'True'),
('Фролова Альбина Сергеевна', '2000.07.03', '2021.06.12', 'Секретарь', 'Not applicable', 45000, 2, 'False'),
('Краснов Александр Александрович', '1964.08.16', '2011.05.13', 'Руководитель Отдела разработки ПО', 'Lead', 600000, 3, 'True'),
('Федоров Андрей Васильевич', '1978.12.05', '1999.03.14', 'Ведущий разработчик', 'Senior', 155000, 3, 'True'),
('Петров Александр Олегович', '1993.07.18', '2017.08.18', 'Разработчик', 'Junior', 45000, 3, 'False'),
('Матвеева Оксана Борисовна', '1963.09.08', '2000.11.21', 'Разработчик', 'Middle', 80000, 3, 'True'),
('Медведев Юрий Альбертович', '1988.04.11', '2012.02.05', 'Разработчик', 'Middle', 80000, 3, 'True'),
('Демидова Юлия Викторовна', '1984.09.21', '2017.01.12', 'Разработчик', 'Junior', 45000, 3, 'False'),
('Кононов Александр Вадимович', '1990.04.07', '2016.02.09', 'Тестировщик', 'Junior', 50000, 3, 'True'),
('Струк Вероника Николаевна', '1986.05.05', '2014.05.19', 'Тестировщик', 'Middle', 75000, 3, 'False'),
('Поздняя Оксана Викторовна', '1977.07.03', '2009.09.25', 'Ведущий разработчик', 'Senior', 155000, 3, 'False'),
('Иванова Нина Владимировна', '1962.03.03', '2004.12.16', 'Ведущий тестировщик', 'Senior', 130000, 3, 'False'),
('Теплов Денис Сергеевич', '1969.09.09', '2004.10.19', 'Руководитель Службы транспортного обеспечения', 'Not applicable', 140000, 4, 'True'),
('Копылов Иван Сергеевич', '1995.08.11', '2019.03.30', 'Водитель', 'Not applicable', 80000, 4, 'True'),
('Лебедев Михаил Дмитриевич', '1989.01.01', '2013.12.01', 'Водитель', 'Not applicable', 60000, 4, 'True'),
('Курочкин Аркадий Константинович', '1988.11.09', '2010.01.08', 'Водитель', 'Not applicable', 60000, 4, 'True'),
('Кий Марк Маркович', '1988.10.24', '2012.02.14', 'Водитель', 'Not applicable', 80000, 4, 'True'),
('Ли Ирина Степановна', '1991.02.27', '2018.04.17', 'Диспетчер', 'Not applicable', 55000, 4, 'True'),
('Оганезова Ольга Павловна', '1969.06.30', '1998.09.30', 'Логист', 'Not applicable', 75000, 4, 'True'),
('Вернер Елена Андреевна', '1983.07.23', '2019.08.20', 'Руководитель Службы координации бизнес-процессов', 'Not applicable', 140000, 5, 'False'),
('Парусов Дмитрий Антонович', '1994.06.15', '2016.11.30', 'Ведущий специалист', 'Not applicable', 75000, 5, 'True'),
('Старостина Янина Андреевна', '2001.06.08', '2022.12.23', 'Специалист', 'Not applicable', 45000, 5, 'False'),
('Смирнова Татьяна Васильевна', '1996.04.11', '2018.11.10', 'Специалист', 'Not applicable', 45000, 5, 'True'),
('Жарова Марина Владимировна', '1979.12.22', '2007.08.15', 'Руководитель Отдела продаж', 'Not applicable', 370000, 6, 'True'),
('Крылов Петр Миронович', '1979.12.22', '2007.08.15', 'Маркетолог', 'Not applicable', 90000, 6, 'True'),
('Ларионова Алина Вячеславовна', '1991.09.14', '2015.02.13', 'Менеджер', 'Not applicable', 70000, 6, 'True'),
('Арефьев Артемий Зиновьевич', '1956.01.19', '1998.12.22', 'Менеджер', 'Not applicable', 70000, 6, 'True'),
('Котов Роман Геннадьевич', '1998.09.24', '2020.10.17', 'Руководитель Отдела АХО', 'Not applicable', 250000, 7, 'True'),
('Антонова Юлиана Казбековна', '1998.09.24', '2020.10.17', 'Уборщик', 'Not applicable', 40000, 7, 'False'),
('Лурье Андрей Андреевич', '1984.04.07', '2012.03.06', 'Уборщик', 'Not applicable', 40000, 7, 'True'),
('Уткин Армен Макарович', '1999.05.29', '2020.12.04', 'Электрик', 'Not applicable', 50000, 7, 'True'),
('Жукова Елена Анатольевна', '1961.06.09', '2005.07.05', 'Дворник', 'Not applicable', 35000, 7, 'False'),
('Орлов Федер Федорович', '2003.08.18', '2022.01.09', 'Слесарь', 'Not applicable', 45000, 7, 'True'),
('Тяпин Сергей Борисович', '1992.12.03', '2018.09.13', 'Грузчик', 'Not applicable', 30000, 7, 'True'),
('Штукина Тамара Геннадьевна', '1975.07.30', '2013.11.23', 'Кладовщик', 'Not applicable', 55000, 7, 'False'),
('Аркашин Всеволод Петрович', '1968.03.17', '2014.11.30', 'Грузчик', 'Not applicable', 30000, 7, 'False');

-- Поквартальные оценки качества работыкаждого сотрудника

INSERT INTO employee_scores
(employee_id, first_quarter, second_quarter, third_quarter, fourth_quarter)
VALUES
(1, 'A', 'A', 'A', 'A'),
(2, 'A', 'A', 'A', 'A'),
(3, 'A', 'A', 'B', 'A'),
(4, 'A', 'B', 'B', 'A'),
(5, 'A', 'A', 'A', 'A'),
(6, 'A', 'A', 'B', 'C'),
(7, 'A', 'A', 'A', 'B'),
(8, 'B', 'C', 'A', 'A'),
(9, 'A', 'A', 'B', 'B'),
(10, 'A', 'B', 'B', 'C'),
(11, 'A', 'D', 'B', 'E'),
(12, 'A', 'A', 'A', 'A'),
(13, 'A', 'D', 'A', 'A'),
(14, 'D', 'E', 'E', 'A'),
(15, 'A', 'B', 'C', 'A'),
(16, 'A', 'A', 'B', 'A'),
(17, 'A', 'A', 'A', 'A'),
(18, 'A', 'A', 'B', 'A'),
(19, 'C', 'A', 'A', 'A'),
(20, 'A', 'B', 'C', 'A'),
(21, 'A', 'A', 'B', 'B'),
(22, 'A', 'A', 'A', 'A'),
(23, 'C', 'D', 'E', 'A'),
(24, 'A', 'A', 'B', 'A'),
(25, 'A', 'B', 'E', 'A'),
(26, 'A', 'A', 'A', 'A'),
(27, 'A', 'A', 'A', 'A'),
(28, 'C', 'D', 'C', 'E'),
(29, 'A', 'A', 'E', 'B'),
(30, 'A', 'A', 'B', 'B'),
(31, 'A', 'D', 'D', 'B'),
(32, 'A', 'A', 'B', 'E'),
(33, 'A', 'D', 'A', 'E'),
(34, 'A', 'A', 'A', 'A'),
(35, 'A', 'A', 'A', 'A'),
(36, 'A', 'A', 'A', 'A'),
(37, 'A', 'D', 'E', 'A'),
(38, 'A', 'A', 'A', 'A'),
(39, 'D', 'C', 'E', 'A'),
(40, 'A', 'D', 'E', 'E'),
(41, 'A', 'A', 'B', 'A'),
(42, 'B', 'D', 'E', 'E');

/* 5. Ваша команда расширяется и руководство запланировало открыть новый отдел – отдел Интеллектуального анализа данных. 
На начальном этапе в команду наняли одного руководителя отдела и двух сотрудников. 
Добавьте необходимую информацию в соответствующие таблицы. */

INSERT INTO departments
(dep_title, boss_name, staff_size)
VALUES
('Отдел Интелектуального анализа данных', 'Занудов Борис Афанасьевич', 3);

INSERT INTO employee_main
(full_name, birthday, employment_date, position, experience_level, salary, department_id, driver_license)
VALUES
('Занудов Борис Афанасьевич', '1974.10.25', '2022.10.12', 'Начальник Отдела Интелектуального анализа данных', 'Lead', 240000, 1, 'True' ),
('Каримов Всеволод Андреевич', '1990.04.07', '2022.10.30', 'Аналитик', 'Middle', 120000, 1, 'True' ),
('Даниленко Яков Федорович', '1996.02.20', '2022.11.16', 'Аналитик', 'Junior', 70000, 1, 'False');

/*  6. Теперь пришла пора анализировать наши данные – напишите запросы для получения следующей информации:
6.1 Уникальный номер сотрудника, его ФИО и стаж работы – для всех сотрудников компании */

SELECT employee_id, 
       full_name, 
       SUM((NOW()::date - employment_date)/7) AS experience_of_work
FROM employee_main
GROUP BY employee_id, 
         full_name;

/* 6.2 Уникальный номер сотрудника, его ФИО и стаж работы – только первых 3-х сотрудников */

SELECT employee_id, 
       full_name, 
       SUM((NOW()::date - employment_date)/7) AS experience_of_work
FROM employee_main
GROUP BY employee_id, 
         full_name
LIMIT 3;

/* 6.3 Уникальный номер сотрудников - водителей */

SELECT employee_id
FROM employee_main
WHERE driver_license = 'True'

/* 6.4 Выведите номера сотрудников, которые хотя бы за 1 квартал получили оценку D или E */

SELECT employee_main.employee_id
FROM employee_main
JOIN score ON employee.employee_id = score.score_id
WHERE first_quarter LIKE '%D%' OR first_quarter LIKE  '%E%' OR
      second_quarter LIKE '%D%' OR second_quarter LIKE  '%E%' OR
      third_quarter LIKE '%D%' OR third_quarter LIKE  '%E%' OR
      fourth_quarter LIKE '%D%' OR fourth_quarter LIKE  '%E%';

/* 6.5 Выведите самую высокую зарплату в компании. */

SELECT MAX(salary)
from employee_main;

/* 6.6* Выведите название самого крупного отдела */

SELECT dep_title
FROM departments
ORDER BY staff_size DESC
LIMIT 1;

/* 6.7* Выведите номера сотрудников от самых опытных до вновь прибывших */

SELECT employee_id, 
       full_name, 
       SUM((NOW()::date - employment_date)/7) AS experience_of_work
FROM employee_main
GROUP BY  employee_id
ORDER BY employment_date;

/* 6.8* Рассчитайте среднюю зарплату для каждого уровня сотрудников */

SELECT  experience_level, 
        AVG(salary)
FROM employee_main
WHERE experience_level = 'Lead'
GROUP BY experience_level;

SELECT  experience_level, 
        AVG(salary)
FROM employee_main
WHERE experience_level = 'Senior'
GROUP BY experience_level;

SELECT  experience_level, 
        AVG(salary)
FROM employee_main
WHERE experience_level = 'Middle'
GROUP BY experience_level;

SELECT  experience_level, 
        AVG(salary)
FROM employee_main
WHERE experience_level = 'Junior'
GROUP BY experience_level;

SELECT  experience_level, 
        AVG(salary)
FROM employee_main
WHERE experience_level = 'Not applicable'
GROUP BY experience_level;

/* 6.9* Добавьте столбец с информацией о коэффициенте годовой премии к основной таблице. 
Коэффициент рассчитывается по такой схеме: базовое значение коэффициента – 1, 
каждая оценка действует на коэффициент так:
        Е – минус 20%
        D – минус 10%
        С – без изменений
        B – плюс 10%
        A – плюс 20%
Соответственно, сотрудник с оценками А, В, С, D – должен получить коэффициент 1.2. */

SELECT full_name, (
    SELECT first_score * second_score * third_score * fourth_score AS score_bonus
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
        WHERE (employee_scores.employee_id = employee_main.employee_id)
    )quarter_score
) FROM employee