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
end
