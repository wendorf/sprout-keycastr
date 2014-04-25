require 'unit/spec_helper'

describe 'sprout-keycastr::autocheck_updates' do
  let(:chef_run) { ChefSpec::Runner.new }
  before do
    chef_run.node.set['sprout']['keycastr']['domain'] = 'foo.bar.baz'
    chef_run.converge(described_recipe)
  end

  it 'ensures KeyCastr is installed' do
    expect(chef_run).to include_recipe('sprout-keycastr::install')
  end

  it 'enables autochecking for updates so that user is not prompted first time' do
    expect(chef_run).to write_osx_defaults('foo.bar.baz', 'SUEnableAutomaticChecks').with_integer(1)
  end
end
