-- Descomente e altere as linhas abaixo:

CREATE TABLE SpotifyClone.musicas_favoritas (
    idUsuario INT NOT NULL,
    idCancoes INT NOT NULL,
    CONSTRAINT PRIMARY KEY (idUsuario, idCancoes),
    FOREIGN KEY (idUsuario) REFERENCES pessoa_usuaria (idUsuario),
    FOREIGN KEY (idCancoes) REFERENCES cancao (idCancoes)
) engine = InnoDB;

INSERT INTO SpotifyClone.musicas_favoritas (idUsuario, idCancoes)
VALUES
  ('1', '3'),
  ('1', '6'),
  ('1', '10'),
  ('2', '4'),
  ('3', '1'),
  ('3', '3'),
  ('4', '7'),
  ('4', '4'),
  ('5', '10'),
  ('5', '2'),
  ('8', '4'),
  ('9', '7'),
  ('10', '3');
