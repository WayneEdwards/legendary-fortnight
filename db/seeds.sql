INSERT INTO department (name);
VALUES
('Sales'),
('Engineering'),
('Finance'),
('Legal');

INSERT INTO role (title, salary, department_id)
VALUES
 ('Sales Lead', 100000, 1),
 ('Salesperson', 80000, 1),
 ('Lead Engineer', 150000, 2),
 ('Software Engineer', 120000, 2),
 ('Account Lead', 150000, 3),
 ('Accountant', 125000, 3),
 ('Legal Team Lead', 250000, 4),
 ('Lawyer', 190000, 4);

 INSERT INTO employee (first_name, last_name, role_id, manager_id)
 VALUES
  ('John', 'Doe', 1, 1),
| ('Mike','Chan', 1, 1),
| ('Ashley', 'Rodriguez', 2, 2),
| ('Kevin', 'Tupik', 2, 1),
| ('Malia', 'Brown', 3, 1),
| ('Han', 'Solo', 3, 2), 
| ('Sarah', 'Lourd', 4, 2),
| ('Tom ', 'Brown', 4, 1); 
     