include_recipe 'sprout-keycastr::install'

osx_defaults 'Only show KeyCatr in the menubar (so it wont show in the app switcher)' do
  domain node['sprout']['keycastr']['domain']
  key 'displayIcon'
  integer 1
end
