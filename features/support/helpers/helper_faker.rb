class HelperFaker
  
  require 'faker'

  def gerar_nome(sexo)
    sexo == "M" ? nome = Faker::Name.male_first_name : nome = Faker::Name.female_first_name
  end

  def gerar_sobre_nome
    Faker::Name.last_name
  end

  def gerar_nome_completo(sexo)
    nome = gerar_nome(sexo)
    sobre_nome = gerar_sobre_nome
    nome_completo = nome + " " + sobre_nome
  end

  def gerar_email
    name = Faker::Name.first_name.gsub(/[^a-zA-Zs]/, "")
    last_name = Faker::Name.last_name.downcase.gsub(/[^a-zA-Zs]/, "")
    name.downcase + "_" + last_name.downcase + "@#{Time.now.to_i}.com"
  end
end
