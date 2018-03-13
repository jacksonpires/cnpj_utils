require 'simplecov'
SimpleCov.start

require 'coveralls'
Coveralls.wear!

# Require other files of project
require "cnpj_utils"
require_relative "../lib/cnpj_utils/cnpj"
