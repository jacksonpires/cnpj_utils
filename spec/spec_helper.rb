# Require Code Climate Test Reporter
require "codeclimate-test-reporter"

# Starts Code Climate Test Reporter
CodeClimate::TestReporter.start

# Require other files of project
require "cnpj_utils"
require_relative "../lib/cnpj_utils/cnpj"
