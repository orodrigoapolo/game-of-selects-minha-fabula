
-- SELECTS MEDIOS 

SELECT m.nome, COUNT(i.idInfracao) AS total_infracoes
FROM motorista m
JOIN infracao i ON m.idMotorista = i.fkMotorista
GROUP BY m.idMotorista, m.nome
ORDER BY total_infracoes DESC;

SELECT i.status, AVG(i.valor_multa) AS media_valor_multa
FROM infracao i
GROUP BY i.status
ORDER BY media_valor_multa DESC;

SELECT 
    MIN(v.ano_fabricacao) AS ano_mais_antigo,
    MAX(v.ano_fabricacao) AS ano_mais_recente
FROM veiculo v;

SELECT e.uf, COUNT(e.idEndereco) AS total_motoristas
FROM motorista m
JOIN endereco e ON m.idMotorista = e.fkMotorista
GROUP BY e.uf
ORDER BY total_motoristas DESC;

SELECT m.nome, AVG(i.pontos) AS media_pontos
FROM motorista m
JOIN infracao i ON m.idMotorista = i.fkMotorista
GROUP BY m.idMotorista, m.nome
ORDER BY media_pontos DESC;

SELECT v.tipo_vistoria, COUNT(v.id_vistoria) AS total_vistorias
FROM vistoria v
GROUP BY v.tipo_vistoria;

SELECT m.nome, COUNT(v.idVeiculo) AS total_veiculos
FROM motorista m
JOIN veiculo v ON m.idMotorista = v.fkMotorista
GROUP BY m.idMotorista, m.nome
ORDER BY total_veiculos DESC
LIMIT 1;

SELECT m.nome, MAX(i.valor_multa) AS multa_mais_alta
FROM motorista m
JOIN infracao i ON m.idMotorista = i.fkMotorista
GROUP BY m.idMotorista, m.nome
ORDER BY multa_mais_alta DESC
LIMIT 1;

SELECT v.placa, COUNT(vi.id_vistoria) AS total_vistorias_aprovadas
FROM veiculo v
JOIN vistoria vi ON v.idVeiculo = vi.fkveiculo
WHERE vi.resultado_vistoria = 'Aprovado'
GROUP BY v.idVeiculo, v.placa
ORDER BY total_vistorias_aprovadas DESC
LIMIT 1;

SELECT 
    m.nome AS motorista,
    m.data_nascimento AS data_de_nascimento
FROM motorista m
WHERE m.data_nascimento = (SELECT MIN(data_nascimento) FROM motorista)
   OR m.data_nascimento = (SELECT MAX(data_nascimento) FROM motorista)
ORDER BY m.data_nascimento ASC;

