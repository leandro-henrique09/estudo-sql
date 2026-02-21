-- 10. Como foi a curva de Churn do Curso de SQL?

WITH tb_primeiro_dia AS (
    SELECT *
    FROM transacoes
    WHERE substr(DtCriacao,1,10) >= '2025-08-25'
    AND substr(DtCriacao,1,10) <= '2025-08-26'
)

SELECT substr(t2.DtCriacao, 1, 10) AS dia,
       count(DISTINCT t1.idCliente) AS qtdeClientes 
FROM tb_primeiro_dia AS t1

LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente

WHERE substr(t2.DtCriacao, 1, 10) >= '2025-08-25'
AND substr(t2.DtCriacao, 1, 10) < '2025-08-30'

GROUP BY dia