SELECT
	c.nomeCancoes as cancao,
    COUNT(h.idCancoes) as reproducoes
FROM Cancoes c 
    JOIN Historico h ON	c.idCancoes = h.idCancoes
GROUP BY c.nomeCancoes
ORDER BY reproducoes DESC, c.nomeCancoes ASC
LIMIT 2;