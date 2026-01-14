-- Qual dia da semana quem mais pedidos em 2025?

SELECT strftime('%w',DtCriacao) AS diasSemana,
       count(*) AS totalPontoDia
FROM transacoes

-- WHERE strftime('%w',DtCriacao) NOT IN ('0', '6')
WHERE DtCriacao >= '2025-01-01'
AND DtCriacao < '2026-01-01'

GROUP BY diasSemana

ORDER BY totalPontoDia desc