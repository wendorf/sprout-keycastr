require 'rspec'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end

def install_cask(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:homebrew_cask, :install, resource_name)
end
