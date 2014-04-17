class String

  # Verifica se uma máscara de CNPJ é válida:
  #
  # "61.287.395/0001-40".valid_cnpj_mask? => # true
  # "45.698..394/0001-54".valid_cnpj_mask? => # false
  def valid_cnpj_mask?
    without_mask = !!(self =~ /^[0-9]{14}+$/)
    with_mask = !!(self =~ /^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}+$/)
    with_mask || without_mask
  end

  # Verifica se um CNPJ é válido:
  #
  # "61287395000140".valid_cnpj? => # true
  # "61.287.395/0001-40".valid_cnpj? => # true
  def valid_cnpj?
    if valid_cnpj_mask?
      original_cnpj = self.gsub(/\.?\/?-?/,"",)
      tested_cnpj = original_cnpj[0..11]

      tested_cnpj << CnpjUtils::Cnpj.new(original_cnpj[0..11]).first_digit.to_s
      tested_cnpj << CnpjUtils::Cnpj.new(tested_cnpj[0..12]).second_digit.to_s

      tested_cnpj == original_cnpj ? true : false
    end
  end

  # Para formatar um número válido de CNPJ:
  #
  # "61287395000140".to_cnpj_format => # "61.287.395/0001-40"
  def to_cnpj_format
    if self.valid_cnpj?
      "#{self[0..1]}.#{self[2..4]}.#{self[5..7]}/#{self[8..11]}-#{self[12..13]}"
    end
  end

  # Para gerar um número de CNPJ a partir de um número candidato:
  #
  # "456983940001".generate_cnpj => # "61287395000140"
  def generate_cnpj
    if !!(self =~ /^[0-9]{12}+$/)
      final_cnpj = self

      final_cnpj << CnpjUtils::Cnpj.new(final_cnpj[0..11]).first_digit.to_s
      final_cnpj << CnpjUtils::Cnpj.new(final_cnpj[0..12]).second_digit.to_s

      final_cnpj
    end
  end

  # Gera um número de CNPJ formatado a partir de um número candidato:
  #
  # "456983940001".generate_cnpj_formatted => # "61.287.395/0001-40"
  def generate_cnpj_formatted
    generate_cnpj.to_cnpj_format
  end

  # Apelido 'mascara_de_cnpj_valida' para o método valid_cnpj_mask
  alias_method :mascara_de_cnpj_valida?, :valid_cnpj_mask?

  # Apelido 'cnpj_valido?' para o método valid_cnpj?
  alias_method :cnpj_valido?, :valid_cnpj?

  # Apelido 'para_formato_cnpj' para o método to_cnpj_format
  alias_method :para_formato_cnpj, :to_cnpj_format

  # Apelido 'gerar_cnpj' para o método generate_cnpj
  alias_method :gerar_cnpj, :generate_cnpj

  # Apelido 'gerar_cnpj_formatado' para o método generate_cnpj_formatted
  alias_method :gerar_cnpj_formatado, :generate_cnpj_formatted
end
