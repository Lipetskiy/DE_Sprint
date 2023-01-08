
/* 2. Для будущих отчетов аналитики попросили вас создать еще одну таблицу с информацией по отделам – 
в таблице должен быть идентификатор для каждого отдела, название отдела (например. Бухгалтерский или IT отдел), 
ФИО руководителя и количество сотрудников. */

CREATE TABLE IF NOT EXISTS department
(
    department_id SERIAL START WITH 1 PRIMARY KEY,
    dep_title VARCHAR(128) NOT NULL,
    boss_name VARCHAR(128) NOT NULL ,
    staff_size INT NOT NULL
);

COMMENT ON TABLE department
    IS 'Отдел';

/*  1. Создать таблицу с основной информацией о сотрудниках: ФИО, дата рождения, дата начала работы, должность, 
уровень сотрудника (jun, middle, senior, lead), уровень зарплаты, идентификатор отдела, наличие/отсутствие прав(True/False). 
При этом в таблице обязательно должен быть уникальный номер для каждого сотрудника. */
    
CREATE TABLE IF NOT EXISTS employee
(
    employee_id SERIAL NOT NULL PRIMARY KEY,                                  -- табельный номер сотрудника - первичный ключ
    full_name VARCHAR(128) NOT NULL,                                 -- ФИО сотрудника
    birthday DATE NOT NULL,                                          -- день рождения сотрудника 
    employment_date DATE NOT NULL,                                   -- дата приема на работу 
    position VARCHAR(255) NOT NULL,                                  -- должность 
    experience_level VARCHAR(14) NOT NULL DEFAULT 'Not applicable',  -- уровень опыта 
    salary INT NOT NULL,                                             -- зарплата
    department_id INT,                                               -- цифровой идентификатор отдела
    driver_license BOOLEAN NOT NULL DEFAULT false,                   -- наличие/отсутствие водительских прав

    CONSTRAINT department
        FOREIGN KEY (department_id)
        REFERENCES  department(department_id)
);

COMMENT ON TABLE employee
    IS 'Информация о сотруднике';


/* 3. На кону конец года и необходимо выплачивать сотрудникам премию. Премия будет выплачиваться по совокупным оценкам, 
которые сотрудники получают в каждом квартале года. Создайте таблицу, в которой для каждого сотрудника будут его оценки 
за каждый квартал. Диапазон оценок от A – самая высокая, до E – самая низкая. */

CREATE TABLE IF NOT EXISTS score
(
    score_id SERIAL NOT NULL PRIMARY KEY ,
    employee_id INT,
    first_quarter VARCHAR(1) CHECK (score.first_quarter ~ '[A-E]'),
    second_quarter VARCHAR(1) CHECK (score.second_quarter ~ '[A-E]'),
    third_quarter VARCHAR(1) CHECK (score.third_quarter ~ '[A-E]'),
    fourth_quarter VARCHAR(1) CHECK (score.fourth_quarter ~ '[A-E]'),
    CONSTRAINT employee_id
        FOREIGN KEY (employee_id)
        REFERENCES employee(employee_id)
);

COMMENT ON TABLE score
    IS 'Рейтинговые оценки сотрудника';



