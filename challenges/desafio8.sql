SELECT
    ar.nomeArtista AS artista,
    al.nomeAlbum AS album
FROM Artista AS ar
	JOIN Album AS al ON ar.idArtista = al.idArtista
WHERE ar.nomeArtista = 'Elis Regina'
ORDER BY album ASC ;