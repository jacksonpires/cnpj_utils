# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cnpj_utils/version'

Gem::Specification.new do |spec|
  spec.name          = "cnpj_utils"
  spec.version       = CnpjUtils::VERSION
  spec.authors       = ["Jackson Pires"]
  spec.email         = ["jackson.pires@gmail.com"]
  spec.description   = %q{Uma suíte de funcionalidades para o CNPJ.}
  spec.summary       = %q{Gera CNPJ para testes no formado tradicional ou apenas
                          numérico, testa se determinado número de CNPJ
                          é válido, além muitas outras funcionalidades descritas
                          na documentação.}
  spec.homepage      = "https://github.com/jacksonpires/cnpj_utils"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end
