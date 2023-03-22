SELECT 
    u.nomeUsuario as pessoa_usuaria,
    IF(YEAR(MAX(h.dataReproducao)) >= '2021', 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM Usuario u
	JOIN Historico h ON h.idUsuario = u.idUsuario
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;