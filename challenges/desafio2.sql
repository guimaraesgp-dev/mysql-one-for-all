SELECT COUNT(DISTINCT nomeCancoes) AS `cancoes`, 
       COUNT(DISTINCT nomeArtista) AS `artistas`, 
       COUNT(DISTINCT nomeAlbum) AS `albuns` 
  FROM Cancoes, Artista, Album;