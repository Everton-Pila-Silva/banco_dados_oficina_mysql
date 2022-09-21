-- Após a criação do esquema lógico, realize a criação do Script SQL para criação do esquema do banco de dados. Posteriormente, realize a persistência de dados para realização de testes. 
-- Especifique ainda queries mais complexas do que apresentadas durante a explicação do desafio. Sendo assim, crie queries SQL com as cláusulas abaixo:

-- Recuperações simples com SELECT Statement;
select * from ordem_de_serviço;

-- Filtros com WHERE Statement;
-- Quantas Ordens de serviços pronta temos no sistema?

select count(*) from ordem_de_serviço where OSstatus = 'Pronta';

-- Crie expressões para gerar atributos derivados;

SELECT Modelo, Ano,
         CASE Ano
			WHEN (Ano <= 1990) THEN 'Antigo'
			WHEN (Ano > 1990 and Ano <= 2015 )THEN 'Usado'
			WHEN (Ano > 2015) THEN 'Novo'
				ELSE 'Erro' END AS Classificação
  FROM veiculo;

-- Defina ordenações dos dados com ORDER BY;
-- Condições de filtros aos grupos – HAVING Statement;
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;

select c.Nome as Nome_cliente, v.Modelo as carro, e.participantes as equipe, OSstatus as status_orçamento, GROUP_CONCAT(p.idPecas, ' ') as conjunto_pecas, sum(p.valor) as soma_pecas, vmo.valor as 'valor trabalho', vmo.tipo_servico
from cliente c
					Inner join veiculo v on c.idCliente = v.C_idCliente
                    Inner join veiculo_possui_equipe vpe on v.idVeiculo = vpe.idVeiculo
                    Inner join equipe e on vpe.idEquipe = e.idEquipe
                    right join equipe_possui_os epos on e.idEquipe = epos.idEquipe
					inner join ordem_de_serviço os on epos.idOrdem_de_serviço = os.idOrdem_de_serviço
					inner join peças_para_orcamento ppo on os.idOrdem_de_serviço = ppo.idOrdem_de_serviço
                    left join pecas as p on ppo.PidPecas = p.idPecas
                    inner join valores_mao_de_obra vmo on os.idOrcamento = vmo.idOrcamento
			group by Nome_cliente
            having soma_pecas > 20
            Order by c.Nome ASC;
                    