--exercitiul 10
create sequence seq
start with 1
increment by 1
minvalue 1
maxvalue 6;

--exercitiul 11

--Tabela Tari

Create table Tari
(
  id_tara int NOT NULL,
  nume varchar2(30) NOT NULL UNIQUE,
  primary key(id_tara)
);

Describe Tari;

--Inserarea datelor in tabela Tari

insert into Tari(id_tara, nume) values(seq.nextval, 'Anglia');
insert into Tari(id_tara, nume) values(seq.nextval, 'Italia');
insert into Tari(id_tara, nume) values(seq.nextval, 'Germania');
insert into Tari(id_tara, nume) values(seq.nextval, 'Spania');
insert into Tari(id_tara, nume) values(seq.nextval, 'Franta');
insert into Tari(id_tara, nume) values(seq.nextval, 'Romania');
select * from Tari;

----------------------------------------------------------------

--Tabela campionate

Create table Campionate
(
 id_campionat int NOT NULL,
 id_tara int NOT NULL,
 nume varchar2(30),
 tara varchar2(30),
 primary key(id_campionat),
 foreign key(id_tara) references Tari(id_tara)
);

Describe Campionate; 

select * from Campionate;

--Inserarea datelor in tabela campionate

insert into Campionate values(10, 1, 'Premier League', 'Anglia');
insert into Campionate values(20, 2, 'Serie A', 'Italia');
insert into Campionate values(30, 3, 'Bundesliga', 'Germania');
insert into Campionate values(40, 4, 'La Liga', 'Spania');
insert into Campionate values(50, 5, 'Ligue 1', 'Franta');
insert into Campionate values(60, 6, 'Liga 1', 'Romania');

savepoint taricamp;

alter table Campionate
drop column Tara;

----------------------------------------------------

--Tabela orase

Create table Orase
(
 id_oras int NOT NULL,
 id_tara int NOT NULL,
 nume varchar2(30) NOT NULL UNIQUE,
 primary key(id_oras),
 foreign key(id_tara) references Tari(id_tara)
);

alter table Orase
add tara varchar2(30);

--Inserarea valorilor in tabela Orase

INSERT INTO Orase VALUES (11, 1, 'Londra', 'Anglia');
INSERT INTO Orase VALUES (12, 1, 'Manchester', 'Anglia');
INSERT INTO Orase VALUES (13, 1, 'Birmingham', 'Anglia');
INSERT INTO Orase VALUES (14, 1, 'Liverpool', 'Anglia');
INSERT INTO Orase VALUES (15, 1, 'Leeds', 'Anglia');

INSERT INTO Orase VALUES (21, 2, 'Roma', 'Italia');
INSERT INTO Orase VALUES (22, 2, 'Milano', 'Italia');
INSERT INTO Orase VALUES (23, 2, 'Torino', 'Italia');
INSERT INTO Orase VALUES (24, 2, 'Florenta', 'Italia');
INSERT INTO Orase VALUES (25, 2, 'Napoli', 'Italia');

INSERT INTO Orase VALUES (31, 3, 'Berlin', 'Germania');
INSERT INTO Orase VALUES (32, 3, 'Munchen', 'Germania');
INSERT INTO Orase VALUES (33, 3, 'Hamburg', 'Germania');
INSERT INTO Orase VALUES (34, 3, 'Frankfurt', 'Germania');
INSERT INTO Orase VALUES (35, 3, 'Dortmund', 'Germania');

INSERT INTO Orase VALUES (41, 4, 'Madrid', 'Spania');
INSERT INTO Orase VALUES (42, 4, 'Barcelona', 'Spania');
INSERT INTO Orase VALUES (43, 4, 'Valencia', 'Spania');
INSERT INTO Orase VALUES (44, 4, 'Sevilia', 'Spania');
INSERT INTO Orase VALUES (45, 4, 'Bilbao', 'Spania');

INSERT INTO Orase VALUES (51, 5, 'Paris', 'Franta');
INSERT INTO Orase VALUES (52, 5, 'Marsilia', 'Franta');
INSERT INTO Orase VALUES (53, 5, 'Lyon', 'Franta');
INSERT INTO Orase VALUES (54, 5, 'Bordeaux', 'Franta');
INSERT INTO Orase VALUES (55, 5, 'Nisa', 'Franta');

INSERT INTO Orase VALUES (61, 6, 'Bucuresti', 'Romania');
INSERT INTO Orase VALUES (62, 6, 'Cluj', 'Romania');
INSERT INTO Orase VALUES (63, 6, 'Iasi', 'Romania');
rollback;

Describe orase;
select * from orase;

alter table Orase
drop column Tara;
--------------------------------------------------

--Tabela stadioane

