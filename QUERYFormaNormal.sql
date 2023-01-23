							/*CREAMOS LA TABLA*/
create table consumos
(
IdConsumos integer not null,
ClaseDeDia varchar(30),
P_Punta_TotalHoras int,
P_Punta_Horario varchar(30),
P_Intermedio_TotalHoras int,
P_Intermedio_Horario varchar(30),
P_Valle_TotalHoras int,
P_Valle_Horario varchar(30)
constraint IdConsumos primary key (IdConsumos)
);
							/*LLENAMOS LA TABLA*/
insert into consumos values
(1,'Laborable', 10, '10 a 16 / 18 a 22', 9, '5 a 10 / 16 a 18 / 22 a 24',5, '0 a 5'),
(2,'Sabado', 2, '12 a 13 / 19 a 20', 16, '6 a 12 / 13 a 19 / 20 a 24',6, '0 a 6'),
(3,'Domingo o Feriado', 0,'', 8, '11 a 13 / 17 a 23',16, '0 a 11 / 13 a 17 / 23 a 24');

select * from consumos

							/*APLICAMOS LA PRIMERA FORMA NORMAL SEPARANDO*/
create table Periodo_Punta
(
id_punta integer not null,
ClaseDeDia Varchar (30),
TotalHoras int,
Horario_A varchar (30),
Horario_B varchar (30),
constraint id_punta primary key (id_punta)
);

insert into Periodo_Punta values
(1,'Laborable',10,'10 a 16','18 a 22'),
(2,'Sabado',2,'12 a 13','19 a 20'),
(3,'Domingo o Feriado',0,'','');

select * from Periodo_Punta;



							/*APLICAMOS LA PRIMERA FORMA NORMAL SEPARANDO*/
create table Periodo_Intermedio
(
id_Intermedio integer not null,
ClaseDeDia Varchar (30),
TotalHoras int,
Horario_A varchar (30),
Horario_B varchar (30),
Horario_C varchar (30),
constraint id_Intermedio primary key (id_Intermedio)
);

insert into Periodo_Intermedio values
(1,'Laborable',9,'5 a 10','16 a 18','22 a 24'),
(2,'Sabado',16,'6 a 12','13 a 19','20 a 24'),
(3,'Domingo o Feriado',8,'11 a 13','17 a 23','');

Select * from Periodo_Intermedio;



							/*APLICAMOS LA PRIMERA FORMA NORMAL SEPARANDO*/

create table Periodo_Valle
(
id_Valle integer not null,
ClaseDeDia Varchar (30),
TotalHoras int,
Horario_A varchar (30),
Horario_B varchar (30),
Horario_C varchar (30),
constraint id_Valle primary key (id_Valle)
);

insert into Periodo_Valle values
(1,'Laborable',5,'0 a 5','',''),
(2,'Sabado',6,'0 a 6','',''),
(3,'Domingo o Feriado',16,'0 a 11','13 a 17','23 a 24');

Select * from Periodo_Valle;


								/*AHORA NUESTRA TABLA ESTA EN SEGUNDA FORMA NORMAL*/


use Energia
								/*QUERYS TENIENDO LISTO TODO PARA LA TERCER FORMA NORMAL */

/*TOTALES HORAS*/
select pp.ClaseDeDia, c.P_Punta_TotalHoras, c.P_Intermedio_TotalHoras, c.P_Valle_TotalHoras from consumos as c
inner join Periodo_Punta as pp
on c.IdConsumos=pp.id_punta

/*HORARIO TURNO A*/
select c.ClaseDeDia, pp.Horario_A AS HORARIO_A_PUNTA, P_I.Horario_A AS HORARIO_A_INTERMEDIO, pv.Horario_A AS HORARIO_A_VALLE from consumos as c
inner join Periodo_Punta as pp
on c.IdConsumos=pp.id_punta
inner join Periodo_Intermedio as P_I
on c.IdConsumos=P_I.id_Intermedio
inner join Periodo_Valle as pv
on c.IdConsumos=pv.id_Valle

/*HORARIO TURNO B*/
select c.ClaseDeDia, pp.Horario_B AS HORARIO_B_PUNTA, P_I.Horario_B AS HORARIO_B_INTERMEDIO, pv.Horario_B AS HORARIO_B_VALLE from consumos as c
inner join Periodo_Punta as pp
on c.IdConsumos=pp.id_punta
inner join Periodo_Intermedio as P_I
on c.IdConsumos=P_I.id_Intermedio
inner join Periodo_Valle as pv
on c.IdConsumos=pv.id_Valle

/*HORARIO TURNO C*/
select c.ClaseDeDia, P_I.Horario_C AS HORARIO_C_INTERMEDIO, pv.Horario_C AS HORARIO_C_VALLE from consumos as c
inner join Periodo_Punta as pp
on c.IdConsumos=pp.id_punta
inner join Periodo_Intermedio as P_I
on c.IdConsumos=P_I.id_Intermedio
inner join Periodo_Valle as pv
on c.IdConsumos=pv.id_Valle


