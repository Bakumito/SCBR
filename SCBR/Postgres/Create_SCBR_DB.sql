-- criação do banco --
create table estado (
    ID smallint generated always as identity,
    Nome varchar(20) not null unique,
    UF char(2) not null unique,
    constraint pk_id_estado primary key(ID)
);

create table cidade (
    ID smallint generated always as identity,
    Nome varchar(30) not null,
    ID_Estado smallint not null,
    constraint pk_id_cidade primary key(ID),
    constraint fk_id_estado foreign key(id_estado)
    references estado(id)
);

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
    email varchar(180) not null,
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

create table equipe(
    ID smallint generated always as identity,
    nome varchar(80),
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
    status varchar(30),
    constraint pk_id_status_etapa primary key(ID)
);

create table status_tarefa(
    ID smallint generated always as identity,
    status varchar(30),
    constraint pk_id_status_tarefa primary key(ID)
);

create table status_projeto(
    ID smallint generated always as identity,
    status varchar(30),
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
    constraint fk_id_equipe foreign key(id_equipe)
    references equipe(ID),
    constraint fk_id_status_projeto foreign key(id_status_projeto)
    references status_projeto(ID)
);

create table tarefa(
    ID int generated always as identity,
    id_projeto smallint not null,
    descricao varchar(255) not null,
    Prazo timestamp null,
    Data_Inicio timestamp null,
    Data_Fim timestamp null,    
    id_status_tarefa smallint,
    ordem smallint generated by default as identity,
    constraint pk_id_tarefa primary key(ID),
    constraint fk_id_projeto foreign key(id_projeto)
    references projeto(ID),
    constraint fk_id_status_tarefa foreign key(id_status_tarefa)
    references status_tarefa(ID)
);

create table etapa(
    ID int generated always as identity,
    id_tarefa int not null,
    Prazo timestamp null,
    Data_Inicio timestamp null,
    Data_Fim timestamp null,    
    id_status_etapa smallint,
    ordem smallint generated by default as identity,
    constraint pk_id_etapa primary key(ID),
    constraint fk_id_tarefa foreign key(id_tarefa)
    references tarefa(ID),
    constraint fk_id_status_etapa foreign key(id_status_etapa)
    references status_etapa(ID)
);