Create table Stadioane
(
 id_stadion int NOT NULL,
 id_oras int NOT NULL,
 nume_stadion varchar(30),
 capacitate int NOT NULL,
 primary key(id_stadion),
 foreign key(id_oras) references Orase(id_oras) 
);

Describe Stadioane;
commit;

--Inserarea datelor in tabela Stadioane

INSERT INTO Stadioane VALUES (220, 22, 'San Siro', 80000);
INSERT INTO Stadioane VALUES (230, 23, 'Juventus Stadium', 41507);
INSERT INTO Stadioane VALUES (610, 61, 'Stefan cel Mare', 15532);
INSERT INTO Stadioane VALUES (510, 51, 'Parc des Princes', 48712);
INSERT INTO Stadioane VALUES (410, 41, 'Camp Nou', 99354);
INSERT INTO Stadioane VALUES (420, 42, 'Santiago Bernabéu', 81044);
INSERT INTO Stadioane VALUES (320, 32, 'Allianz Arena', 75000);
INSERT INTO Stadioane VALUES (350, 35, 'Signal Iduna Park', 81365);
INSERT INTO Stadioane VALUES (110, 11, 'Tottenham Hotspur Stadium', 62823);
INSERT INTO Stadioane VALUES (120, 12, 'Etihad Stadium', 55097);
INSERT INTO Stadioane VALUES (611, 61, 'Arena Nationala', 65423);

select * from stadioane;

------------------------------------------------------------------

--tabela Echipe

create Table Echipe
(
id_echipa int NOT NULL,
id_campionat int NOT NULL,
id_stadion int NOT NULL,
nume_echipa varchar(30) NOT NULL UNIQUE,
primary key(id_echipa),
foreign key(id_campionat) references Campionate(id_campionat),
foreign key(id_stadion) references Stadioane(id_stadion)
);

Describe Echipe;

select * from Echipe;

ALTER TABLE ECHIPE
MODIFY ID_STADION INT NULL;

ALTER TABLE Echipe
ADD campionat VARCHAR2(30);

ALTER TABLE Echipe
ADD tara VARCHAR2(30);

ALTER TABLE Echipe
ADD stadion VARCHAR2(30);

Alter table Echipe
drop column campionat;

Alter table Echipe 
drop column Tara;

Alter table Echipe
drop column Stadion;

-- Adaugare echipele în tabelul Echipe, împreun? cu informa?iile suplimentare
INSERT INTO Echipe Values (562, 20, 220, 'Inter Milano', 'Serie A', 'Italia', 'San Siro');
INSERT INTO Echipe Values (134, 20, 230, 'Juventus Torino', 'Serie A', 'Italia', 'Juventus Stadium');
INSERT INTO Echipe Values (789, 60, 610, 'Dinamo Bucuresti', 'Liga 1', 'Romania', 'Stadionul Dinamo');
INSERT INTO Echipe Values (245, 50, 510, 'Paris Saint Germain', 'Ligue 1', 'Franta', 'Parc des Princes');
INSERT INTO Echipe Values (878, 40, 410, 'FC Barcelona', 'La Liga', 'Spania', 'Camp Nou');
INSERT INTO Echipe Values (416, 40, 420, 'Real Madrid', 'La Liga', 'Spania', 'Santiago Bernabéu');
INSERT INTO Echipe Values (721, 30, 320, 'Bayern Munchen', 'Bundesliga', 'Germania', 'Allianz Arena');
INSERT INTO Echipe Values (333, 30, 350, 'Borussia Dortmund', 'Bundesliga', 'Germania', 'Signal Iduna Park');
INSERT INTO Echipe Values (599, 10, 110, 'Tottenham Hotspur', 'Premier League', 'Anglia', 'Tottenham Hotspur Stadium');
INSERT INTO Echipe Values (902, 10, 120, 'Manchester City', 'Premier League', 'Anglia', 'Etihad Stadium');
INSERT INTO Echipe Values (734, 60, NULL, 'FCSB', 'Liga 1', 'ROMANIA', '');

UPDATE Echipe
SET tara = 'Romania'
WHERE tara = 'ROMANIA'; 
--mic typo

---------------------------------------------------------

--Crearea tabelei Antrenori
CREATE TABLE Antrenori
(
 id_antrenor int NOT NULL,
 id_echipa int NULL,
 nume_de_familie varchar2(30),
 prenume varchar2(30),
 salariu_saptamanal int NULL,
 data_semnare_contract DATE NULL
);

ALTER TABLE Antrenori
ADD CONSTRAINT pk_antrenor_id PRIMARY KEY (id_antrenor);

ALTER TABLE Antrenori
ADD CONSTRAINT fk_echipa_id FOREIGN KEY (id_echipa) REFERENCES Echipe(id_echipa);

Describe Antrenori;

select * from Antrenori;

--Inserarea valorilor in tabela Antrenori

