select * from information_schema.tables
select * from cidade;
select * from funcionario;
select * from endereco;
select * from estado;
select * from endereco_funcionario;

select
        F.nome || ' ' ||
        F.sobrenome as "Nome do Funcionário",
        C.nome          as "Cidade",
        E.uf            as "UF",
        E.nome          as "Estado",
        EN.cep          as "CEP",
        EN.nome_rua || ', ' || EN.numero_rua || ', ' || EN.bairro   as "Endereço",
        EN.complemento  as "Complemento"
    from estado E
full join cidade C
    on E.id = C.id_estado
full join endereco EN
    on C.id = EN.id_cidade
inner join endereco_funcionario EF
    on EN.id = EF.id_endereco
inner join funcionario F
    on EF.id_funcionario = F.id

Select e.uf as "sigla_uf", e.nome as "nome_estado", c.nome as "cidade" 
  from estado e
left join cidade c
    on e.id = c.id_estado
Where e.uf = 'TO'


select * from pg_tables
where schemaname = 'public'
order by tablename desc;
select * from ddd
select * from telefone
select * from equipe
select * from projeto
select * from funcionario
select id_funcionario as Aluno, id_equipe as Turma from funcionario_EQUIPE

create or replace view "Dados do Funcionário"(
    "Nome Completo","Número de telefone"
)
as select
    funcionario.nome || ' ' || sobrenome as "Nome Completo",
    ddd.cod || '-' || telefone.numero as "Número de telefone"
from funcionario
inner join telefone
    on telefone.id_funcionario = funcionario.id
inner join ddd
    on ddd.id = telefone.id_ddd
    
drop view "Dados do Funcionário"
    

select * from "Dados do Funcionário"

select
    nome || ' ' || sobrenome as "Nome Completo",
    cpf
From funcionario
insert into funcionario (
    nome, sobrenome, cpf, senha, id_tipo_funcionario)
values
('Ianko', 'Cavalcante', 00099900045, '123mudar', 1)

insert into funcionario_equipe (
    id_funcionario, id_equipe)
values
(1, 2)