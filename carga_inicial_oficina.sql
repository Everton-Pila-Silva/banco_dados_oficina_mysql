select * from Equipe_possui_OS;
          
insert into Cliente (Nome, CPF, Endereço, Telefone, Email) values 
			('João', 123456789, 'endereço 1', 358878799, null),
            ('José', 123456788, 'endereço 2', 358878798, null),
            ('Josias', 123456787, 'endereço 3', 358878710, null),
            ('Joana', 123456786, 'endereço 4', 358878711, null),
            ('Jorge', 123456785, 'endereço 5', null,'jorgea@gmail.com');
            
insert into Veiculo (idVeiculo, Modelo, Ano, C_idCliente) values 
			(1, 'Corsa', 1999, 1),
            (2, 'Marea', 1997, 2),
            (3, 'Fusca', 1970, 3),
            (4, 'Gol', 2005, 4),
            (5, 'Astra', 2002, 5);

insert into Equipe (participantes) values 
			('tião, carlos, josias'),
            ('joão, rogério, matheis');

insert into Veiculo_possui_Equipe (idVeiculo, idCliente, idEquipe) values 
			(1, 1, 1),
            (2, 2, 1),
            (3, 3, 1),
            (4, 4, 2),
            (5, 5, 2);
            
insert into Mecanico (Nome, Endereco, Especialidade) values 
			('tião', 'endereço 1', 'Motor'),
            ('carlos', 'endereço 2', 'Transmissão'),
            ('josias', 'endereço 3', 'Elétrica'),
            ('joão', 'endereço 4', 'Motor'),
            ('rogério', 'endereço 5', 'Transmissão'),
            ('matheis', 'endereço 6', 'Elétrica');
            
insert into Mecanico_possui_Equipe (MidMecanico, EidEquipe) values 
			(1, 1),
            (2, 1),
            (3, 1),
            (4, 2),
            (5, 2),
            (6, 2);

insert into Pecas (Nome, Valor) values 
			('Rebimboca', 100.0),
            ('Parafuseta', 100.0),
            ('Disco cambio',300.0),
            ('Biela', 200.0),
            ('Cabeçote', 400.0),
            ('Fusiveis', 10.0),
            ('Vela', 30.0);
            
            
insert into valores_mao_de_obra (valor, tipo_servico) values 
			(2000.0, 'Retificar motor'),
            (1000.0, 'Trocar cambio'),
            (500.0, 'Fiação'),
            (50.0, 'Trocar Oleo');
            
insert into Tipo_serviço (tipo_serviço) values 
			('Retifica'),
            ('Embreagem'),
            ('Elétrica'),
            ('Revisão');
 
 insert into ordem_de_serviço (idOrdem_de_serviço, data_emissao, OSstatus, data_finalizacao, idTipo_serviço,  idOrcamento) values 
			(2, '2022-09-05', 'Pronta', '2022-09-10', 2, 2),
            (3, '2022-09-15', default, null, 3, 3),
			(4, '2022-09-18', default, null, 4, 4);

insert into Peças_para_Orcamento (idOrdem_de_serviço, PidPecas) values 
			(1, 1),
            (1, 2),
            (1, 4),
            (2, 3),
            (2, 1),
            (3, 6),
            (3, 7),
            (4, 1);
            
insert into Equipe_possui_OS (idEquipe, idOrdem_de_serviço, idTipo_serviço) values 
			(1, 1, 1),
            (1, 2, 2),
            (2, 3, 3),
            (2, 4, 4);
            
