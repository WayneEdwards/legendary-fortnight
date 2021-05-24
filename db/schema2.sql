DROP DATABASE IF EXISTS `employee_tracker2`;
CREATE DATABASE `employee_tracker2`;
USE `employee_tracker2`;


CREATE TABLE `department` (
	`id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(30),
	PRIMARY KEY (`id`)
);
INSERT INTO `department` (`name`) VALUES('Sales');
INSERT INTO `department` (`name`) VALUES('Engineering');
INSERT INTO `department` (`name`) VALUES('Finance');
INSERT INTO `department` (`name`) VALUES('Legal');


CREATE TABLE `role` (
	`id` int AUTO_INCREMENT NOT NULL,
	`title` varchar(30),
	`salary` decimal(6),
	`department_id` int,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
);

INSERT INTO `role` (`title`,`salary`,`department_id`)
 VALUES
 ('Sales Lead',  85000, 1),
('Accountant',  85000, 3),
('Salesperson', 80000, 1),
 ('Lead Engineer', 150000, 2),
 ('Software Engineer', 120000, 2),
 ('Account Lead', 150000, 3),
 ('Legal Team Lead', 250000, 4),
 ('Lawyer', 190000, 4);
 


CREATE TABLE `employee` (
	`id` int AUTO_INCREMENT NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`role_id` int,
	`manager_id` int,
	PRIMARY KEY (id),
	FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
	FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`)
);

INSERT INTO `employee` (`first_name`,`last_name`,`role_id`,`manager_id`)
 VALUES
    ('Mary','Smith',1,null),
    ('Jane','Doe',2,null),
    ('Ashley', 'Rodriguez',2,2),
    ('Kevin', 'Tupik',2,1),
    ('Malia', 'Brown',3,1),
    ('Han', 'Solo',3,2), 
    ('Sarah', 'Lourd',4,2),
    ('Tom ', 'Brown',4,1); 

