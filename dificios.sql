
SELECT 
    m.nome AS motorista,
    COUNT(v.idVeiculo) AS quantidade_veiculos,
    AVG(i.valor_multa) AS valor_medio_infracoes
FROM motorista m
LEFT JOIN veiculo v ON m.idMotorista = v.fkMotorista
LEFT JOIN infracao i ON m.idMotorista = i.fkMotorista
GROUP BY m.idMotorista, m.nome;


SELECT 
    m.nome AS motorista,
    v.modelo AS veiculo,
    v.placa
FROM motorista m
LEFT JOIN veiculo v ON m.idMotorista = v.fkMotorista;

SELECT 
    v.modelo AS veiculo,
    v.placa,
    m.nome AS motorista
FROM motorista m
RIGHT JOIN veiculo v ON m.idMotorista = v.fkMotorista;

SELECT 
    c.nome AS categoria,
    c.descricao,
    (SELECT SUM(i.valor_multa)
     FROM infracao i
     WHERE i.status = 'Pendente' AND i.fkMotorista = h.fkMotorista) AS valor_total_pendente
FROM categoria c
INNER JOIN habilitacao h ON c.idCategoria = h.fkCategoria;

SELECT 
    m.nome AS motorista,
    i.status,
    COALESCE(AVG(i.pontos), 0) AS pontos_medios
FROM motorista m
LEFT JOIN infracao i ON m.idMotorista = i.fkMotorista
GROUP BY m.idMotorista, m.nome, i.status;

