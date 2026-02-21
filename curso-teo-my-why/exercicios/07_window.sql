-- Qual o dia da semana mais ativo de cada usuário?
WITH tb_cliente_semana AS (
    SELECT idCliente,
        strftime('%w', substr(dtCriacao, 1, 10)) AS diaSemana,  
        count(DISTINCT IdTransacao) AS qtdeTransacao

    FROM transacoes 

    GROUP BY idCliente, diaSemana
),
tb_dia_ativo AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY idCliente ORDER BY qtdeTransacao DESC) AS rn 
    FROM tb_cliente_semana
)

SELECT *
FROM tb_dia_ativo
 
WHERE rn = 1