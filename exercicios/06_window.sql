-- Quantidade de usuários cadastrados (absoluto e acumulado) ao longo do tempo?
WITH tb_dia_clientes AS (
    SELECT substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT idCliente) AS qtdeClientes
    FROM clientes

    GROUP BY dtDia
),
tb_acumulado AS (
    SELECT *,
        sum(qtdeClientes) OVER (ORDER BY dtDia) AS qtdeClientesAcum
    FROM tb_dia_clientes 
)

SELECT *
FROM tb_acumulado
ORDER BY dtDia