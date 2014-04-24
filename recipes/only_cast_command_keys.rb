include_recipe 'sprout-keycastr::install'

osx_defaults 'Set KeyCastr to only cast when using command key' do
  domain node['sprout']['keycastr']['domain']
  key 'default.commandKeysOnly'
  boolean true
end
