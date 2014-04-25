include_recipe 'sprout-keycastr::install'

placement_key = node['sprout']['keycastr']['window_placement']
placements = {
  top_left: '22 1259 200 195 0 0 2560 1337 ',
  top_right: '2354 1353 200 0 0 0 2560 1418 ',
  bottom_left: '17 13 200 0 0 0 2560 1337 ',
  bottom_right: '2365 17 200 0 0 0 2560 1337 '
}

osx_defaults "Adjusts KeyCastr Window Placement to #{placement_key}" do
  domain node['sprout']['keycastr']['domain']
  key 'NSWindow Frame KCBezelWindow default.bezelWindow'
  string placements[placement_key.to_sym]
  only_if { placements[placement_key.to_sym] }
end
