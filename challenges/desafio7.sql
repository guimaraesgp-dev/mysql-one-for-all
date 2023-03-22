SELECT
	a.nomeArtista AS artista,
    al.nomeAlbum AS album,
    COUNT(s.idArtista) AS pessoas_seguidoras
FROM Artista AS a
    JOIN Album AS al ON al.idArtista = a.idArtista
    JOIN Seguindo AS s ON s.idArtista = a.idArtista
GROUP BY a.nomeArtista, al.nomeAlbum
ORDER BY pessoas_seguidoras DESC, artista, album;