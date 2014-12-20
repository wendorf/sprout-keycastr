include_recipe 'sprout-keycastr::install'
include_recipe 'sprout-base::addloginitem'

execute 'Start KeyCastr on login' do
  command %Q(su #{node['sprout']['user']} -c "addloginitem /Applications/KeyCastr.app")
  not_if {
    cmd = %q(osascript -e 'tell application "System Events" to get every login item whose name is "KeyCastr"')
    test_cmd = Mixlib::ShellOut.new(cmd)
    test_cmd.run_command
    test_cmd.stdout =~ /KeyCastr/
  }
end
