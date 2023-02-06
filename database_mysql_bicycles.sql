CREATE TABLE `customer` ( 
`customer_id` INT PRIMARY KEY NOT NULL, 
`name` varchar(100) NOT NULL, 
`address` varchar(100) NOT NULL, 
`phone_number` varchar(100) NOT NULL 
); 
CREATE TABLE `freight_forwarding` ( 
`freight_forwarding _id` INT PRIMARY KEY NOT NULL, 
`name` varchar(100) NOT NULL, 
`address` varchar(100) NOT NULL 
); 
CREATE TABLE `supplier` ( 
`supplier_id` INT PRIMARY KEY NOT NULL, 
`name` varchar(100) NOT NULL, 
`phone_number` varchar(100) NOT NULL 
); 
CREATE TABLE `raw_materials` ( 
`raw_materials_id` INT PRIMARY KEY NOT NULL, 
`supplier_id` INT, 
`name` INT NOT NULL, 
`quantity` INT NOT NULL, 
FOREIGN KEY(supplier_id) REFERENCES supplier(supplier_id) ON DELETE SET NULL 
); 
CREATE TABLE `machines` ( 
`machines_id` INT PRIMARY KEY NOT NULL, 
`name` varchar(100) NOT NULL 
); 
CREATE TABLE `employee` ( 
`employee_id` INT PRIMARY KEY NOT NULL, 
`name` varchar(100) NOT NULL, 
`address` varchar(100) NOT NULL, 
`machines` INT, 
`phone_number` INT NOT NULL, 
FOREIGN KEY(machines_id) REFERENCES machines(machines_id) ON DELETE SET NULL 
); 
CREATE TABLE `warehouse` ( 
`warehouse_id` INT PRIMARY KEY NOT NULL, 
`name` INT NOT NULL 
);
CREATE TABLE `externally_sourced_parts` ( 
`externally_sourced_parts_id` INT PRIMARY KEY NOT NULL, 
`supplier_id` INT, 
`warehouse_id` INT, 
`name` INT NOT NULL, 
`type` INT NOT NULL, 
`quantity` INT, 
FOREIGN KEY(supplier_id) REFERENCES supplier(supplier_id) ON DELETE SET NULL, 
FOREIGN KEY(warehouse_id) REFERENCES warehouse(warehouse_id) ON DELETE SET NULL 95 

); 
CREATE TABLE `self_produced_parts` ( 
`self_produced_parts_id` INT PRIMARY KEY NOT NULL, 
`name` INT NOT NULL, 
`raw_materials_id` INT, 
`machines_id` INT, 
`measurement` varchar(100) NOT NULL, 
`quantity` INT, 
`warehouse_id` INT, 
FOREIGN KEY(machines_id) REFERENCES machines(machines_id) ON DELETE SET NULL, 
FOREIGN KEY(raw_materials_id) REFERENCES raw_materials(raw_materials_id) ON DELETE SET NULL, 
FOREIGN KEY(warehouse_id) REFERENCES warehouse(warehouse_id) ON DELETE SET NULL 
); 
CREATE TABLE `articles` ( 
`articles_id` INT PRIMARY KEY NOT NULL, 
`warehouse_id` INT, 
`name` varchar(100) NOT NULL, 
`machines` INT, 
`price` INT NOT NULL, 
`quantity` INT NOT NULL, 
FOREIGN KEY(machines) REFERENCES machines(machines_id) ON DELETE SET NULL, 
FOREIGN KEY(warehouse_id) REFERENCES warehouse(warehouse_id) ON DELETE SET NULL 
); 
CREATE TABLE `Order` ( 
`order_id` INT PRIMARY KEY NOT NULL, 
`customer_id` INT, 
`employee_id` INT, 
`articles_id` INT, 
`freight_forwarding _id` INT, 
`completed` varchar(1), 
FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE SET NULL, 
FOREIGN KEY(employee_id) REFERENCES employee(employee_id) ON DELETE SET NULL, 
FOREIGN KEY(freight_forwarding _id) REFERENCES freight_forwarding(freight_forwarding _id) ON DELETE SET NULL, 
FOREIGN KEY(articles_id) REFERENCES article(articles_id) ON DELETE SET NULL 
); 
CREATE TABLE `work schedule` ( 
`work schedule _id` INT PRIMARY KEY NOT NULL, 
`articles` INT, 
`order INT, 
`employee_in_charge` varchar(100) NOT NULL, 
`creation_date` Date NOT NULL, 
`completion` Date NOT NULL, 
FOREIGN KEY(articles) REFERENCES articles(articles_id) ON DELETE SET NULL, 
FOREIGN KEY(order) REFERENCES order(order_id) ON DELETE SET NULL 
); 
CREATE TABLE `work_step` ( 
`work_step_id` INT PRIMARY KEY NOT NULL, 
`externally_sourced_parts_id` INT,
`self_produced_parts_id` INT, 
`work_schedule_id` INT, 96 

`machines_id` INT, 
`name` INT NOT NULL, 
`quantity` INT NOT NULL, 
FOREIGN KEY(externally_sourced_parts_id) REFERENCES externally_sourced_parts(externally_sourced_parts_id) ON DELETE SET NULL, 
FOREIGN KEY(self_produced_parts_id) REFERENCES self_produced_parts(self_produced_parts_id) ON DELETE SET NULL, 
FOREIGN KEY(work_schedule_id) REFERENCES work_schedule(work_schedule_id) ON DELETE SET NULL, 
FOREIGN KEY(machines_id) REFERENCES machine(machines_id) ON DELETE SET NULL 
);
