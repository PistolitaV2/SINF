-- Pr1
create database practicas
create table if not exists Profesores (id int not null auto_increment, 
DNI varchar (50), Nombre varchar(100), primary key(id));
create table if not exists Alumnos (id int not null auto_increment, DNI 
varchar (50), Nombre varchar(100), primary key(id));
insert into Profesores (DNI, Nombre, Apellidos, Departamento) values 
('12345678A', 'Pepe Pérez');
insert into Profesores (DNI, Nombre, Apellidos, Departamento) values 
('12345678B', 'Manolo miguez');
insert into Profesores (DNI, Nombre, Apellidos, Departamento) values 
('12345678A', 'Pepe Pérez');
select * from Profesores;
drop table Profesores;
drop table Alumnos;
create table if not exists Alumnos (id int not null auto_increment, DNI 
varchar (50), Nombre varchar(100), constraint pk_profesores primary key(id, Nombre));