INSERT INTO Antrenori VALUES (1, 562, 'Inzaghi', 'Simone', 10000, TO_DATE('2023-06-03', 'YYYY-MM-DD'));
INSERT INTO Antrenori VALUES (2, 134, 'Allegri', 'Massimiliano', 12000, TO_DATE('2021-05-28', 'YYYY-MM-DD'));
INSERT INTO Antrenori VALUES (3, 789, 'Kopic', 'Zeljko', 8000, TO_DATE('2023-12-01', 'YYYY-MM-DD'));
INSERT INTO Antrenori VALUES (4, 245, 'Enrique', 'Luis', 11000, TO_DATE('2023-07-05', 'YYYY-MM-DD'));
INSERT INTO Antrenori VALUES (5, 878, 'Hernandez', 'Xavi', 9000, TO_DATE('2021-11-06', 'YYYY-MM-DD'));
INSERT INTO Antrenori VALUES (6, 416, 'Ancelotti', 'Carlo', 13000, TO_DATE('2021-07-01', 'YYYY-MM-DD'));
INSERT INTO Antrenori VALUES (7, 721, 'Tuchel', 'Thomas', 10000, TO_DATE('2023-03-24', 'YYYY-MM-DD'));
INSERT INTO Antrenori VALUES (8, 333, 'Terzic', 'Edin', 9500, TO_DATE('2022-07-01', 'YYYY-MM-DD'));
INSERT INTO Antrenori VALUES (9, 599, 'Postecoglou', 'Ange', 10500, TO_DATE('2023-07-01', 'YYYY-MM-DD'));
INSERT INTO Antrenori VALUES (10, 902, 'Guardiola', 'Pep', 12500, TO_DATE('2016-07-01', 'YYYY-MM-DD'));
INSERT INTO Antrenori VALUES (11, 734, 'Charalampous', 'Ilias', 8500, TO_DATE('2023-03-30', 'YYYY-MM-DD'));
INSERT INTO Antrenori Values (12, NULL, 'Klopp', 'Jurgen', NULL, TO_DATE('', 'YYYY-MM-DD'));
INSERT INTO Antrenori VALUES (13, 734, 'Becali', 'Gigi', 11000, TO_DATE('2003-01-02', 'YYYY-MM-DD'));
---------------------------------------------------------------------------------------

--crearea tabelei Jucatori

Create Table Jucatori
(
    id_jucator int NOT NULL,
    id_echipa int NOT NULL,
    nume_de_familie varchar2(30),
    prenume varchar2(30),
    pozitie varchar2(30),
    salariu_saptamanal int NOT NULL,
    aparitii int NULL,
    goluri int NULL,
    assisturi int NULL,
    cota_de_piata int NOT NULL,
    primary key(id_jucator),
    foreign key(id_echipa) references Echipe(id_echipa)
);

alter table Jucatori
drop column pozitie;

Describe Jucatori;

Select * from Jucatori;

alter table Jucatori
add data_semnare_contract DATE NULL;
--inserarea in tabela 
--a jucatorilor de la Inter Milan 
INSERT INTO Jucatori VALUES (1, 562, 'Bastoni', 'Alessandro', 'Fundas', 250000, 290, 17, 18, 75000000);
INSERT INTO Jucatori VALUES (2, 562, 'Dumfries', 'Denzel', 'Fundas', 150000, 383, 33, 53, 25000000);
INSERT INTO Jucatori VALUES (3, 562, 'Martinez', 'Lautaro', 'Atacant', 300000, 344, 156, 49, 110000000);

Update Jucatori
Set data_semnare_contract = TO_DATE('2018-07-21', 'YYYY-MM-DD')
where id_jucator = 1;
Update Jucatori
Set data_semnare_contract = TO_DATE('2020-01-21', 'YYYY-MM-DD')
where id_jucator = 2;
Update Jucatori
Set data_semnare_contract = TO_DATE('2019-12-21', 'YYYY-MM-DD')
where id_jucator = 3;


