WITH tb_cliente_dia AS (
    SELECT idCliente,
        substr(DtCriacao, 1, 10) as DtDia,
        count(DISTINCT IdTransacao) as qtdeTransacao 
    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    GROUP BY idCliente, dtDia
),

tb_lag AS (
    SELECT *,
                          -- começa a fazer contagem e incrementando linha por linha.
        sum(qtdeTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) as acumulado, 
        lag(qtdeTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) as lag 

    FROM tb_cliente_dia
)

SELECT *,
       1.* qtdeTransacao / lag 
        
FROM tb_lag 