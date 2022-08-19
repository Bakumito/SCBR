drop view vw_dados_funcionario;
create or replace view vw_dados_funcionario (
	nome_completo,
	cpf,
	cep,
	endereco_completo,
	email_principal,
	telefone_principal,
	equipe,
	cargo
) as
	select
		distinct on (F.id)
	F.nome || ' ' || F.sobrenome,
	F.cpf,
	E.cep,
	E.nome_Rua || ', ' || E.numero_rua || ', ' || E.complemento || ', ' || E.bairro || ', ' || C.nome || ', ' || UF.uf,
	coalesce(EM.email, EM2.email, EM3.email) as email,
	ddd.cod || '-' || T.numero,
	EQ.nome,
	TF.tipo
		from funcionario F
		left join endereco_funcionario EF
			on EF.id_funcionario = F.id
		left join endereco E
			on EF.id_endereco = E.id
		left join cidade C
			on E.id_cidade = C.id
		left join estado UF
			on C.id_estado = UF.id		
		left join email EM
			on F.id = EM.id_funcionario
				and EM.id_tipo_email = 2
			left join email EM2
				on F.id = EM2.id_funcionario
					and EM2.id_tipo_email = 1
			left join email EM3
				on F.id = EM3.id_funcionario
					and EM3.id_tipo_email = 3		
		left join telefone T
			on F.id = T.id_funcionario
		left join ddd
			on T.id_ddd = ddd.id
		left join funcionario_equipe FE
			on F.id = FE.id_funcionario
		left join equipe EQ
			on FE.id_equipe = EQ.id
		left join tipo_funcionario TF
			on F.id_tipo_funcionario = TF.id
;
select * from vw_dados_funcionario;