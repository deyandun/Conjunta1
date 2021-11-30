/*==============================================================*/
/* DBMS name:      SAP SQL Anywhere 17                          */
/* Created on:     11/29/2021 8:28:48 PM                        */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_LOCALIDA_REFERENCE_PARTIDO_') then
    alter table LOCALIDAD_PARTIDO
       delete foreign key FK_LOCALIDA_REFERENCE_PARTIDO_
end if;

drop table if exists LOCALIDAD_PARTIDO;

drop table if exists PARTIDO_FUTBOL;

/*==============================================================*/
/* Table: LOCALIDAD_PARTIDO                                     */
/*==============================================================*/
create or replace table LOCALIDAD_PARTIDO 
(
   CODIGO_LOCALIDAD     int                            not null,
   CODIGO               int                            null,
   DISPONIBILIDAD       varchar(2)                     not null,
   PRECIO               float(5,2)                     not null,
   constraint PK_LOCALIDAD_PARTIDO primary key clustered (CODIGO_LOCALIDAD)
);

/*==============================================================*/
/* Table: PARTIDO_FUTBOL                                        */
/*==============================================================*/
create or replace table PARTIDO_FUTBOL 
(
   CODIGO               int                            not null,
   EQUIPO_LOCAL         varchar(50)                    not null,
   EQUIPO_VISITA        varchar(50)                    not null,
   FECHA                date                           not null,
   LUGAR                varchar(50)                    not null,
   constraint PK_PARTIDO_FUTBOL primary key clustered (CODIGO)
);

alter table LOCALIDAD_PARTIDO
   add constraint FK_LOCALIDA_REFERENCE_PARTIDO_ foreign key (CODIGO)
      references PARTIDO_FUTBOL (CODIGO)
      on update restrict
      on delete restrict;


INSERT INTO `PARTIDO_FUTBOL` (`CODIGO`, `EQUIPO_LOCAL`, `EQUIPO_VISITA`, `FECHA`, `LUGAR`) VALUES
(1, 'AMERICA', 'ATLANTE', '2021-05-12','QUITO'),
(2, 'DEPORTIVO QUITO', 'ATLANTE', '2021-05-12','IBARRA'),
(3, 'CUENCA', 'NACIONAL', '2021-07-18','QUITO'),
(4, 'BARCELONA', 'EMELEC', '2021-0-15','QUITO'),
(5, 'LIGA', 'AUCAS', '2021-05-13','QUITO');


INSERT INTO `LOCALIDAD_PARTIDO` (`CODIGO_LOCALIDAD`, `CODIGO`, `DISPONIBILIDAD`, `PRECIO`) VALUES
(1, 1, 'SI', 20),
(2, 1, 'NO', 30),
(3, 1, 'SI', 20),
(4, 2, 'NO', 20),
(5, 2, 'SI', 10),
(6, 2, 'SI', 20),
(7, 2, 'NO', 20),
(8, 3, 'NO', 10),
(9, 3, 'SI', 20),
(10, 3, 'SI', 20),
(11, 3, 'SI', 20),
(12, 3, 'NO', 20),
(13, 4, 'SI', 20),
(14, 4, 'SI', 20),
(15, 4, 'NO', 40),
(16, 4, 'SI', 20),
(17, 5, 'SI', 30),
(18, 5, 'NO', 20),
(19, 5, 'SI', 20),
(20, 5, 'NO', 25);