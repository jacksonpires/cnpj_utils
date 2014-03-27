require "cnpj_utils/version"
require "cnpj_utils/string"
require "cnpj_utils/cnpj"

module CnpjUtils

  # Gera um número de CNPJ.
  #
  # Exemplo:
  # CnpjUtils.cnpj => # "61287395000140"
  def self.cnpj
    Cnpj.new(sample_numbers).generate_cnpj
  end

  # Gera um número de Cnpj formatado.
  #
  # Exemplo:
  # CnpjUtils.cnpj_formatted => # "61.287.395/0001-40"
  def self.cnpj_formatted
    Cnpj.new(sample_numbers).generate_cnpj.to_cnpj_format
  end

  # Gera um número de Cnpj formatado.
  #
  # Exemplo:
  # CnpjUtils.cnpj_formatado => # "61.287.395/0001-40"
  def self.cnpj_formatado
    self.cnpj_formatted
  end

  # Verifica se um Cnpj é válido.
  #
  # Exemplo:
  # CnpjUtils.valid_cnpj?(61287395000140) => # true
  # CnpjUtils.valid_cnpj?("61287395000140") => # true
  # CnpjUtils.valid_cnpj?("61.287.395/0001-40") => # true
  def self.valid_cnpj?(cnpj_number)
    cnpj_number.to_s.valid_cnpj?
  end

  # Verifica se um Cnpj é válido.
  #
  # Exemplo:
  # CnpjUtils.cnpj_valido?(61287395000140) => # true
  # CnpjUtils.cnpj_valido?("61287395000140") => # true
  # CnpjUtils.cnpj_valido?("61.287.395/0001-40") => # true
  def self.cnpj_valido?(cnpj_number)
    self.valid_cnpj?(cnpj_number)
  end

  private

  # Sorteia 12 números para compor um novo Cnpj
  def self.sample_numbers
    cnpj_candidate = [*0..9].sample(8)
    cnpj_candidate.concat [0,0,0,1]
  end
end
