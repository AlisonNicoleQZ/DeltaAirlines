Create database DeltaAirlinesAD;
go

use DeltaAirlinesAD;
go

				create table roles(
					id_rol int primary key identity(1,1),
					nombre_rol nvarchar not null,

	
				);

				create table pasajero(
					id_pasajero int primary key identity(1,1),
					cedula int not null,
					nombre nvarchar(50),
					apellio nvarchar(50),
					correo nvarchar(65),
					telefono nvarchar(10),
					direccion nvarchar,
					nacionalidad nvarchar,
					id_rol int,

					constraint FK_roles foreign key (id_rol) references roles(id_rol)
				);



				create table vuelo(
					id_vuelo int primary key identity(1,1),
					codigo_vuelo nvarchar(10),
					origen nvarchar(30),
					destino nvarchar(30),
					fecha_salida datetime,
					fecha_llegada datetime,
					estado nvarchar(20)
				);

				create table clase(
					id_clase int primary key identity (1,1),
					nombre_clase nvarchar
				);

				create table reserva(
					id_reserva int primary key identity(1,1),
					id_pasajero int,
					id_vuelo int,
					fecha_reserva datetime,
					id_clase int,
					asiento nvarchar(5),
					estao_reserva nvarchar(20),
					descripcion nvarchar,

					constraint FK_pasajero foreign key (id_pasajero) references pasajero(id_pasajero) ,
					constraint FK_vuelo foreign key (id_vuelo) references vuelo(id_vuelo)
				);

				create table equipaje(
					id_equipaje int primary key identity(1,1),
					id_reserva int,
					peso decimal,
					dimension nvarchar,
					tipo int,
					estado int,

					constraint FK_equipaje foreign key (id_reserva) references reserva(id_reserva) 
	
				);



				create table ubicaciones(
					id_ubicacion int primary key identity (1,1),
					nombre_ubicacion nvarchar
				);

				create table servidor(
					id_servidor int primary key identity(1,1),
					nombre_servidor nvarchar(20),
					id_ubicacion int,
					estado_servidor nvarchar(30),
					tipo nvarchar(30),
					fecha_mantenimiento datetime

					constraint FK_ubicacion foreign key (id_ubicacion) references ubicaciones(id_ubicacion) 
					);

				create table redundancia(
					id_redundancia int primary key identity(1,1),
					id_servidor_principal int,
					id_servidor_respaldo int,
					tipo_red nvarchar,
					estado int,
					fecha_mantenimiento datetime

					constraint FK_principal foreign key (id_servidor_principal) references servidor(id_servidor) ,
					constraint FK_respaldo foreign key (id_servidor_respaldo) references servidor(id_servidor) 
				);

				create table monitoreo(
					id_monitoreo int primary key identity(1,1),
					id_servidor int,
					estado nvarchar(20),
					id_ubicacion int,
					fecha_monitoreo datetime,

					constraint FK_servidor foreign key (id_servidor) references servidor(id_servidor),
					constraint FK_ubicacion_monitoreo foreign key (id_ubicacion) references ubicaciones(id_ubicacion) 

				);


			


				create table BUServidor(
					id_servidor int,
					fecha_hora datetime,
					estado nvarchar(30),
					capaciad nvarchar(30),

					constraint FK_BackUp foreign key (id_servidor) references servidor(id_servidor)
				);



				create table incidente(
					id_monitoreo int,
					id_servidor int,
					descripcion nvarchar(50),
					estado nvarchar(20),
					fecha_hora datetime,

					constraint FK_servidor_incidente foreign key (id_servidor) references servidor(id_servidor),
					constraint FK_monitoreo foreign key (id_monitoreo) references monitoreo(id_monitoreo)
				);

				create table facturacion(
					id_facturacion int primary key identity(1,1),
					id_reserva int,
					monto_total decimal,
					metodo_pago decimal,
					fecha datetime,
					estado int,

					constraint FK_reserva foreign key (id_reserva) references reserva(id_reserva)
				);