--inserarea in tabela
--a jucatorilor de la Juventus
INSERT INTO Jucatori VALUES 
(4, 134, 'Szczesny', 'Wojciech', 'Portar', 175000, 548, NULL, 2, 7000000, TO_DATE('2015-06-19', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES 
(5, 134, 'Weah', 'Timothy', 'Mijlocas', 95000, 192, 24, 12, 17000000, TO_DATE('2022-07-28', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES
(6, 134, 'Vlahovic', 'Dusan', 'Atacant', 250000, 257, 113, 19, 87000000, TO_DATE('2020-06-19', 'YYYY-MM-DD'));

commit;

--inserarea in tabela
--a jucatorilor de la Dinamo Bucuresti
INSERT INTO Jucatori VALUES 
(7, 789, 'Patriche', 'Razvan', 'Fundas', 2000, 100, 2, 12, 350000, TO_DATE('2022-06-19', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES 
(8, 789, 'Iglesias', 'Dani', 'Mijlocas', 3500, 82, 5, 13, 500000, TO_DATE('2022-06-28', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES
(9, 789, 'Politic', 'Dennis', 'Atacant', 250000, 57, 13, 10, 1000000, TO_DATE('2020-06-19', 'YYYY-MM-DD'));

--inserarea in tabela
--a jucatorilor de la PSG 
INSERT INTO Jucatori VALUES 
(10, 245, 'Donnarumma', 'Gianluigi', 'Portar', 350000, 400, NULL, 5, 40000000, TO_DATE('2020-09-14', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES 
(11, 245, 'Mendes', 'Nuno', 'Fundas', 100000, 150, 9, 32, 60000000, TO_DATE('2021-07-28', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES
(12, 245, 'Mbappe', 'Kylian', 'Banda', 15000000, 372, 288, 126, 190000000, TO_DATE('2015-12-08', 'YYYY-MM-DD'));

--inserarea in tabela 
--a jucatorilor de la Barcelona 878
INSERT INTO Jucatori VALUES 
(13, 878, 'Ter Stegen', 'Marc-Andre', 'Portar', 1350000, 680, 1, 9, 50000000, TO_DATE('2014-09-15', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES 
(14, 878, 'Torres', 'Ferran', 'Banda', 200000, 163, 19, 42, 50000000, TO_DATE('2022-08-28', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES
(15, 878, 'Lewandowski', 'Robert', 'Atacant', 9000000, 770, 567, 153, 15000000, TO_DATE('2015-11-08', 'YYYY-MM-DD'));

--inserarea in tabela
--a celorlalti jucatori
INSERT INTO Jucatori VALUES
(16, 416, 'Junior', 'Vinicius', 'Banda', 2500000, 348, 109, 112, 120000000, TO_DATE('2019-12-24', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES
(17, 721, 'Kimmich', 'Joshua', 'Fundas', 150000, 427, 87, 200, 80000000, TO_DATE('2018-06-13', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES
(18, 333, 'Reus', 'Marco', 'Mijlocas', 100000, 789, 135, 350, 10000000, TO_DATE('2009-12-30', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES
(19, 599, 'Son', 'Heung-Min', 'Banda', 200000, 570, 225, 113, 70000000, TO_DATE('2014-08-22', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES
(20, 902, 'Haaland', 'Erling', 'Atacant', 350000, 240, 190, 57, 130000000, TO_DATE('2022-06-11', 'YYYY-MM-DD'));
INSERT INTO Jucatori VALUES
(21, 734, 'Olaru', 'Darius', 5000, 150, 11, 56, 6000000, TO_DATE('2020-12-09', 'YYYY-MM-DD'));
commit;

--------------------------------------------------------------------------

--crearea tabelei Pozitii
Create Table Pozitii
(
id_pozitie int NOT NULL,
pozitie varchar(20),
primary key (id_pozitie)
);

Describe Pozitii;

--inserarea valorilor in tabela Pozitii
select * from Pozitii;

INSERT INTO Pozitii VALUES
(1, 'Portar');
INSERT INTO Pozitii VALUES
(2, 'Fundas');
INSERT INTO Pozitii VALUES
(3, 'Mijlocas');
INSERT INTO Pozitii VALUES
(4, 'Banda');
INSERT INTO Pozitii VALUES
(5, 'Atacant');

---------------------------------------------------------------------------

--crearea tabelei asociative dintre tabela jucatori si tabela pozitii, aflate in relatie Many to Many

CREATE TABLE Jucatori_Pozitii (
    id_jucator int NOT NULL,
    id_pozitie iNT NOT NULL,
    primary key (id_jucator, id_pozitie),
    foreign key (id_jucator) references Jucatori(id_jucator),
    foreign key (id_pozitie) references Pozitii(id_pozitie)
);

Describe Jucatori_Pozitii;

Select * from Jucatori_Pozitii;
--inserarea valorilor in tabela asociativa Jucatori_Pozitii

Insert INTO Jucatori_Pozitii VALUES  (1, 2);
Insert INTO Jucatori_Pozitii VALUES  (2, 2);
Insert INTO Jucatori_Pozitii VALUES  (3, 4);
Insert INTO Jucatori_Pozitii VALUES  (3, 5);
Insert INTO Jucatori_Pozitii VALUES  (4, 1);
Insert INTO Jucatori_Pozitii VALUES  (5, 3);
Insert INTO Jucatori_Pozitii VALUES  (5, 4);
Insert INTO Jucatori_Pozitii VALUES  (6, 5);
Insert INTO Jucatori_Pozitii VALUES  (7, 2);
Insert INTO Jucatori_Pozitii VALUES  (8, 3);
Insert INTO Jucatori_Pozitii VALUES  (9, 4);
Insert INTO Jucatori_Pozitii VALUES  (9, 5);
Insert INTO Jucatori_Pozitii VALUES  (10, 1);
Insert INTO Jucatori_Pozitii VALUES  (11, 2);
Insert INTO Jucatori_Pozitii VALUES  (12, 4);
Insert INTO Jucatori_Pozitii VALUES  (12, 5);
Insert INTO Jucatori_Pozitii VALUES  (13, 1);
Insert INTO Jucatori_Pozitii VALUES  (14, 4);
Insert INTO Jucatori_Pozitii VALUES  (14, 5);
Insert INTO Jucatori_Pozitii VALUES  (15, 5);
Insert INTO Jucatori_Pozitii VALUES  (16, 4);
Insert INTO Jucatori_Pozitii VALUES  (16, 5);
Insert INTO Jucatori_Pozitii VALUES  (17, 2);
Insert INTO Jucatori_Pozitii VALUES  (17, 3);
Insert INTO Jucatori_Pozitii VALUES  (18, 3);
Insert INTO Jucatori_Pozitii VALUES  (18, 4);
Insert INTO Jucatori_Pozitii VALUES  (19, 4);
Insert INTO Jucatori_Pozitii VALUES  (19, 5);
Insert INTO Jucatori_Pozitii VALUES  (20, 5);
Insert INTO Jucatori_Pozitii VALUES  (21, 3);



--------------------------------------------------------------------

--crearea tabelei Partide

Create Table Partide
(
id_partida int NOT NULL,
id_gazde int NOT NULL,
id_oaspeti int NOT NULL,
numar_spectatori int NOT NULL,
goluri_gazde int NULL,
goluri_oaspeti int NULL,
primary key(id_partida),
foreign key(id_gazde) references Echipe(id_echipa),
foreign key(id_oaspeti) references Echipe(id_echipa)
);

Describe Partide;

select * from Partide;

--inserarea valorilor in tabela Partide

select id_echipa, nume_echipa from echipe;
INSERT INTO Partide VALUES (1, 562, 134, 50000, 2, 1);
-- Inter Milano 2 - 1 Juventus Torino 
INSERT INTO Partide VALUES (2, 789, 245, 30000, 1, 3);
-- Dinamo Bucuresti 1 - 3 Paris Saint Germain
INSERT INTO Partide VALUES (3, 878, 416, 80000, 1, 1);
-- FC Barcelona 1 - 1 Real Madrid
INSERT INTO Partide VALUES (4, 721, 333, 75000, 4, 2);
-- Bayern Munchen 4 - 2 Borussia Dortmund
INSERT INTO Partide VALUES (5, 599, 902, 62000, 2, 3);
-- Tottenham 2 - 3 Manchester City
INSERT INTO Partide VALUES (6, 134, 789, 40000, 1, 0);
-- Juventus Torino 1 - 0 Dinamo Bucuresti
INSERT INTO Partide VALUES (7, 245, 878, 50000, 3, 2);
-- Paris Saint Germain 3 - 2 FC Barcelona
INSERT INTO Partide VALUES (8, 416, 721, 70000, 2, 2);
-- Real Madrid 2 - 2 Bayern Munchen
INSERT INTO Partide VALUES (9, 333, 599, 40000, 1, 3);
-- Borussia Dortmund 1 - 3 Tottenham
INSERT INTO Partide VALUES (10, 902, 562, 58000, 2, 2);
-- Manchester City 2 - 2 Inter Milano
INSERT INTO Partide VALUES (11, 134, 878, 45000, 0, 1);
-- Juventus Torino 0 - 1 FC Barcelona
INSERT INTO Partide VALUES (12, 789, 416, 31000, 2, 4);
-- Dinamo Bucuresti 2 - 4 Real Madrid
INSERT INTO Partide VALUES (13, 721, 245, 74000, 3, 1);
-- Bayern Munchen 3 - 1 Paris Saint Germain
INSERT INTO Partide VALUES (14, 333, 902, 42000, 1, 2);
-- Borussia Dortmund 1 - 2 Manchester City
INSERT INTO Partide VALUES (15, 599, 562, 61000, 2, 2);
-- Tottenham 2 - 2 Inter Milano

------------------------------------------------------------------

--crearea tabelei Arbitri
Create Table Arbitri
(
id_arbitru int NOT NULL,
nume varchar(30),
prenume varchar(30)
);

Describe arbitri;

Select * from arbitri;

ALTER TABLE Arbitri
ADD CONSTRAINT pk_arbitru_id PRIMARY KEY (id_arbitru);

--inserarea valorilor in tabela Arbitri
INSERT INTO Arbitri VALUES (1, 'Popescu', 'Ion');
INSERT INTO Arbitri VALUES (2, 'Ionescu', 'Mihai');
INSERT INTO Arbitri VALUES (3, 'Vasilescu', 'Andrei');
INSERT INTO Arbitri VALUES (4, 'Georgescu', 'Alexandru');
INSERT INTO Arbitri VALUES (5, 'Dumitrescu', 'Florin');
INSERT INTO Arbitri VALUES (6, 'Marinescu', 'Cristian');
INSERT INTO Arbitri VALUES (7, 'Stanescu', 'Gabriel');
INSERT INTO Arbitri VALUES (8, 'Radu', 'Stefan');
INSERT INTO Arbitri VALUES (9, 'Serban', 'Daniel');
INSERT INTO Arbitri VALUES (10, 'Petrescu', 'Radu');
INSERT INTO Arbitri VALUES (11, 'Nistor', 'Alin');
INSERT INTO Arbitri VALUES (12, 'Moldovan', 'Bogdan');
INSERT INTO Arbitri VALUES (13, 'Rotaru', 'Vlad');
INSERT INTO Arbitri VALUES (14, 'Dima', 'Marius');
INSERT INTO Arbitri VALUES (15, 'Popa', 'George');

---------------------------------------------------------------

--crearea tabelei asociative dintre partide si arbitri, aflate in relatie Many to Many

CREATE TABLE Partide_Arbitri (
    id_partida int NOT NULL,
    id_arbitru iNT NOT NULL,
    primary key (id_partida, id_arbitru),
    foreign key (id_partida) references Partide(id_partida),
    foreign key (id_arbitru) references Arbitri(id_arbitru)
);

Describe Partide_Arbitri;
select * from Partide_Arbitri;

--inserarea valorilor in tabela asociativa
INSERT INTO Partide_Arbitri VALUES (1, 1);
INSERT INTO Partide_Arbitri VALUES (1, 2);
INSERT INTO Partide_Arbitri VALUES (2, 3);
INSERT INTO Partide_Arbitri VALUES (2, 4);
INSERT INTO Partide_Arbitri VALUES (3, 5);
INSERT INTO Partide_Arbitri VALUES (3, 6);
INSERT INTO Partide_Arbitri VALUES (4, 7);
INSERT INTO Partide_Arbitri VALUES (4, 8);
INSERT INTO Partide_Arbitri VALUES (5, 9);
INSERT INTO Partide_Arbitri VALUES (5, 10);
INSERT INTO Partide_Arbitri VALUES (6, 11);
INSERT INTO Partide_Arbitri VALUES (6, 12);
INSERT INTO Partide_Arbitri VALUES (7, 13);
INSERT INTO Partide_Arbitri VALUES (7, 14);
INSERT INTO Partide_Arbitri VALUES (8, 15);
INSERT INTO Partide_Arbitri VALUES (8, 1);
INSERT INTO Partide_Arbitri VALUES (9, 2);
INSERT INTO Partide_Arbitri VALUES (9, 3);
INSERT INTO Partide_Arbitri VALUES (10, 4);
INSERT INTO Partide_Arbitri VALUES (10, 5);
INSERT INTO Partide_Arbitri VALUES (11, 6);
INSERT INTO Partide_Arbitri VALUES (11, 7);
INSERT INTO Partide_Arbitri VALUES (12, 8);
INSERT INTO Partide_Arbitri VALUES (12, 9);
INSERT INTO Partide_Arbitri VALUES (13, 10);
INSERT INTO Partide_Arbitri VALUES (13, 11);
INSERT INTO Partide_Arbitri VALUES (14, 12);
INSERT INTO Partide_Arbitri VALUES (14, 13);
INSERT INTO Partide_Arbitri VALUES (15, 14);
INSERT INTO Partide_Arbitri VALUES (15, 15);

-------------------------------------------------------------------------

commit;



--Exercitiul 12
--a) subcerere sincronizata 
--Afisati numele echipelor care au castigat macar o partida din postura  de gazde
--la care a luat parte din brigada de arbitri Popescu Ion
select e.nume_echipa
from Echipe e
where e.id_echipa in 
(select id_gazde from Partide p, Partide_Arbitri pa, Arbitri a
 where p.id_gazde = e.id_echipa
 and p.id_partida = pa.id_partida
 and pa.id_arbitru = a.id_arbitru
 and goluri_gazde > goluri_oaspeti
 and a.nume = 'Popescu'
 and a.prenume = 'Ion');
 --rezultate 1: Inter Milano
 
 --b) subcerere nesincronizata in clauza from
 
 --Afisati tipul partidelor ("cu numar mic de spectatori" <=50000, 
 --50000 < "cu numar mediu de spectatori" < 65000
 --65000 <= "cu numar mare de spectatori 
 --in care echipa gazda a inscris 2 goluri,
 --si numele echipei gazde
 
SELECT 
        partide2.id_partida, e.nume_echipa as "Echipa Gazda", 
        DECODE(SIGN(numar_spectatori - 50000), 
           -1, 'cu numar mic de spectatori',
           SIGN(numar_spectatori - 65000), 
           'cu numar mediu de spectatori',
           'cu numar mare de spectatori') AS tip_partida
FROM 
    (SELECT p.numar_spectatori, p.id_gazde, p.id_partida 
     FROM Partide p 
     WHERE p.goluri_gazde = 2) partide2, 
     echipe e
     where partide2.id_gazde = e.id_echipa
     order by partide2.id_partida;
     
--d) NVL SI DECODE + f) clauza with
--Afisati numele complet si numele echipei jucatorilor aflati la o echipa antrenata de
--macar un antrenor platit peste media salariala a tuturor antrenorilor 
--De asemenea, pentru fiecare jucator sa se afiseze daca a inscris mai multe sau mai putine goluri
--decat media tuturor jucatorilor inscrisi in baza de date.
WITH MedieDeGoluri AS (
    SELECT ROUND(AVG(goluri)) AS medie FROM Jucatori
), 
    MedieSalariu AS (
    SELECT ROUND(AVG(salariu_saptamanal)) as salariu FROM Antrenori
)
--select * from MedieDeGoluri;
--select * from MedieSalariu;
SELECT j.prenume || ' ' || j.nume_de_familie as "Nume complet", e.nume_echipa,
    DECODE(SIGN(NVL(goluri, 0) - (select medie from MedieDeGoluri)), 
           -1, 'mai putine goluri decat media',
            'mai multe goluri decat media') AS "A inscris"
FROM 
    Jucatori j, echipe e, Antrenori a
    where j.id_echipa = e.id_echipa
    and e.id_echipa = a.id_echipa
    and a.salariu_saptamanal > (select salariu FROM MedieSalariu);
    
--c) Sa se afiseze echipele englezesti care depasesc media din punct de vedere al
--numarului total de goluri inscrise de jucatorii lor (sa fie afisata si aceasta valoare)

SELECT e.id_echipa, e.nume_echipa, SUM(j.goluri) AS goluri_totale
        FROM Jucatori j, Echipe e, Campionate c, Tari t
        where j.id_echipa = e.id_echipa
        and e.id_campionat = c.id_campionat
        and c.id_tara = t.id_tara
        and t.nume = 'Anglia'
GROUP BY e.id_echipa, e.nume_echipa
HAVING SUM(j.goluri) > (
    SELECT AVG(goluri_per_echipa)
    FROM (
        SELECT j2.id_echipa, SUM(j2.goluri) AS goluri_per_echipa
        FROM Jucatori j2, Echipe e2
        where j2.id_echipa = e2.id_echipa     
        GROUP BY j2.id_echipa
    ) 
);


--e) Afisati daca exista sau nu macar un jucator care joaca pe o pozitie care se termina in `as`
--in cazul de fata: fundas/mijlocas, care si-a semnat contractul pe timpul verii
--la o echipa al carei antrenor se afla in functie mai tarziu de 1 ianuarie 2021.

Select CASE 
when count(distinct j.id_jucator) > 0 then 'exista'
else 'nu exista'
end as "Exista" --functia CASE
from Jucatori_Pozitii jp, Jucatori j, Pozitii p
where jp.id_jucator = j.id_jucator
and jp.id_pozitie = p.id_pozitie
and upper(p.pozitie) like '%AS' --functiile 1-2 pe siruri de caractere
and j.id_jucator in
(select j2.id_jucator 
from Jucatori j2, Echipe e, Antrenori a
where j2.id_echipa = e.id_echipa
and e.id_echipa = a.id_echipa
and a.data_semnare_contract > '01-JAN-2021'
and extract(month from j.data_semnare_contract) in (6, 7, 8)); --functie 2 pe date


select j.*
from Jucatori_Pozitii jp, Jucatori j, Pozitii p
where jp.id_jucator = j.id_jucator
and jp.id_pozitie = p.id_pozitie
and upper(p.pozitie) like '%AS' --functiile 1-2 pe siruri de caractere: upper si like
and j.id_jucator in
(select j2.id_jucator 
from Jucatori j2, Echipe e, Antrenori a
where j2.id_echipa = e.id_echipa
and e.id_echipa = a.id_echipa
and a.data_semnare_contract > '01-JAN-2021' --functia 1 pe date
and extract(month from j2.data_semnare_contract) in (6, 7, 8)); --functie 2 pe date
--7 rezultate, 6 distincte, deci exista!

     
--Exercitiul 13:
--a)
Update jucatori
SET salariu_saptamanal = salariu_saptamanal * 1.10
Where id_jucator in (
    select id_jucator
    from jucatori
    where goluri > 500  
);


--b)
INSERT INTO Jucatori VALUES
(22, 599, 'Andrei', 'Andreius', 35000000, 450, 126, 456, 236000000, TO_DATE('2020-05-30', 'YYYY-MM-DD'));
select * from Jucatori;

Update jucatori
Set salariu_saptamanal = 3500000
where id_jucator in
(select id_jucator
from jucatori j
where salariu_saptamanal > 12000000
and nume_de_familie not like 'Mbappe'); --pentru a evita modificarea salariului lui Kylian Mbappe
--care de asemenea are un salariu mai mare de 12000000.

--c)
INSERT INTO Jucatori VALUES
(22, 599, 'Andrei', 'Andreius', 35000000, 450, 126, 456, 236000000, TO_DATE('2020-05-30', 'YYYY-MM-DD'));
select * from Jucatori;
Delete from jucatori
where id_jucator in (select id_jucator 
                    from jucatori j, echipe e, stadioane s, orase o
                    where j.id_echipa = e.id_echipa
                    and e.id_stadion = s.id_stadion
                    and s.id_oras = o.id_oras
                    and o.nume = 'Londra')
and salariu_saptamanal > 3000000;

--modifica update ul cu subcererea

--Exercitiul 15
--a) afisati jucatorii echipelor care se afla in campionatele ”Premier League” sau ”Bundesliga” 
--si care joaca pe stadioane cu o capacitate mai mare de 65000 de oameni si au manageri 
--cu salarii saptamanale de peste 9500 

Select
    j.nume_de_familie || ' ' || j.prenume AS "NUME COMPLET", s.nume_stadion
from 
    Jucatori j
full outer join Echipe e ON j.id_echipa = e.id_echipa
full outer join Campionate c ON e.id_campionat = c.id_campionat
left outer join Stadioane s ON e.id_stadion = s.id_stadion
full outer join Antrenori a ON e.id_echipa = a.id_echipa
where a.salariu_saptamanal >= 9500
and (c.nume like 'Premier League' or c.nume like 'Bundesliga' or c.nume like 'Liga 1');


--b) Afisati toate echipele care sunt neinvinse ca gazde 
--(au castigat sau au facut cel putin egal in toate meciurile ca gazde)

SELECT e.nume_echipa
FROM echipe e, partide p
where e.id_echipa = p.id_gazde
and NOT EXISTS (
    SELECT 1
    FROM partide p1
    WHERE p1.id_gazde = e.id_echipa
    AND NOT EXISTS (
        SELECT 1
        FROM partide p2
        WHERE p2.id_partida = p1.id_partida
        AND p2.goluri_gazde >= p2.goluri_oaspeti
    )
);



--c) afisati echipele (primele 3) cu cei mai multi jucatori care au inscris peste 15 goluri 
--de-a lungul carierei

SELECT *
FROM (SELECT e.nume_echipa, COUNT(j.id_jucator) AS numar_jucatori
FROM echipe e, jucatori j
where e.id_echipa = j.id_echipa
and j.goluri > 15
GROUP BY e.nume_echipa
ORDER BY numar_jucatori DESC) ordonati_desc
WHERE ROWNUM <= 3; 


--exercitiul 14:
Create view Jucatori_Detalii as
select distinct
    j.id_jucator,
    j.nume_de_familie NUME,
    j.prenume PRENUME,
    e.nume_echipa ECHIPA,
    s.nume_stadion NUME_STADION,
    a.nume_de_familie || ' ' || a.prenume NUME_ANTRENOR
from jucatori j, echipe e, stadioane s, antrenori a
where j.id_echipa = e.id_echipa
and e.id_stadion = s.id_stadion
and e.id_echipa = a.id_echipa;

select * from jucatori_detalii;

--14b)
--Sa se afiseze toti jucatorii antrenati de Luis Enrique sau de Simone Inzaghi
select * from jucatori_detalii
where NUME_ANTRENOR = 'Inzaghi Simone'
union
select * from jucatori_detalii
where NUME_ANTRENOR = 'Enrique Luis';

--14c)
Insert INTO jucatori_detalii VALUES(22, 'Xan', 'Juguan', 'Inter Milano', 'San Siro', 'Inzaghi Simone');

select e.nume_echipa, count(j.id_jucator)
from echipe e, jucatori j
where e.id_echipa = j.id_echipa
group by e.nume_echipa
having count(j.id_jucator) 
= 
(select max(numar_jucatori) 
from (select e.id_echipa, count(j.id_jucator) numar_jucatori
from echipe e, jucatori j
where e.id_echipa = j.id_echipa
group by e.id_echipa));
          

    


