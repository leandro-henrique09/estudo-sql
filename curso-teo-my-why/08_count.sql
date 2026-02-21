-- SELECT 
--         count(*),
--         count(1),
--         count(idCliente),
--         count(DtCriacao),
--         count(DtAtualizacao)
-- FROM clientes;

SELECT count(DISTINCT idCliente) AS 'qtdeClientes'
FROM clientes