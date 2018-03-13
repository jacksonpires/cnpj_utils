require "spec_helper"

describe CnpjUtils do

  context 'CnpjUtils::Cnpj' do

    it "#initialize - Text" do
      cnpj = CnpjUtils::Cnpj.new("123456780001")
      expect(cnpj.numbers).to be_a_kind_of(Array)
      expect(cnpj.numbers.size).to eql(12)
    end

    it "#initialize - Integer" do
      cnpj = CnpjUtils::Cnpj.new(123456780001)
      expect(cnpj.numbers).to be_a_kind_of(Array)
      expect(cnpj.numbers.size).to eql(12)
    end

    it "#initialize - Array" do
      cnpj = CnpjUtils::Cnpj.new([1, 2, 3, 4, 5, 6, 7, 8, 0, 0, 0, 1])
      expect(cnpj.numbers).to be_a_kind_of(Array)
      expect(cnpj.numbers.size).to eql(12)
    end

    it "#generate_cnpj" do
      cnpj = CnpjUtils::Cnpj.new("123456780001")
      complete_cnpj = cnpj.generate_cnpj
      expect(complete_cnpj.size).to eql(14)
    end

    it "#first_digit" do
      cnpj = CnpjUtils::Cnpj.new("612873950001")
      first_digit = cnpj.first_digit
      expect(first_digit).to eql(4)
    end

    it "#first_digit - false" do
      cnpj = CnpjUtils::Cnpj.new("123")
      first_digit = cnpj.first_digit
      expect(first_digit).to be_false
    end

    it "#second_digit" do
      cnpj = CnpjUtils::Cnpj.new("6128739500014")
      second_digit = cnpj.second_digit
      expect(second_digit).to eql(0)
    end

    it "#second_digit - false" do
      cnpj = CnpjUtils::Cnpj.new("123")
      second_digit = cnpj.second_digit
      expect(second_digit).to be_false
    end

    it "#check_remainder" do
      cnpj = CnpjUtils::Cnpj.new("123456780001")
      expect(cnpj.check_remainder(0)).to eql(0)
      expect(cnpj.check_remainder(1)).to eql(0)
      expect(cnpj.check_remainder(2)).to eql(9)
    end
  end
end
