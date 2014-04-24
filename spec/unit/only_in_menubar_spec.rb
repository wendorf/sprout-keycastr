require 'unit/spec_helper'

describe 'sprout-keycastr::only_in_menubar' do
  let(:chef_run) { ChefSpec::Runner.new }
  before do
    chef_run.node.set['sprout']['keycastr']['domain'] = 'foo.bar.baz'
    chef_run.converge(described_recipe)
  end

  it 'ensures KeyCastr is installed' do
    expect(chef_run).to include_recipe('sprout-keycastr::install')
  end

  it 'only shows KeyCatr in the menubar (so it wont show in the app switcher)' do
    expect(chef_run).to write_osx_defaults('foo.bar.baz', 'displayIcon').with_integer(1)
  end
end
