class ContatosClient

  include HTTParty

  base_uri "https://api-de-tarefas.herokuapp.com"

  def post_criar_contato(token, payload, headers = nil)
     execute_post(self, token, "/contacts", payload, headers)
  end
end
