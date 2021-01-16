def payload_criar_contato
  {
    "name": HelperFaker.new.gerar_nome("M"),
    "last_name": HelperFaker.new.gerar_sobre_nome,
    "email": HelperFaker.new.gerar_email,
    "age": rand(18...50).to_s,
    "phone": "21984759575",
    "address": "Rua dois",
    "state": "Minas Gerais",
    "city": "Belo Horizonte"
}
end
