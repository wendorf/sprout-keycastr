require 'unit/spec_helper'

describe 'sprout-keycastr::start_on_startup' do
  let(:chef_run) { ChefSpec::Runner.new }
  let(:test_results) { "\n" }
  let(:shellout) { double('shellout', run_command: nil, stdout: test_results) }

  before do
    Mixlib::ShellOut.stub(:new).with(
      %q(osascript -e 'tell application "System Events" to get every login item whose name is "KeyCastr"')
    ).and_return(shellout)

    chef_run.converge(described_recipe)
  end

  it 'ensures KeyCastr is installed' do
    expect(chef_run).to include_recipe('sprout-keycastr::install')
  end

  it 'ensures addloginitem is installed' do
    expect(chef_run).to include_recipe('sprout-base::addloginitem')
  end

  context 'when there is no login entry' do
    let(:test_results) { "\n" }
    it 'adds a login entry' do
      expect(chef_run).to run_execute(
        'su fauxhai -c "addloginitem /Applications/KeyCastr.app"'
      )
    end
  end

  context 'when there is already a login entry' do
    let(:test_results) { "login item KeyCastr\n" }
    it 'skips adding a login item' do
      expect(chef_run).to_not run_execute('addloginitem /Applications/KeyCastr.app')
    end
  end
end
