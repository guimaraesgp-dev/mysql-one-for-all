SELECT 
	al.nomeAlbum AS `album`,
	COUNT(al.idAlbum) AS `favoritadas`
FROM Favorito AS fav
    JOIN Cancoes AS c ON c.idCancoes = fav.idCancoes
    JOIN Album AS al ON al.idAlbum = c.idAlbum
GROUP BY al.idAlbum
ORDER BY favoritadas DESC
LIMIT 3;