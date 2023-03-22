SELECT
    MIN(p.valorPlano) AS faturamento_minimo,
    MAX(p.valorPlano) AS faturamento_maximo,
    ROUND(AVG(p.valorPlano), 2) AS faturamento_medio,
    ROUND(SUM(p.valorPlano), 2) AS faturamento_total 
FROM Plano p
    JOIN Usuario u ON p.idPlano = u.idPlano;