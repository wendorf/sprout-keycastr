require 'unit/spec_helper'

describe 'sprout-keycastr::default' do
  let(:chef_run) { ChefSpec::Runner.new }
  before { chef_run.converge(described_recipe) }

  it 'installs KeyCastr' do
    expect(chef_run).to include_recipe('sprout-keycastr::install')
  end

  it 'grants keycastr accessibility privileges' do
    expect(chef_run).to include_recipe('sprout-keycastr::enable_accessibility')
  end

  it 'starts keycastr automatically' do
    expect(chef_run).to include_recipe('sprout-keycastr::start_on_startup')
  end

  it 'suppresses first-time-launch dialog' do
    expect(chef_run).to include_recipe('sprout-keycastr::suppressed_first_time_launch_dialog')
  end

  it 'only casts command keys' do
    expect(chef_run).to include_recipe('sprout-keycastr::only_cast_command_keys')
  end

  it 'suppresses preferences dialog on launch' do
    expect(chef_run).to include_recipe('sprout-keycastr::suppressed_preferences_on_launch')
  end

  it 'adjusts the font size' do
    expect(chef_run).to include_recipe('sprout-keycastr::adjusted_font_size')
  end

  it 'enables autochecking for updates so that user is not prompted first time' do
    expect(chef_run).to include_recipe('sprout-keycastr::autocheck_updates')
  end

  it 'Adjusts KeyCastr Window Placement' do
    pending 'the recipe is not affecting the KeyCastr Application and may contribute to it totally failing to cast'
    expect(chef_run).to include_recipe('sprout-keycastr::adjusted_window_placement')
  end

  it 'only shows KeyCatr in the menubar (so it wont show in the app switcher)' do
    pending 'the recipe is not affecting the KeyCastr app so is not going to be run users have to set this themselves'
    expect(chef_run).to include_recipe('sprout-keycastr::only_in_menubar')
  end
end
