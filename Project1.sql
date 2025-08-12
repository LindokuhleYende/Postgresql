CREATE TABLE employees(
  emp_id serial NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  gender varchar(50) NOT NULL,
  address varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  overtime_id integer NOT NULL,
  "Department_id" integer NOT NULL,
  "Salary_id" integer NOT NULL,
  "Roles_id" integer NOT NULL,
  CONSTRAINT employees_pkey PRIMARY KEY(emp_id)
);


CREATE TABLE "Department"(
  id integer NOT NULL,
  dept_name varchar(100) NOT NULL,
  dept_city varchar(100) NOT NULL,
  CONSTRAINT "Department_pkey" PRIMARY KEY(id)
);


CREATE TABLE "Roles"(
id integer NOT NULL, "Role" varchar(100) NOT NULL,
  CONSTRAINT "Roles_pkey" PRIMARY KEY(id)
);


CREATE TABLE "Salary"(
id integer NOT NULL, salary_pa money NOT NULL,
  CONSTRAINT "Salary_pkey" PRIMARY KEY(id)
);


CREATE TABLE "Overtime_Hours"(
id integer NOT NULL, overtime_hours time NOT NULL,
  CONSTRAINT "Overtime_Hours_pkey" PRIMARY KEY(id)
);


ALTER TABLE employees
  ADD CONSTRAINT "employees_Department_id_fkey"
    FOREIGN KEY ("Department_id") REFERENCES "Department" (id)
;


ALTER TABLE employees
  ADD CONSTRAINT "employees_Salary_id_fkey"
    FOREIGN KEY ("Salary_id") REFERENCES "Salary" (id)
;


ALTER TABLE employees
  ADD CONSTRAINT "employees_Roles_id_fkey"
    FOREIGN KEY ("Roles_id") REFERENCES "Roles" (id)
;


ALTER TABLE employees
  ADD CONSTRAINT employees_overtime_id_fkey
    FOREIGN KEY (overtime_id) REFERENCES "Overtime_Hours" (id)
;

