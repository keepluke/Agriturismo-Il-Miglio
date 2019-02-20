drop schema if exists agriturismo;
create schema agriturismo;
use agriturismo;

create table utente(
email				varchar(30)		not null,
pass				varchar(20)		not null,
tipo				varchar(10)		not null,

primary key(email)
);

create table cliente(
nome_cliente		varchar(16)		not null,
cognome_cliente		varchar(16)		not null,
email_cliente		varchar(30)		not null,
telefono			varchar(10)		not null,
indirizzo			varchar(100)	not null,


primary key(email_cliente),
foreign key(email_cliente) references utente(email)
);


create table prodotto(
codice					integer				not null,
nome_tipo			    varchar(25)			not null,
quantita_disponibile	integer				not null,	
data_produzione			date				not null,
data_scadenza			date				not null,
prezzo                  double(5,2)			not null,
foto_path				varchar(255),
foto					longblob,			

primary key(codice)
);



create table acquisto(
data_acquisto 				date	 		not null,
cod_scontrino				integer	 		not null	auto_increment,
totale						double(5,2)		not null,
email_utente				varchar(30)		not null,

primary key(cod_scontrino),
foreign key(email_utente)	references utente(email)
);



create table è_soggetto(
codice_prodotto					integer			not null,
codice_scontrino 				integer			not null,
quantita 						integer			not null,

primary key(codice_prodotto, codice_scontrino),
foreign key(codice_prodotto) references prodotto(codice),
foreign key(codice_scontrino) references acquisto(cod_scontrino)
); 





create table prenotazione(
data_prenotazione		date			not null,
orario						varchar(6)	not null,
email_cliente			varchar(30)		not null,
num_posti				int				not null,
commento				varchar(50),
					
primary key(data_prenotazione, email_cliente),
foreign key(email_cliente) references cliente(email_cliente)
);


INSERT INTO utente(email, pass, tipo) 	VALUES('giancarloiannone@mail.com', 'giancarlo', 'admin');
INSERT INTO utente(email, pass, tipo)	VALUES('lucagarelli@mail.com', 'luca', 'adminp');
INSERT INTO utente(email, pass, tipo)	VALUES('mario@mail.com', 'mario', 'cliente');
INSERT INTO cliente(nome_cliente,cognome_cliente,email_cliente,telefono,indirizzo) 	VALUES('Mario','Rossi','mario@mail.com', '3352343345', 'via Pavesi 54 Ancona 56789');
INSERT INTO acquisto(data_acquisto, cod_scontrino, totale, email_utente) VALUES('2019-02-02',1,50,'mario@mail.com');
INSERT INTO prodotto(codice, nome_tipo, quantita_disponibile, data_produzione, data_scadenza, prezzo, foto_path, foto) VALUES(11111, 'prodotto di prova', 100,'2010-12-12','2040-12-12', 25, null, null);
INSERT INTO è_soggetto(codice_prodotto, codice_scontrino, quantita) VALUES(11111, 1, 10);