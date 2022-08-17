INSERT INTO estado (nome, uf) 
VALUES
('Acre', 'AC'),
('Alagoas', 'AL'),
('Amazonas', 'AM'),
('Amapá', 'AP'),
('Bahia', 'BA'),
('Ceará', 'CE'),
('Distrito Federal', 'DF'),
('Espírito Santo', 'ES'),
('Goiás', 'GO'),
('Maranhão', 'MA'),
('Minas Gerais', 'MG'),
('Mato Grosso do Sul', 'MS'),
('Mato Grosso', 'MT'),
('Pará', 'PA'),
('Paraíba', 'PB'),
('Pernambuco', 'PE'),
('Piauí', 'PI'),
('Paraná', 'PR'),
('Rio de Janeiro', 'RJ'),
('Rio Grande do Norte', 'RN'),
('Rondônia', 'RO'),
('Roraima', 'RR'),
('Rio Grande do Sul', 'RS'),
('Santa Catarina', 'SC'),
('Sergipe', 'SE'),
('São Paulo', 'SP'),
('Tocantins', 'TO');

insert into cidade (nome, id_estado)
values
('Uberlândia', 11),
('João Pessoa', 15);

insert into tipo_endereco (tipo)
values
('Principal'),
('Alternativo_1'),
('Alternativo_2'),
('Alternativo_3');

insert into tipo_logradouro (tipo)
values
('Aeroporto'),
('Alameda'),
('Avenida'),
('BR'),
('Chácara'),
('Colônia'),
('Estrada'),
('Rua'),
('Condomínio');

insert into endereco (
    id_tipo_endereco,
    id_cidade,
    cep,
    id_tipo_logradouro,
    Bairro,
    Nome_Rua,
    Numero_Rua,
    Complemento
)
values
(1, 2, 58037545, 8, 'Jardim Oceania', 'José Ferreira Ramos', 81, 'Ap 101');

insert into tipo_funcionario (
    tipo
)
values 
('Analista'),
('Desenvolvedor'),
('Estagiario');

insert into funcionario (
    Nome,
    Sobrenome,
    CPF,
    Senha,
    id_tipo_funcionario
)
values
('Thomaz', 'Falbo Santos', 09838266680, '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', 3);

insert into ddd (cod)
values
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(21),
(22),
(24),
(27),
(28),
(31),
(32),
(33),
(34),
(35),
(37),
(38),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(51),
(53),
(54),
(55),
(61),
(62),
(63),
(64),
(65),
(66),
(67),
(68),
(69),
(71),
(73),
(74),
(75),
(77),
(79),
(81),
(82),
(83),
(84),
(85),
(86),
(87),
(88),
(89),
(91),
(92),
(93),
(94),
(95),
(96),
(97),
(98),
(99);

insert into tipo_telefone (tipo)
values
('Principal'),
('Residencial'),
('Comercial'),
('Contato_1'),
('Contato_2'),
('Contato_3');

insert into telefone (
    id_tipo_telefone,
    id_ddd,
    Numero,
    id_funcionario
)
values
(1, 52, 988802464, 1);

insert into tipo_email (tipo)
values
('Pessoal'),
('Comercial'),
('Alternativo');

insert into email (
    id_tipo_email,
    email,
    id_funcionario
)
values
(1, 'thomazfalbo@outlook.com', 1),
(2, 'thomaz.falbo@smn.com.br', 1),
(3, 'thomazfalbo@gmail.com', 1);

insert into endereco_funcionario (
    id_endereco,
    id_funcionario
)
values
(1, 1);

insert into equipe (nome)
values
('Time SMN Jampa');

insert into funcionario_equipe (
    id_funcionario,
    id_equipe
)
values
(1, 1);

insert into status_etapa (status)
values
('Não Iniciado'),
('Iniciado'),
('Em andamento'),
('Cancelado'),
('Recusado'),
('Parcialmente concluído'),
('Concluído'),
('Com falha'),
('Auditado');

insert into status_tarefa (status)
values
('Não Iniciado'),
('Iniciado'),
('Em andamento'),
('Cancelado'),
('Recusado'),
('Parcialmente concluído'),
('Concluído'),
('Com falha'),
('Auditado');

insert into status_projeto (status)
values
('Não Iniciado'),
('Iniciado'),
('Em andamento'),
('Cancelado'),
('Recusado'),
('Parcialmente concluído'),
('Concluído'),
('Com falha'),
('Auditado');

insert into projeto (
    id_equipe,
    nome,
    Prazo,
    Data_Inicio,
    Data_Fim,
    id_status_projeto
)
values
    (1, 'Agil Move', '08/08/2022 05:30:00', '03/08/2022 07:30', null, 3);

insert into tarefa(
    id_projeto,
    descricao,
    Prazo,
    Data_Inicio,
    Data_Fim,    
    id_status_tarefa
)
values
(1, 'Iniciar o projeto', '05/08/2022 07:30', '03/08/2022 07:30', null, 8);

insert into etapa(
    id_tarefa,
    Prazo,
    Data_Inicio,
    Data_Fim,    
    id_status_etapa
)
values
(1, '05/08/2022 07:30', '03/08/2022 07:30', '03/08/2022 07:30', 7),
(1, '05/08/2022 07:30', '03/08/2022 07:30', '03/08/2022 07:30', 9),
(1, '05/08/2022 07:30', null, null, 1);