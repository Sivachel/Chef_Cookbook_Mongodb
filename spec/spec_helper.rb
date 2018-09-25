# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'
RSpec.configure do |config|
  config.formatter = :documentation
end
# checks for coverage of the text
at_exit { ChefSpec::Coverage.report! }
