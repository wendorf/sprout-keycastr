include_recipe 'sprout-keycastr::install'

osx_defaults 'Set KeyCastr to act as though it had been previously launched' do
  domain node['sprout']['keycastr']['domain']
  key 'SUHasLaunchedBefore'
  boolean true
end
