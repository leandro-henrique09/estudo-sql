-- Quantidade de transações Acumuladas ao longo do tempo(diario)?
WITH tb_diario AS (
    SELECT substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT IdTransacao) AS qtdeTransacoes 

    FROM transacoes

    GROUP BY dtDia
    ORDER BY dtDia
),

tb_acumulados AS (
    SELECT *,
        sum(qtdeTransacoes) OVER (ORDER BY dtDia) AS qtdeAcumuladaTransacoes

    FROM tb_diario 
)

SELECT *
FROM tb_acumulados

WHERE qtdeAcumuladaTransacoes >= 100000