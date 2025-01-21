/*1. Selezionare tutti gli studenti nati nel 1990 (160)*/
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;


/*2. Selezionare tutti i corsi che valgono più di 10 crediti (479)*/
SELECT *
FROM `courses`
WHERE `cfu` > 10;

/*3. Selezionare tutti gli studenti che hanno più di 30 anni*/
SELECT * 
FROM students
WHERE date_of_birth <= DATE_SUB(CURDATE(), INTERVAL 30 YEAR)
ORDER BY date_of_birth DESC

/*4. Selezionare tutti i corsi del primo semestre del primo anno 
di un qualsiasi corso di laurea (286)*/
SELECT *
FROM `courses`
WHERE `period` = "I semestre" AND `year` = 1


/*5. Selezionare tutti gli appelli d'esame che avvengono
nel pomeriggio (dopo le 14) del 20/06/2020 (21)*/
SELECT *
FROM `exams`
WHERE `date` = "2020-06-20" and `hour` > "14:00:00"


/*6. Selezionare tutti i corsi di laurea magistrale (38)*/
SELECT *
FROM `degrees`
WHERE `level` = "magistrale"

/*7. Da quanti dipartimenti è composta l'università? (12)*/
SELECT COUNT(*) AS "num_departments"
FROM `departments`

/*8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)*/
SELECT COUNT(*) 
FROM `teachers`
WHERE "phone" IS NULL


/*9. Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo
degree_id, inserire un valore casuale)*/
INSERT INTO `students` 
( `degree_id`,`name`, `surname`, `date_of_birth`,`fiscal_code`,`enrolment_date`,`registration_number`, `email`)
VALUES ( "2", "massimiliano", "tagliabue", "2004-12-16", "asdksaodnoadn", "2020-05-03","23213","massi@gmail.com" );


/*10. Cambiare il numero dell’ufficio del professor Pietro Rizzo in 126*/
UPDATE `teachers` SET `office_number` = '126' WHERE `name` = "pietro"

/*11. Eliminare dalla tabella studenti il record creato precedentemente al punto 9*/
DELETE  FROM `students` WHERE `surname` = "tagliabue"


QUERY CON GROUP

/*1. Contare quanti iscritti ci sono stati ogni anno*/
select `enrolment_date`, count(*)
from `students`
group by `enrolment_date`
order by `enrolment_date`

/*2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio*/
select `office_address`, count(*)
from `teachers`
group by `office_address`

/*3. Calcolare la media dei voti di ogni appello d'esame*/
select avg(`vote`) as "media"
from `exam_student`
group by `exam_id`


/*4. Contare quanti corsi di laurea ci sono per ogni dipartimento*/
select `department_id`, count(*) as "N_corsi_laurea" 
from `degrees`
group by `department_id`