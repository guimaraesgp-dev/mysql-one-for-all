SELECT 
    a.nomeArtista AS `artista`,
    CASE
		WHEN COUNT(al.idAlbum) >= 5 THEN 'A'
		WHEN COUNT(al.idAlbum) > 2 THEN 'B'
		WHEN COUNT(al.idAlbum) = 2 THEN 'C'
		WHEN COUNT(al.idAlbum) <= 1 THEN '-'
	ELSE '-' END AS `ranking`
FROM Favorito AS fav
RIGHT JOIN Cancoes AS c ON c.idCancoes = fav.idCancoes
  JOIN Album AS al ON c.idAlbum = al.idAlbum
  JOIN Artista AS a ON al.idArtista = a.idArtista
GROUP BY a.nomeArtista
ORDER BY IF(ranking = '-', 1, 0), ranking, artista;