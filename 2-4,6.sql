/*2*/
CREATE SCHEMA `myjoinsdb`;
/*3*/
  CREATE TABLE `employees` (
  `e_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`e_id`));
  
  CREATE TABLE `salary` (
  `e_id` INT NOT NULL,
  `salary` INT NOT NULL,
  `job_title` VARCHAR(30) NULL,
  PRIMARY KEY (`e_id`));
  
  CREATE TABLE `personalinfo` (
  `e_id` INT NOT NULL,
  `marital_status` VARCHAR(30) NULL,
  `birthday` DATE NULL,
  `address` VARCHAR(100) NULL,
  PRIMARY KEY (`e_id`));
  
  /*insert into employees
  (name, phone)
  values
  ('John', '555-963-147');
  
  insert into salary
  (e_id, salary, job_title)
  values
  (3, 59000, 'QA');
  
  insert into personalinfo
  (e_id, marital_status, birthday, address)
  values
  (3, 'single', '1997-02-28', 'NY');*/
  
  /*4.1*/
  select employees.name, employees.phone, personalinfo.address from employees
  left join personalinfo on employees.e_id = personalinfo.e_id;
  
  /*4.2*/
  select employees.name, employees.phone, personalinfo.birthday from employees  
  left join personalinfo on employees.e_id = personalinfo.e_id
  where personalinfo.marital_status = 'single';
  
  /*4.3*/
  select employees.name, employees.phone, personalinfo.birthday from employees  
  left join personalinfo on employees.e_id = personalinfo.e_id
  left join salary on salary.e_id = personalinfo.e_id
  where salary.job_title = 'PM';
  
  /*6*/
  select c.FName as CustomerFirstName, c.LName as CustomerLastName, e.FName as EmployeeFirstName, e.LName as EmployeeLastName
  from Orders o
  join OrderDetails od on o.OrderID = od.OrderID
  join Customers c on o.CustomerNo = c.CustomerNo
  join Employees e on o.EmployeeID = e.EmployeeID
  group by o.OrderID, c.CustomerNo, e.EmployeeID
  having sum(od.TotalPrice) > 1000;