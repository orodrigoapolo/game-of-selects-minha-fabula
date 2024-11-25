
-- Encontrar veículos reprovados em vistorias e a categoria de habilitação necessária para seus motoristas
SELECT 
    v.placa AS Placa_Veiculo,
    v.modelo AS Modelo,
    v.cor AS Cor,
    vi.resultado_vistoria AS Resultado_Vistoria,
    vi.data_vistoria AS Data_Vistoria,
    c.nome AS Categoria_Necessaria,
    c.descricao AS Descricao_Categoria
FROM 
    veiculo v
LEFT JOIN 
    vistoria vi ON v.idVeiculo = vi.fkveiculo
LEFT JOIN 
    habilitacao h ON v.fkMotorista = h.fkMotorista
LEFT JOIN 
    categoria c ON h.fkCategoria = c.idCategoria
WHERE 
    vi.resultado_vistoria LIKE 'Reprovado'
ORDER BY 
    vi.data_vistoria ASC;
    
    
-- Identificar motoristas com mais de 3 infrações pendentes e listar suas informações detalhadas
SELECT 
    m.nome AS Nome_Motorista,
    m.cpf AS CPF,
    COUNT(i.idInfracao) AS Total_Infrações_Pendentes,
    SUM(i.valor_multa) AS Total_Valor_Multas
FROM 
    motorista m
JOIN 
    infracao i ON m.idMotorista = i.fkMotorista
WHERE 
    i.status = 'Pendente'
GROUP BY 
    m.idMotorista
HAVING 
    COUNT(i.idInfracao) > 3
ORDER BY 
    Total_Infrações_Pendentes DESC;
