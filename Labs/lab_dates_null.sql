/* List the employeeid, firstname + lastname concatenated as
 ‘employee’, and the age of the employee  when they were hired. */

SELECT employeeid, CONCAT(firstname, ' ', lastname) AS "Employee",
        AGE(hiredate, birthdate) AS "Hire Age"
    FROM employees;

-- Run a query to calculate your age as of today.  

SELECT AGE(CURRENT_DATE, '2003-02-25');

/* List the employeeid, firstname + lastname concatenated as
 ‘employee’, and hire date for all employees hired in 1993 */
 SELECT employeeid, CONCAT(firstname, ' ', lastname) AS "Employee",
        hiredate
    FROM employees 
    WHERE DATE_PART('year', hiredate) = 1993;