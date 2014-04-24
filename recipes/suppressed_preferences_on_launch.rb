include_recipe 'sprout-keycastr::install'

osx_defaults 'Set KeyCastr to NOT show preferences at launch' do
  domain node['sprout']['keycastr']['domain']
  key 'alwaysShowPrefs'
  boolean false
end
