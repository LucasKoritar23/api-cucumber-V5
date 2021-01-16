Dado('que possua o payload de criação de contato') do
  log_util("Carregando Payload de criação")
  @payload_criacao = payload_criar_contato
  log_util(JSON.pretty_generate(JSON.parse(@payload_criacao.to_json)))
  @contato_client = ContatosClient.new
end

Quando('realizar a requisição de criação de um contato') do
  log_util("Realizando request")
  @request_criar_contato = @contato_client.post_criar_contato(token = nil, @payload_criacao, headers = nil)
end

Então('deve apresentar o code {int} para a requisição de criação') do |http_status|
  @response_criar_contato = JSON.pretty_generate(JSON.parse(@request_criar_contato.to_json))
  log_util(@response_criar_contato)
  expect(@request_criar_contato.code).to eq(http_status)
end
