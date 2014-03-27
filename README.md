# CnpjUtils

CnpjUtils é uma suite de funcionalidades para CNPJ.
O CnpjUtils é capaz de gerar CNPJ para testes no formado tradicional ou apenas numérico, testa se determinado número de CNPJ é válido, gera dígitos verificadores para determinado número candidato a CNPJ, dentre outras coisas.

## Instalação

Adicione essa linha na Gemfile da sua aplicação:

    gem 'cnpj_utils'

E então execute:

    $ bundle

Ou instale você mesmo, conforme abaixo:

    $ gem install cnpj_utils

## Uso

O CnpjUtils é muito fácil de usar, por exempo:

    # Para gerar um número de CNPJ:
    CnpjUtils.cnpj => # "61287395000140"

    # Para gerar um CNPJ formatado:
    CnpjUtils.cnpj_formatted => # "61.287.395/0001-40"

    # Para verificar se um CNPJ é válido:
    CnpjUtils.valid_cnpj?("61287395000140") => # true
    CnpjUtils.valid_cnpj?(61287395000140) => # true
    CnpjUtils.valid_cnpj?("61.287.395/0001-40") => # true

    # Outra forma de verificar se um CNPJ é válido:
    "61287395000140".valid_cnpj? => # true
    "61.287.395/0001-40".valid_cnpj? => # true

    # Para verificar se uma máscara de CNPJ é válida:
    "61.287.395/0001-40".valid_cnpj_mask? => # true
    "61.287..395/0001-40".valid_cnpj_mask? => # false

    # Para formatar um número válido de CNPJ:
    "61287395000140".to_cnpj_format => # "61.287.395/0001-40"

    # Para gerar um número de CNPJ a partir de um número candidato de 12 dígitos:
    "612873950001".generate_cnpj => # "61287395000140"

    # Para gerar um número de CNPJ formatado a partir de um número candidato de 12 dígitos:
    "612873950001".generate_cnpj_formatted => # "61.287.395/0001-40"

Também é possível usar métodos em português:

    # Para gerar um número de CNPJ:
    CnpjUtils.cnpj => # "61287395000140"

    # Para gerar um CNPJ formatado:
    CnpjUtils.cnpj_formatado => # "61.287.395/0001-40"

    # Para verificar se um CNPJ é válido:
    CnpjUtils.cnpj_valido?("61287395000140") => # true
    CnpjUtils.cnpj_valido?(61287395000140) => # true
    CnpjUtils.cnpj_valido?("61.287.395/0001-40") => # true

    # Outra forma de verificar se um CNPJ é válido:
    "61287395000140".cnpj_valido? => # true
    "61.287.395/0001-40".cnpj_valido? => # true

    # Para verificar se uma máscara de CNPJ é válida:
    "61.287.395/0001-40".mascara_de_cnpj_valida? => # true
    "61.287..395/0001-40".mascara_de_cnpj_valida? => # false

    # Para formatar um número válido de CNPJ:
    "61287395000140".para_formato_cnpj => # "61.287.395/0001-40"

    # Para gerar um número de CNPJ a partir de um número candidato de 12 dígitos:
    "612873950001".gerar_cnpj => # "61287395000140"

    # Para gerar um número de CNPJ formatado a partir de um número candidato de 12 dígitos:
    "612873950001".gerar_cnpj_formatado => # "61.287.395/0001-40"

## Contribuindo

1. Faça um Fork
2. Crie um branch para a nova funcionalidade (`git checkout -b minha-nova-funcionalidade`)
3. Faça o commit de suas alterações  (`git commit -am 'Adicionada nova funcionalidade'`)
4. Faça um push da sua nova funconalidade (`git push origin minha-nova-funcionalidade`)
5. Submeta uma nova Pull Request
