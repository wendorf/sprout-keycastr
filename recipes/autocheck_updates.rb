include_recipe 'sprout-keycastr::install'

osx_defaults 'enables autochecking for updates so that user is not prompted first time' do
  domain node['sprout']['keycastr']['domain']
  key 'SUEnableAutomaticChecks'
  integer 1
end
