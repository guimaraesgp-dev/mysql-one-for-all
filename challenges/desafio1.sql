-- Descomente e altere as linhas abaixo:
DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;        
CREATE TABLE Plano(
     idPlano INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     tipoPlano VARCHAR(45) NOT NULL,
     valorPlano DECIMAL(5,2) 
) engine = InnoDB;

	INSERT INTO Plano (tipoPlano, valorPlano) VALUES
		('gratuito', 0.00),
		('familiar', 7.99),
		('universitário', 5.99),
		('pessoal', 6.99);

CREATE TABLE Usuario (
     idUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     nomeUsuario VARCHAR(45) NOT NULL,
     idadeUsuario INT NOT NULL,
	 dataAssinatura DATE NOT NULL,
     idPlano INT NOT NULL,
     FOREIGN KEY (idPlano) REFERENCES Plano (idPlano)
) engine = InnoDB;

	INSERT INTO Usuario (idUsuario, nomeUsuario, idadeUsuario, idPlano, dataAssinatura) VALUES
      ('1', 'Barbara Liskov', '82', '1', '2019-10-20'),
	  ('2', 'Robert Cecil Martin', '58', '1', '2017-01-06'),
      ('3', 'Ada Lovelace', '37', '2', '2017-12-30'),
      ('4', 'Martin Fowler', '46', '2', '2017-01-17'),
      ('5', 'Sandi Metz', '58', '2', '2018-04-29'),
      ('6', 'Paulo Freire', '19', '3', '2018-02-14'),
      ('7', 'Bell Hooks', '26', '3', '2018-01-05'),
      ('8', 'Christopher Alexander', '85', '4', '2019-06-05'),
      ('9', 'Judith Butler', '45', '4', '2020-05-13'),
      ('10', 'Jorge Amado', '58', '4', '2017-02-17');
	
CREATE TABLE Artista (
  idArtista INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nomeArtista VARCHAR(45) NOT NULL
 ) engine = InnoDB;
 
	INSERT INTO Artista (idArtista, nomeArtista) VALUES
	  ('1', 'Beyoncé'),
	  ('2', 'Queen'),
	  ('3', 'Elis Regina'),
	  ('4', 'Baco Exu do Blues'),
	  ('5', 'Blind Guardian'),
	  ('6', 'Nina Simone');

CREATE TABLE Album (
    idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nomeAlbum VARCHAR(45) NOT NULL,
    idArtista INT NOT NULL,
    anoLancamento YEAR NOT NULL,
    FOREIGN KEY (idArtista) REFERENCES Artista (idArtista)
);
	INSERT INTO Album (nomeAlbum, idArtista, anoLancamento) VALUES
	  ('Renaissance', 1, 2022),
	  ('Jazz', 2, 1978),
	  ('Hot Space', 2, 1982),
	  ('Falso Brilhante', 3, 1998),
	  ('Vento de Maio', 3, 2001),
	  ('QVVJFA?', 4, 2003),
	  ('Somewhere Far Beyond', 5, 2007),
	  ('I Put A Spell On You', 6, 2012);      
      

CREATE TABLE Cancoes (
    idCancoes INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeCancoes VARCHAR(45) NOT NULL,
    duracaoCancoes INT NOT NULL,
    idAlbum INT NOT NULL,
    FOREIGN KEY (idAlbum) REFERENCES Album (idAlbum)
);

    INSERT INTO Cancoes (nomeCancoes, duracaoCancoes, idAlbum) VALUES
      ('BREAK MY SOUL', 279, 1),
      ("VIRGO'S GROOVE", 369, 1),
      ('ALIEN SUPERSTAR', 116, 1),
      ("Don't Stop Me Now", 203, 2),
      ('Under Pressure', 152, 3),
      ('Como Nossos Pais', 105, 4),
      ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
      ('Samba em Paris', 267, 6),
      ("The Bard's Song", 244, 7),
      ('Feeling Good', 100, 8);
      
      
CREATE TABLE Historico (
  idUsuario INT NOT NULL,
  idCancoes INT NOT NULL,
  dataReproducao DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY (idUsuario, idCancoes),
  FOREIGN KEY (idUsuario) REFERENCES Usuario (idUsuario),
  FOREIGN KEY (idCancoes) REFERENCES Cancoes (idCancoes)
) engine = InnoDB;

	INSERT INTO Historico (idCancoes, idUsuario, dataReproducao) VALUES
	  ('1', '6', '2017-10-12 12:35:20'),
	  ('2', '1', '2020-05-02 05:30:35'),
	  ('2', '3', '2020-12-05 18:38:30'),
	  ('3', '10', '2015-12-13 08:30:22'),
	  ('4', '7', '2011-12-15 22:30:49'),
	  ('4', '8', '2012-03-17 14:56:41'),
	  ('5', '5', '2020-08-06 15:23:43'),
	  ('7', '2', '2020-01-02 07:40:33'),
	  ('7', '6', '2017-01-24 00:31:17'),
	  ('8', '1', '2022-02-28 10:45:55'),
	  ('8', '4', '2021-08-15 17:10:10'),
	  ('8', '5', '2022-01-09 01:44:33'),
	  ('9', '9', '2022-02-24 21:14:22'),
	  ('10', '1', '2020-03-06 11:22:33'),
	  ('10', '2', '2022-08-05 08:05:17'),
	  ('10', '3', '2020-11-13 16:55:13');
      
CREATE TABLE Seguindo (
  idArtista INT NOT NULL,
  idUsuario INT NOT NULL,
  CONSTRAINT PRIMARY KEY (idArtista, idUsuario),
  FOREIGN KEY (idArtista) REFERENCES Artista (idArtista),
  FOREIGN KEY (idUsuario) REFERENCES Usuario (idUsuario)
) engine = InnoDB;
	INSERT INTO Seguindo (idUsuario, idArtista) VALUES
	  ('1', '1'),
	  ('1', '2'),
	  ('1', '3'),
	  ('2', '1'),
	  ('2', '3'),
	  ('3', '2'),
	  ('4', '4'),
	  ('5', '5'),
	  ('5', '6'),
	  ('6', '6'),
	  ('6', '1'),
	  ('7', '6'),
	  ('9', '3'),
	  ('10', '2');
