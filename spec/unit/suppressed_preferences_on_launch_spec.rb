require 'unit/spec_helper'

describe 'sprout-keycastr::suppressed_preferences_on_launch' do
  let(:chef_run) { ChefSpec::Runner.new }
  before do
    chef_run.node.set['sprout']['keycastr']['domain'] = 'foo.bar.baz'
    chef_run.converge(described_recipe)
  end

  it 'ensures KeyCastr is installed' do
    expect(chef_run).to include_recipe('sprout-keycastr::install')
  end

  it 'sets KeyCastr to NOT show preferences at launch' do
    expect(chef_run).to write_osx_defaults('foo.bar.baz', 'alwaysShowPrefs').with_boolean(false)
  end
end
