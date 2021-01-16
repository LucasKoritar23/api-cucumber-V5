#language: pt
#utf-8


@contato
Funcionalidade: Validar o endpoint de contatos
	Eu como usuário da API
	Quero poder criar, consultar, editar e apagar contatos

@post_contato
	Cenário: Validar a criação de um contato com sucesso
		Dado que possua o payload de criação de contato
		Quando realizar a requisição de criação de um contato
		Então deve apresentar o code 201 para a requisição de criação
