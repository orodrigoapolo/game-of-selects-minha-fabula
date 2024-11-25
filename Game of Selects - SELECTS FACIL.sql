
-- SELECTS FACIL 

SELECT nome,data_vencimento_cnh  FROM habilitacao WHERE data_vencimento_cnh <'2024-11-30';

SELECT * FROM habilitacao WHERE status_cnh = 'Vencida' OR 'Suspensa';

SELECT nome,cpf,data_nascimento FROM motorista ORDER BY data_nascimento DESC;

SELECT * FROM endereco WHERE cidade LIKE '%A';

SELECT  marca, modelo, ano_fabricacao FROM veiculo ORDER BY  ano_fabricacao ASC;

SELECT * FROM infracao WHERE idInfracao = 1;

SELECT * FROM vistoria WHERE resultado_vistoria = 'Aprovado';

SELECT * FROM vistoria WHERE data_vistoria < '2024-11-30'
ORDER BY data_vistoria ASC;

SELECT descricao_infracao,pontos,valor_multa FROM infracao where valor_multa >= 100.00;

SELECT placa, chassi, marca, modelo, cor FROM veiculo WHERE cor LIKE '%o%';

SELECT  * FROM vistoria WHERE tipo_vistoria LIKE 'Anual';

SELECT * FROM categoria;

select placa, chassi, marca, modelo from veiculo WHERE placa LIKE '%B%';

SELECT * FROM habilitacao ORDER BY data_emissao_cnh desc;

SELECT * FROM endereco where bairro LIKE 'Centro';

SELECT  data_infracao, descricao_infracao, pontos, valor_multa FROM  Infracao order by data_infracao ASC;