CREATE TABLE departments (
    dept_no CHAR(4) PRIMARY KEY, 
    dept_name VARCHAR(40) NOT NULL UNIQUE 
);


CREATE TABLE dept_emp (
    emp_no INT NOT NULL, 
    dept_no CHAR(4) NOT NULL, 
    from_date DATE NOT NULL, 
    to_date DATE NOT NULL, 
    PRIMARY KEY (emp_no, dept_no), 
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE
);


CREATE TABLE dept_manager (
    dept_no CHAR(4) NOT NULL, 
    emp_no INT NOT NULL, 
    from_date DATE NOT NULL, 
    to_date DATE NOT NULL, 
    PRIMARY KEY (dept_no, emp_no), 
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE
);




CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id INT,
    birth_date DATE NOT NULL,
    first_name VARCHAR(14) NOT NULL,
    last_name VARCHAR(16) NOT NULL, 
    gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
    hire_date DATE NOT NULL
);




CREATE TABLE salaries (
    emp_no INT NOT NULL, 
    salary INT NOT NULL, 
    from_date DATE NOT NULL, 
    to_date DATE NOT NULL, 
    PRIMARY KEY (emp_no, from_date), 
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE
);





CREATE TABLE titles (
    emp_no INT NOT NULL, 
    title VARCHAR(50) NOT NULL, 
    from_date DATE NOT NULL, 
    to_date DATE NOT NULL, 
    PRIMARY KEY (emp_no, title, from_date), 
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE
);



