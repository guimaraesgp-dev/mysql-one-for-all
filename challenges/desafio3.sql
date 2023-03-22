SELECT 
	u.nomeUsuario as pessoa_usuaria,
    COUNT(c.idCancoes) as musicas_ouvidas,
    ROUND(SUM(d.duracaoCancoes / 60), 2) as total_minutos
FROM Usuario u
	JOIN Historico c ON u.idUsuario = c.idUsuario
    JOIN Cancoes d ON d.idCancoes = c.idCancoes
GROUP BY u.nomeUsuario
ORDER BY nomeUsuario;       
