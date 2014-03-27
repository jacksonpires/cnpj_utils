require "spec_helper"

describe CnpjUtils do

  it ".cnpj" do
    valid_cnpj = CnpjUtils.cnpj
    expect(valid_cnpj).to be_a_kind_of(String)
    expect(valid_cnpj.length).to eql(14)
  end

  it ".cnpj_formatted" do
    valid_cnpj = CnpjUtils.cnpj_formatted
    expect(valid_cnpj).to match(/^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}+$/)
  end

  it ".cnpj_formatado" do
    valid_cnpj = CnpjUtils.cnpj_formatado
    expect(valid_cnpj).to match(/^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}+$/)
  end

  it ".valid_cnpj?" do
    valid_cnpj = CnpjUtils.cnpj
    expect(CnpjUtils.valid_cnpj? valid_cnpj).to be_true
  end

  it ".cnpj_valido?" do
    cnpj_valido = CnpjUtils.cnpj
    expect(CnpjUtils.cnpj_valido? cnpj_valido).to be_true
  end

  it ".valid_cnpj? - be false" do
    invalid_cnpj = "12.345.678/0001-12"
    expect(CnpjUtils.valid_cnpj? invalid_cnpj).to be_false
  end

  it ".sample_numbers" do
    numbers = CnpjUtils.sample_numbers
    expect(numbers.size).to eql(12)
    expect(numbers).to be_a_kind_of(Array)
  end
end
