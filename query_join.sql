/*1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia*/

SELECT `students`.`name`,`students`.`surname`, `degrees`.`name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia"
ORDER BY `students`.`name`

/*. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze*/
SELECT `degrees`.*, `departments`.`name`
FROM  `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`level` ="magistrale" AND `departments`.`name` = "Dipartimento di Neuroscienze"

/*3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)*/
select `courses`.`id`, `courses`.`name`, `courses`.`description`, `courses`.`period`, `teachers`.`name`, `teachers`.`surname`
from `courses`
inner join `course_teacher`
on `courses`.`id` = `course_teacher`.`course_id`
inner join `teachers`
on `teachers`.`id` = `course_teacher`.`teacher_id`
where `teachers`.`name` = "Fulvio" and `teachers`.`surname` = "amato"
order by `courses`.`name`

/*4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome*/
select `students`.`name`,`students`.`surname` ,`students`.`date_of_birth`, `degrees`.`name`,`degrees`.`level`, 
`degrees`.`address`,`departments`.`name`,`departments`.`address`
from `students`
inner join `degrees`
on `students`.`degree_id` = `degrees`.`id`
inner join `departments`
on `degrees`.`department_id` = `departments`.`id`
order by `students`.`surname` ,`students`.`name`

/*5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti*/
select `degrees`.`id`,`degrees`.`name`, `degrees`.`level` , `courses`.`id`, `courses`.`name`,`courses`.`year`,`teachers`.`id`,
`teachers`.`name`,`teachers`.`surname`
from `degrees`
inner join `courses`
on `courses`.`degree_id` = `degrees`.`id`
inner join `course_teacher`
on `course_teacher`.`course_id` = `courses`.`id`
inner join `teachers`
on `course_teacher`.`teacher_id` = `teachers`.`id`
order by `degrees`.`name`

/*6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)*/
select `teachers`.`id`,`teachers`.`name`,`teachers`.`surname`, `departments`.`id`,`departments`.`name`
from `teachers`
inner join `course_teacher`
on `teachers`.`id` = `course_teacher`.`teacher_id`
inner join `courses`
on `courses`.`id` = `course_teacher`.`course_id`
inner join `degrees`
on `degrees`.`id` = `courses`.`degree_id`
inner join `departments`
on `departments`.`id` = `degrees`.`department_id`
where `departments`.`name` = "Dipartimento di Matematica"
order by `teachers`.`surname`
