const inquirer = require('inquirer');
const mysql = require('mysql2');
const cTable = require('console.table');
const inputCheck = require('./utils/inputCheck');

// Connect to database
const db = mysql.createConnection({
        host: 'localhost',
        // Your MySQL username,
        user: 'root',
        // Your MySQL password
        password: '$orc22ereR',
        database: 'employee_tracker'
    },
    console.log('Connected to the employee_tracker database.')
);

const questions = [{
        type: 'list',
        name: 'options',
        message: 'What would you like to do?',
        choices: [
            'View All Departments',
            'View All Roles',
            'View All Employees',
            'Add A Department',
            'Add A Role',
            'Add A Employee',
            'Update An Employee Role'
        ]
    },

    {
        type: 'input',
        name: 'newDepartmentName',
        message: 'What Is The Name Of Your Department?',
        when: (answers) => {
            if (answers.options == 'Add A Department') {
                return true
            } else {
                return false
            }
        }
    },

    {
        type: 'input',
        name: 'addNewRole',
        message: 'What Is The name Of The New Role?',
        when: (answers) => {
            if (answers.options == 'Add A Role') {
                return true
            } else {
                return false
            }
        }
    },

    {
        type: 'input',
        name: 'addNewEmployee',
        message: 'What Is The Name Of The New Employee?',
        when: (answers) => {
            if (answers.options == 'Add An Employee') {
                return true
            } else {
                return false
            }
        }
    }
];



function myAnswers(answers) {
    switch (answers.options) {
        case 'View All Departments':
            db.promise()
                .query('SELECT * FROM department')
                .then(([rows, fields]) => {
                    let results = cTable.getTable(rows);
                    console.log(results);
                    restart()

                })

            break;

        case 'View All Roles':
            console.log('View All Roles')
            db.query('SELECT * FROM role', (err, results, fields) => {
                let roleResults = cTable.getTable(results);
                console.log(roleResults)
            })
            break;

        case 'View All Employees':
            console.log('View All Employees')
            db.query('SELECT * FROM employee', (err, rows, fields) => {
                let employeeResults = cTable.getTable(rows);
                console.log(employeeResults)
            })
            break;



        case 'Add A Department':
            console.log('Add A Department')
            db.promise()
                .query(`INSERT INTO department (name) VALUES('${answers.newDepartmentName}')`)
                .then(([rows, fields]) => {
                    console.log('added a department')

                })
            break;

        case 'Add A Role':
            console.log('Add A Role')
            db.promise()
                .query(`INSERT INTO role (title, salary, department_id) VALUES('${answers.addNewRole}')`)
                .then(([rows, fields]) => {
                    console.log('added a role')
                })
            break;

        case 'Add A Employee':
            console.log('Add A Employee')
            db.promise()
                .query(`INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES('${answers.addNewEmployee}')`)
                .then(([rows, fields]) => {
                    console.log('added an employee')

                })
            break;

        case 'Update An Employee Role':
            console.log('Update An Employee Role')
            break;


        default:
            break;
    }
}

function employeeTracker() {
    inquirer
        .prompt(questions)
        .then(myAnswers)

}

function restart() {
    employeeTracker()
}

employeeTracker()