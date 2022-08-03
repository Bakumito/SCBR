create table estado (
    ID smallint generated always as identity,
    Nome varchar(20) not null unique,
    UF char(2) not null unique,
    constraint pk_id_estado primary key(ID)
);

select * from estado;

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

create table cidade (
    ID smallint generated always as identity,
    Nome varchar(30) not null,
    ID_Estado smallint not null,
    constraint pk_id_cidade primary key(ID),
    constraint fk_id_estado foreign key(id_estado)
    references estado(id)
);

select * from estado
where uf='PB' or uf='MG';

insert into cidade (nome, id_estado)
values
('João Pessoa', 15),
('Uberlândia', 11);

select * from cidade;

create table tipo_endereco (
    ID smallint generated always as identity,
    Tipo varchar(20) not null,
    constraint pk_id_tipo_endereco primary key(ID)
);

create table tipo_logradouro (
    ID smallint generated always as identity,
    Tipo varchar(20) not null,
    constraint pk_id_tipo_logradouro primary key(ID)
);

create table endereco (
    ID int generated always as identity,
    id_tipo_endereco smallint not null,
    id_cidade smallint not null,
    cep int not null,
    id_tipo_logradouro smallint not null,
    Bairro varchar(30) not null,
    Nome_Rua varchar (80) not null,
    Numero_Rua varchar(5) null,
    Complemento varchar(80) null,
    constraint pk_id_endereco primary key(ID),
    constraint fk_id_tipo_endereco foreign key(id_tipo_endereco)
    references tipo_endereco(id),
    constraint fk_id_cidade foreign key(id_cidade)
    references cidade(id),
    constraint fk_id_tipo_logradouro foreign key(id_tipo_logradouro)
    references tipo_logradouro(id)
);

create table tipo_funcionario (
    ID smallint generated always as identity,
    Tipo varchar(20) not null,
    constraint pk_id_tipo_funcionario primary key(ID)
);

create table funcionario (
    ID smallint generated always as identity,
    Nome varchar(30) not null,
    Sobrenome varchar(150),
    CPF bigint not null unique,
    Senha varchar(62) not null,
    id_tipo_funcionario smallint not null,
    constraint pk_id_funcionario primary key(ID),
    constraint fk_id_tipo_funcionario foreign key(id_tipo_funcionario)
    references tipo_funcionario(id)
);

create table ddd (
    ID smallint generated always as identity,
    Cod smallint not null,
    constraint pk_id_ddd primary key(ID)
);

create table tipo_telefone (
    ID smallint generated always as identity,
    Tipo varchar(20) not null,
    constraint pk_id_tipo_telefone primary key(ID)
);

create table telefone (
    ID int generated always as identity,
    id_tipo_telefone smallint not null,
    id_ddd smallint not null,
    Numero int not null,
    id_funcionario smallint not null,
    constraint pk_id_telefone primary key(ID),
    constraint fk_id_tipo_telefone foreign key(id_tipo_telefone)
    references tipo_telefone(id),
    constraint fk_id_ddd foreign key(id_ddd)
    references ddd(id),
    constraint fk_id_funcionario foreign key(id_funcionario)
    references funcionario(id)
);

create table tipo_email (
    ID smallint generated always as identity,
    Tipo varchar(20) not null,
    constraint pk_id_tipo_email primary key(ID)
);

create table email (
    ID int generated always as identity,
    id_tipo_email smallint not null,
    id_funcionario smallint not null,
    constraint pk_id_email primary key(ID),
    constraint fk_id_tipo_email foreign key(id_tipo_email)
    references tipo_email(id),
    constraint fk_id_funcionario foreign key(id_funcionario)
    references funcionario(id)
);

create table endereco_funcionario (
    id_endereco int not null,
    id_funcionario smallint not null,
    constraint fk_id_endereco foreign key(id_endereco)
    references endereco(id),
    constraint fk_id_funcionario foreign key(id_funcionario)
    references funcionario(id)
);

select * from cidade;

create table equipe(
    ID smallint generated always as identity,
    constraint pk_id_equipe primary key(ID)
);

create table funcionario_equipe(
    id_funcionario smallint not null,
    id_equipe smallint not null,
    constraint fk_id_funcionario foreign key(id_funcionario)
    references funcionario(id),
    constraint fk_id_equipe foreign key(id_equipe)
    references equipe(id)
);

create table status_etapa(
    ID smallint generated always as identity,
    Status varchar(20),
    constraint pk_id_status_etapa primary key(ID)
);

create table status_tarefa(
    ID smallint generated always as identity,
    Status varchar(20),
    constraint pk_id_status_tarefa primary key(ID)
);

create table status_projeto(
    ID smallint generated always as identity,
    Status varchar(20),
    constraint pk_id_status_projeto primary key(ID)
);

create table projeto(
    ID smallint generated always as identity,
    id_equipe smallint not null,
    Nome varchar(80) not null,
    Prazo timestamp null,
    Data_Inicio timestamp null,
    Data_Fim timestamp null,    
    id_status_projeto smallint,
    constraint pk_id_projeto primary key(ID),
    constraint fk_id_status_projeto foreign key(id_status_projeto)
    references status_projeto(ID)
);


FALTAM AS TABELAS TAREFA E ETAPA