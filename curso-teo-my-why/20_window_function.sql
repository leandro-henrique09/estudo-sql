WITH tb_cliente_dia AS (
    SELECT  DISTINCT
            IdCliente,
            substr(DtCriacao, 1, 10) as dtDia

    FROM transacoes 

    WHERE substr(DtCriacao, 1, 4) = '2025'

    ORDER BY idCliente, dtDia
),

tb_lag AS (
    SELECT *,
        lag(dtDia) OVER (PARTITION BY  idCliente ORDER BY dtDia) AS lagDia  
    FROM tb_cliente_dia
),

tb_diff_dt AS (
    SELECT *,
        julianday(dtDia) - julianday(lagDia) AS dtDiff 
    FROM tb_lag
),
tb_avg AS (
    SELECT idCliente, 
        avg(dtDiff) AS avgDia

    FROM tb_diff_dt
    GROUP BY idCliente 
)

-- aqui, mostra a media que os clientes voltam a assistir aulas
SELECT avg(avgDia)
FROM tb_avg