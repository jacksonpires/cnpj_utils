require "spec_helper"

describe String do
  it "#valid_cnpj_mask?" do
    expect("61.287.395/0001-40".valid_cnpj_mask?).to be_true
    expect("61287395000140".valid_cnpj_mask?).to be_true
  end

  it "#mascara_de_cnpj_valida?" do
    expect("61.287.395/0001-40".mascara_de_cnpj_valida?).to be_true
    expect("61287395000140".mascara_de_cnpj_valida?).to be_true
    expect("41405186000146".valid_cnpj?).to be_true
    expect("41.405.186/0001-46".valid_cnpj?).to be_true
  end

  it "#valid_cnpj_mask? - be false" do
    expect("45.698.394//0001-54".valid_cnpj_mask?).to be_false
    expect("45.698..394/0001-54".valid_cnpj_mask?).to be_false
    expect("45.698.394/00O1-54".valid_cnpj_mask?).to be_false
  end

  it "#mascara_de_cnpj_valida? - be false" do
    expect("45.698.394//0001-54".mascara_de_cnpj_valida?).to be_false
    expect("45.698..394/0001-54".mascara_de_cnpj_valida?).to be_false
    expect("45.698.394/00O1-54".mascara_de_cnpj_valida?).to be_false
  end

  it "#valid_cnpj?" do
    cnpj = CnpjUtils.cnpj
    expect(cnpj.valid_cnpj?).to be_true
  end

  it "#cnpj_valido?" do
    cnpj = CnpjUtils.cnpj
    expect(cnpj.cnpj_valido?).to be_true
  end

  it "#to_cnpj_format?" do
    cnpj = CnpjUtils.cnpj
    expect(cnpj.to_cnpj_format).to match(/^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}+$/)
  end

  it "#para_formato_cnpj?" do
    cnpj = CnpjUtils.cnpj
    expect(cnpj.para_formato_cnpj).to match(/^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}+$/)
  end

  it "#generate_cnpj" do
    valid_cnpj = CnpjUtils.cnpj
    final_cnpj = valid_cnpj[0..11].generate_cnpj

    expect(final_cnpj).to be_a_kind_of(String)
    expect(final_cnpj.length).to eql(14)
  end

  it "#gerar_cnpj" do
    valid_cnpj = CnpjUtils.cnpj
    final_cnpj = valid_cnpj[0..11].gerar_cnpj

    expect(final_cnpj).to be_a_kind_of(String)
    expect(final_cnpj.length).to eql(14)
  end

  it "#gerar_cnpj_formatado" do
    valid_cnpj = CnpjUtils.cnpj
    final_cnpj = valid_cnpj[0..11].gerar_cnpj_formatado

    expect(final_cnpj).to match(/^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}+$/)
  end

  it "#generate_cnpj_formatted" do
    valid_cnpj = CnpjUtils.cnpj
    final_cnpj = valid_cnpj[0..11].generate_cnpj_formatted

    expect(final_cnpj).to match(/^[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2}+$/)
  end
end
