include_recipe 'sprout-keycastr::install'

osx_defaults 'Adjusts KeyCastr font size' do
  domain node['sprout']['keycastr']['domain']
  key 'default.fontSize'
  float node['sprout']['keycastr']['font_size']
end
