create database escuelita;
GO

use escuelita

create table empleado (
    idEmpleado int not null primary KEY,
    nombre nvarchar(50) not null,
    sueldo money DEFAULT 1500

)

insert into empleado (idEmpleado, nombre, sueldo)
    values (1, 'Felide de Jesus', 2000)

select * from empleado;


insert into empleado(idEmpleado, nombre)
    values (2, 'Chuerk')
SELECT * from empleado

create table personita (
    idEmpleado int not null primary KEY,
    nombre nvarchar(50) not null,
    sueldo money DEFAULT 1500,
    telefono varchar(20) check ( telefono like '667[0-9][0-9][0-9]' )
)

insert into personita values (1, 'Juana', null, '667123')

alter table empleado
    add sexo char(1) null check (sexo in ('H', 'M') )

select * from empleado 
insert into empleado (idEmpleado, nombre, sexo) values (3, 'Alexis Jara Rodriguez', 'H' )

insert into empleado (idEmpleado, nombre, sexo) values (4, 'Matilde Sandoval', 'T' )

alter table empleado
    drop CONSTRAINT CK__empleado__sexo__3C69FB99


insert into empleado (idEmpleado, nombre, sexo) values (4, 'Matilde Sandoval', 'T' )
select * from empleado


alter table empleado
    add constraint sexonuevasopciones check (sexo in ('H', 'M', 'T', 'F') )

insert into empleado (idEmpleado, nombre, sexo) values (5, 'Refugio Saldívar', 'F' )

insert into empleado (idEmpleado, nombre, sexo) values (7, 'Delia Barrantes' , 'R')



alter table empleado 
    add nacimiento date not null 

select * from empleado

alter table empleado
    add RFC char(13)  null


alter table empleado
    add constraint rfc_unico unique (RFC)
    -- check ( date < getDate() )

update empleado
    set RFC = 'CCC555'
    where idEmpleado = 5
    
select * from empleado 

insert into empleado (idEmpleado, nombre, sexo, rfc) values (6, 'Refugio Saldívar', 'F', 'CCC555' )

create table Departamento (
    idDepartamento int not null PRIMARY key,
    Nombre nvarchar(30)
)

insert into Departamento (idDepartamento, Nombre)
    values (1, 'Ventas'), (2, 'MKT'), (3, 'TIC')

select * from Departamento

alter table empleado    
    add TrabajaEn int null FOREIGN Key   REFERENCES departamento (idDepartamento)   

select * from empleado

update empleado
    set TrabajaEn = 1
    where idEmpleado in (1, 2)

update empleado
    set TrabajaEn = 2
    where idEmpleado in (3, 5)

update empleado
    set TrabajaEn = 3
    where idEmpleado = 4

delete from Departamento
    where idDepartamento = 2

alter table empleado
    drop CONSTRAINT FK__empleado__Trabaj__412EB0B6

alter table empleado
    add CONSTRAINT FK_empleado_TrabajaEn FOREIGN KEY (TrabajaEn) REFERENCES Departamento (idDepartamento)
        on delete set null 

delete from Departamento
    where idDepartamento = 2
SELECT * from empleado


CREATE TABLE Familiares (
    nombre nvarchar(50) not null, 
    idEmpleado int not null FOREIGN key REFERENCES empleado(idEmpleado) on DELETE CASCADE
)


insert into Familiares (nombre, idEmpleado )
    values ('Gertrudis', 1), ('Daniela', 1), ('Manuel', 2)

select  * from  empleado
SELECT * from Familiares

delete from empleado 
    where idEmpleado = 1

select * from Familiares
