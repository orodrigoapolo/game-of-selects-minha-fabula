CREATE DATABASE gameofselects;
USE gameofselects;

CREATE TABLE motorista (
  idMotorista INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  cpf CHAR(11) UNIQUE,
  data_nascimento DATE,
  data_emissao_cnh DATE,
  data_vencimento_cnh DATE,
  status_cnh VARCHAR (10)
	CONSTRAINT chkcnh_status CHECK (status_cnh IN ('Ativa', 'Suspensa', 'Vencida', 'Pendente'))
);

CREATE TABLE endereco (
    idEndereco INT AUTO_INCREMENT PRIMARY KEY,
    fkMotorista INT UNIQUE, 
     FOREIGN KEY (fkMotorista) REFERENCES motorista(idMotorista),
    logradouro VARCHAR(45),
    bairro VARCHAR (45),
    numero VARCHAR (10),
    cidade VARCHAR(30),
    uf CHAR(2),
    cep CHAR(8)
);

CREATE TABLE veiculo (
  idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
  placa CHAR(7) UNIQUE,
  chassi VARCHAR(17) UNIQUE,
  marca VARCHAR(50),
  modelo VARCHAR(50),
  ano_fabricacao CHAR(4),
  ano_modelo CHAR(4),
  cor VARCHAR(20),
  fkMotorista INT,
  FOREIGN KEY (fkMotorista) REFERENCES Motorista(idMotorista)
);

CREATE TABLE infracao (
  idInfracao INT AUTO_INCREMENT PRIMARY KEY,
  fkMotorista INT,
		FOREIGN KEY (fkMotorista) REFERENCES motorista(idMotorista),
  data_infracao DATE,
  descricao_infracao VARCHAR(100),
  pontos INT,
  valor_multa DECIMAL(10,2),
  status VARCHAR (10)
	CONSTRAINT chk_infracoes_status CHECK (status IN ('Paga', 'Pendente', 'Contestada'))
);

CREATE TABLE vistoria (
  id_vistoria INT AUTO_INCREMENT PRIMARY KEY,
  fkveiculo INT,
	FOREIGN KEY (fkveiculo) REFERENCES veiculo(idVeiculo),
  data_vistoria DATE,
  tipo_vistoria VARCHAR(30)
		CONSTRAINT chk_tipo_vistoria CHECK (tipo_vistoria IN ('Anual', 'Transferência', 'Mudança de Propriedade')),
  resultado_vistoria VARCHAR (10)
		CONSTRAINT chk_resultado_vistoria CHECK (resultado_vistoria IN ('Aprovado', 'Reprovado')),
  observacoes VARCHAR (50)
);


CREATE TABLE categoria (
idCategoria INT AUTO_INCREMENT PRIMARY KEY,
nome CHAR (1),
descricao VARCHAR (255)
);

CREATE TABLE habilitacao (
fkMotorista INT,
fkCategoria INT,
PRIMARY KEY (fkMotorista, fkCategoria),
	FOREIGN KEY (fkMotorista) REFERENCES motorista(idMotorista),
    FOREIGN KEY (fkCategoria) REFERENCES categoria(idCategoria)
);

INSERT INTO motorista (nome, cpf, data_nascimento, data_emissao_cnh, data_vencimento_cnh, status_cnh)
VALUES 
('Carlos Silva', '12345678901', '1985-04-15', '2015-06-10', '2025-06-10', 'Ativa'),
('Ana Oliveira', '98765432100', '1990-07-30', '2018-08-15', '2023-08-15', 'Vencida'),
('João Pereira', '11223344556', '1992-11-20', '2019-02-05', '2024-02-05', 'Suspensa'),
('Maria Costa', '22334455667', '1980-03-22', '2010-11-10', '2025-11-10', 'Ativa'),
('Fernanda Souza', '32165498700', '1983-02-25', '2016-09-20', '2026-09-20', 'Ativa'),
('Ricardo Almeida', '65498732100', '1975-12-05', '2014-11-18', '2024-11-18', 'Vencida'),
('Tatiane Lima', '45678912345', '1995-06-13', '2017-03-10', '2022-03-10', 'Suspensa'),
('Eduardo Martins', '78945612300', '1988-08-14', '2020-05-30', '2025-05-30', 'Ativa'),
('Juliana Costa', '85296374123', '1980-01-10', '2012-06-15', '2022-06-15', 'Suspensa'),
('Felipe Rocha', '36925814700', '1992-09-28', '2019-07-21', '2024-07-21', 'Pendente');

INSERT INTO endereco (fkMotorista, logradouro, bairro, numero, cidade, uf, cep)
VALUES
(1, 'Rua das Flores', 'Centro', '100', 'São Paulo', 'SP', '01001000'),
(2, 'Avenida Brasil', 'Jardim Paulista', '200', 'Rio de Janeiro', 'RJ', '22010001'),
(3, 'Rua dos Limoeiros', 'Vila Mariana', '300', 'Belo Horizonte', 'MG', '30100002'),
(4, 'Praça da Liberdade', 'Centro', '400', 'Brasília', 'DF', '70000003'),
(5, 'Rua João Pessoa', 'Centro', '150', 'Fortaleza', 'CE', '60000010'),
(6, 'Avenida das Nações', 'Zona Norte', '2500', 'Recife', 'PE', '52000001'),
(7, 'Rua do Comércio', 'Centro', '350', 'São Paulo', 'SP', '01001010'),
(8, 'Rua da Paz', 'Jardim Brasil', '710', 'Rio de Janeiro', 'RJ', '21000100'),
(9, 'Avenida Independência', 'Vila Industrial', '550', 'Campinas', 'SP', '13000005'),
(10, 'Rua das Margaridas', 'Bela Vista', '1020', 'Brasília', 'DF', '70000020');

