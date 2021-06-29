create database Turiscol

create table empleado(
    "cedula" number not null,
	"nombre" varchar (20) not null,
	"apellido" varchar (20) not null,
	"fecha_nacimiento" date not null,
	"fecha_contratación" date not null,
	"salario" number not null,
	"tipo_contrato" varchar (20) not null,
	"ciudad" varchar (20) not null,
	"direccion" varchar (40) not null,
	"email" varchar (50),
	"area_trabajo" varchar(20) not null,
    constraint "PKempleado" primary key ("cedula")
);

create table  banco (
	"banco_id" number not null, 
	"nombre_banco" varchar (20) not null,
	"num_cuenta" number (10) not null,
	"tipo_cuenta" varchar (10) not null,
	"cliente" number (10) not null,
	
	constraint "PKbanco" primary key ("banco_id"),
	constraint "clienteFK" foreign key ("cliente") references empleado ("cedula") 
);

create table vehiculo(
	"matricula" varchar (6) not null,
	"tipo_vehiculo" varchar (20) not null,
	"propietario" varchar (40) not null,
	"fecha_manten" date not null,
	
	constraint "PKvehiculo" primary key ("matricula")
);

create table viajes(
	"viaje_id" number not null,
	"destino" varchar (25) not null,
	"pasajero" number (10) not null,
	
	constraint "PKviajes" primary key ("viaje_id")
);

create table aerolineas (
	"aerolinea_id" number not null,
	"nom_aerolinea" varchar (15) not null,
	"usuario" number(10) not null,
	
	constraint "PKaerolinea" primary key ("aerolinea_id"),
);

create table hoteles(
    "hoteles_id" int not null,
	"nom_hotel" varchar (20) not null,
	"valor_esta" number not null,
	"usuario" number (10) not null,
	
    constraint "PKhoteles" primary key ("hoteles_id")
)


create table viaticos(
	"viaticos_id" int not null,
	"empleado" number (10) not null,
	"total" int not null,
	
	constraint "PKviaticos" primary key ("viaticos_id"),
	constraint "viaticosFK" foreign key ("empleado") references hoteles ("hoteles_id")
);
------------------------------------------------------------------------------------------
--- inserción de datos

insert into empleado values (100500123,'Jose','Rios Bernal','05-04-1979','02-02-2015',2200000,'Fijo','Bogota','Cra 1 # 65 - 24','1979@turiscol','Comercial'),
							(100500463,'Pablo','Picapiedra','06-06-1984','08-25-2017',4500000,'Indefinido','Bogota','Cll 72 # 12 a 51','1984@turiscol.com','Administrativo'),
							(100502883,'Jhon','Rajuela','02-08-2000','08-30-2020',1800000,'Indefinido','Bogota','Cra 58 # 121 - 66','2000@turiscol.com','Operativo'),
							(100502890,'Rosa','Piedrarica','09-04-1992','15-06-2011',2200000,'Fijo','Bogota','Cra 27 # 24 - 45','1992@turiscol','Comercial'),
							(100503022,'Maria','Ricachuela','10-06-1980','05-22-2009',200000,'Indefinido','Bogota','Cll 127 # 12 a 19','1980@turiscol.com','Administrativo'),
							(100503456,'Erick','Rocoso','01-01-1976','03-03-2001',2200000,'Fijo','Barranquilla','Cra 14 # 68 a sur - 24','1976@turiscol','Comercial'),
							(100503500,'Luz','DelPotro','12-19-1999','04-18-2007',2800000,'Fijo','Bogota','Cra 89 # 13 - 17','1999@turiscol','Comercial'),
							(100504220,'Ernesto','Villaroca','11-09-1986','12-11-2008',4500000,'Indefinido','Bogota','Cll 145 # 12 a 81','1986@turiscol.com','Administrativo'),
							(100504779,'Javier','Rajon','08-20-1977','01-29-2000',2800000,'Fijo','Cucuta','Cra 52 # 86  - 24 sur','1977@turiscol','Comercial');
							
insert into banco values 	(01,123456,'Nomina',100500123,'Spuer'),
							(02,123458,'Nomina',100500463,'Extra'),
							(03,123460,'Nomina',100502883,'bancol'),
							(04,123462,'Nomina',100503022,'bancaso');
							
insert into vehiculo values ('car01','vagoneta','Empresa','08-25-2008'),
							('car02','automovil','alquilado','06-25-2018'),
							('car03','automovil','alquilado','06-25-2020'),
							('car04','vagoneta','Empresa','08-25-2020'),
							('car05','camion','Empresa','06-25-2020'),
							('car06','bus','Empresa','01-25-2019'),
							('car07','bus','Empresa','01-25-2020'),
							('car08','vagoneta','Empresa','08-25-2020');
						 
insert into viajes values 	(1234,'Cali',100500123),
							(1235,'Medellin',100502883),
							(1236,'Bogota',100502890),
							(1237,'Barranquilla',100503022),
							(1238,'Cartagena',100503456),
							(1239,'B/manga',100503500);
							
insert into aerolineas values (54321,'aeroya',100502890),
							  (54320,'vuele pronto',100504779),
							  (54319,'vuelos aereos',100504220),
							  (54318,'confort air',100503500);
							  
insert into hoteles values 	(999,'Amarillo',150000,100503500),
							(997,'Azul',120000,100503500),
							(995,'Verde',120000,100503500),
							(993,'Blanco',90000,100503500),
							(991,'Dorado',180000,100503500);
							
insert into viaticos values (333,999,1700000),
							(335,100502883,1200000),
							(337,100502890,1900000),
							(339,100503456,1900000),
							(341,100503022,1600000),
							(343,100516482,1100000),
							(345,100504580,2000000),
							(347,100506897,1000000);
						
-------------------------------------------------------------------------------------------
--- Consultas

select "nombre", "apellido", "salario", "tipo_contrato", "fecha_contratación" from empleado where "cedula" in ('100500463','100503022','100503456') order by "fecha_contratación" desc;

select "banco_id", "NOMBRE_BANCO", "cliente"from banco where "tipo_cuenta" in ('Nomina') order by 1 desc;

select "tipo_vehiculo", "propietario", "fecha_manten" from vehiculo where "propietario" in ('alquilado') order by 1 desc;

select * from empleado
select * from banco
select * from vehiculo
select * from viajes
select * from aerolineas
select * from hoteles
select * from viaticos