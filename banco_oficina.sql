use oficina;

-- Table Mecanico
CREATE TABLE IF NOT EXISTS Mecanico(
  idMecanico INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(45) NULL,
  Endereco VARCHAR(200) NULL,
  Especialidade VARCHAR(45) NULL);


-- Table Equipe

CREATE TABLE IF NOT EXISTS Equipe(
  idEquipe INT PRIMARY KEY AUTO_INCREMENT,
  participantes VARCHAR(45) NULL);


-- Table Tipo_serviço
CREATE TABLE IF NOT EXISTS Tipo_serviço(
  idTipo_seviço INT PRIMARY KEY AUTO_INCREMENT,
  tipo_serviço VARCHAR(45) 
  );


-- Table valores_mao_de_obra

CREATE TABLE IF NOT EXISTS valores_mao_de_obra(
  idOrcamento INT PRIMARY KEY AUTO_INCREMENT,
  valor FLOAT,
  tipo_servico VARCHAR(45));

ALTER TABLE veiculo CHANGE COLUMN Ano Ano INT;

-- Table Ordem_de_serviço

CREATE TABLE IF NOT EXISTS Ordem_de_serviço (
  idOrdem_de_serviço INT NOT NULL,
  data_emissao DATE,
  valor_total FLOAT ,
  OSstatus ENUM('Em processamento', 'Aguardando analise', 'Pronta') Default 'Em processamento' ,
  data_finalizacao DATE,
  idTipo_serviço INT NOT NULL,
  idOrcamento INT NOT NULL,
  PRIMARY KEY (idOrdem_de_serviço, idTipo_serviço, idOrcamento),
  CONSTRAINT fk_OS_Tipo_serviço FOREIGN KEY (idTipo_serviço) REFERENCES Tipo_serviço (idTipo_seviço),
  CONSTRAINT fk_OS_valores_mao_de_obra FOREIGN KEY (idOrcamento) REFERENCES valores_mao_de_obra (idOrcamento));

-- Table Cliente

CREATE TABLE IF NOT EXISTS Cliente(
  idCliente INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  CPF VARCHAR(11) NOT NULL,
  Endereço VARCHAR(200),
  Telefone VARCHAR(45),
  Email VARCHAR(45));

-- Table Veiculo

CREATE TABLE IF NOT EXISTS Veiculo(
  idVeiculo INT NOT NULL,
  Modelo VARCHAR(45),
  Ano INT,
  C_idCliente INT NOT NULL,
  PRIMARY KEY (idVeiculo, C_idCliente),
  CONSTRAINT fk_Veiculo_Cliente FOREIGN KEY (C_idCliente) REFERENCES Cliente(idCliente)
  );

-- Table Peças

CREATE TABLE IF NOT EXISTS Pecas(
  idPecas INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  Valor FLOAT
  );


-- Table Mecanico_possui_Equipe

CREATE TABLE IF NOT EXISTS Mecanico_possui_Equipe(
  MidMecanico INT NOT NULL,
  EidEquipe INT NOT NULL,
  PRIMARY KEY (MidMecanico, EidEquipe),
  CONSTRAINT fk_ME_Mecanico FOREIGN KEY (MidMecanico) REFERENCES Mecanico(idMecanico),
  CONSTRAINT fk_ME_Equipe FOREIGN KEY (EidEquipe) REFERENCES Equipe (idEquipe));



-- Table Veiculo_possui_Equipe

CREATE TABLE IF NOT EXISTS Veiculo_possui_Equipe(
  idVeiculo INT NOT NULL,
  idCliente INT NOT NULL,
  idEquipe INT NOT NULL,
  PRIMARY KEY (idVeiculo, idCliente, idEquipe),
  CONSTRAINT fk_VE_Equipe_id FOREIGN KEY (idVeiculo , idCliente) REFERENCES Veiculo (idVeiculo , C_idCliente),
  CONSTRAINT fk_VE_Veiculo_id FOREIGN KEY (idEquipe) REFERENCES Equipe (idEquipe)
  );


-- Table Equipe_possui_Ordem_de_serviço

CREATE TABLE IF NOT EXISTS Equipe_possui_OS(
  idEquipe INT NOT NULL,
  idOrdem_de_serviço INT NOT NULL,
  idTipo_serviço INT NOT NULL,
  PRIMARY KEY (idEquipe, idOrdem_de_serviço, idTipo_serviço),
  CONSTRAINT fk_OS_Equipe1 FOREIGN KEY (idEquipe) REFERENCES Equipe (idEquipe),
  CONSTRAINT fk_Equipe_has_OS FOREIGN KEY (idOrdem_de_serviço , idTipo_serviço) REFERENCES Ordem_de_serviço (idOrdem_de_serviço , idTipo_serviço));


-- Table Peças_para_Orcamento

CREATE TABLE IF NOT EXISTS Peças_para_Orcamento (
  PidPecas INT NOT NULL,
  idOrdem_de_serviço INT NOT NULL,
  PRIMARY KEY (PidPecas, idOrdem_de_serviço),
  CONSTRAINT fk_Peças_id FOREIGN KEY (PidPecas)  REFERENCES Pecas (idPecas),
  CONSTRAINT fk_Peças_has_OS FOREIGN KEY (idOrdem_de_serviço) REFERENCES Ordem_de_serviço (idOrdem_de_serviço));