INSERT INTO veiculo (placa, chassi, marca, modelo, ano_fabricacao, ano_modelo, cor, fkMotorista)
VALUES
('ABC1234', '9BWZZZ377VT012345', 'Volkswagen', 'Fusca', '1970', '1971', 'Azul', 1),
('XYZ4321', '2A4RD4DG9CR347899', 'Fiat', 'Palio', '2015', '2016', 'Preto', 2),
('LMN9876', '1G4GD5G0XER123456', 'Chevrolet', 'Onix', '2020', '2021', 'Branco', 3),
('QWE5678', '3FADP4F31L1234567', 'Ford', 'Fiesta', '2018', '2019', 'Vermelho', 4),
('DEF5678', '2FALP71W88X101234', 'Ford', 'Focus', '2015', '2016', 'Prata', 5),
('GHI7890', '1HGCM82633A123456', 'Honda', 'Civic', '2017', '2018', 'Preto', 6),
('JKL4321', '4S4WMBR61C3212345', 'Subaru', 'Outback', '2020', '2021', 'Cinza', 2),
('MNO8765', '2G1FB1E38F9192345', 'Chevrolet', 'Cruze', '2018', '2019', 'Branco', 3),
('PQR4321', '1FAHP3F29AJ123456', 'Ford', 'Fusion', '2021', '2021', 'Azul', 4),
('STU3456', '1C4RJFAG9FC123456', 'Jeep', 'Compass', '2019', '2020', 'Verde', 1);

INSERT INTO infracao (fkMotorista, data_infracao, descricao_infracao, pontos, valor_multa, status)
VALUES
(1, '2023-09-15', 'Excesso de Velocidade', 5, 150.00, 'Pendente'),
(2, '2023-08-20', 'Estacionamento Proibido', 3, 80.00, 'Paga'),
(3, '2023-10-01', 'Uso do Celular ao Dirigir', 4, 200.00, 'Contestada'),
(4, '2023-07-10', 'Avançar o Sinal Vermelho', 7, 350.00, 'Paga'),
(5, '2023-09-10', 'Estacionamento em local proibido', 3, 120.00, 'Paga'),
(6, '2023-08-05', 'Condução sob efeito de álcool', 7, 800.00, 'Pendente'),
(1, '2023-07-20', 'Não uso de cinto de segurança', 4, 150.00, 'Contestada'),
(2, '2023-06-25', 'Excesso de velocidade', 5, 300.00, 'Paga'),
(3, '2023-09-05', 'Ultrapassagem em local proibido', 5, 250.00, 'Pendente'),
(4, '2023-10-01', 'Avançar sinal vermelho', 7, 450.00, 'Paga');

INSERT INTO vistoria (fkveiculo, data_vistoria, tipo_vistoria, resultado_vistoria, observacoes)
VALUES
(1, '2023-05-10', 'Anual', 'Aprovado', 'Veículo em bom estado geral'),
(2, '2023-07-15', 'Mudança de Propriedade', 'Reprovado', 'Problema no sistema de iluminação'),
(3, '2023-04-20', 'Anual', 'Aprovado', 'Tudo certo com o veículo'),
(4, '2023-06-10', 'Transferência', 'Aprovado', 'Veículo regularizado'),
(1, '2023-08-15', 'Anual', 'Aprovado', 'Sem observações'),
(2, '2023-09-18', 'Transferência', 'Aprovado', 'Veículo regularizado'),
(3, '2023-07-25', 'Anual', 'Reprovado', 'Problema no sistema de iluminação'),
(4, '2023-09-10', 'Mudança de Propriedade', 'Aprovado', 'Veículo em boas condições'),
(5, '2023-06-30', 'Anual', 'Aprovado', 'Tudo conforme esperado'),
(6, '2023-08-01', 'Transferência', 'Reprovado', 'Problema no motor');

desc vistoria;

INSERT INTO categoria (nome, descricao)
VALUES
('A', 'Categoria A - Para conduzir motocicletas'),
('B', 'Categoria B - Para conduzir carros de passeio'),
('C', 'Categoria C - Para conduzir veículos de carga'),
('D', 'Categoria D - Para conduzir veículos de transporte de passageiros');

INSERT INTO habilitacao (fkMotorista, fkCategoria)
VALUES
(1, 2),  -- Carlos Silva, Categoria B (Carros de passeio)
(2, 3),  -- Ana Oliveira, Categoria C (Veículos de carga)
(3, 1),  -- João Pereira, Categoria A (Motocicletas)
(4, 2),  -- Maria Costa, Categoria B (Carros de passeio)
(5, 3),  -- Fernanda Souza, Categoria C (Veículos de carga)
(6, 2),  -- Ricardo Almeida, Categoria B (Carros de passeio)
(7, 2),  -- Tatiane Lima, Categoria B (Carros de passeio)
(8, 1),  -- Eduardo Martins, Categoria A (Motocicletas)
(9, 4),  -- Juliana Costa, Categoria D (Veículos de transporte de passageiros)
(10, 2);  -- Felipe Rocha, Categoria B (Carros de passeio)
