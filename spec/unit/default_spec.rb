require 'unit/spec_helper'

describe 'sprout-keycastr::default' do
  let(:chef_run) { ChefSpec::Runner.new }

  it 'installs keycastr' do
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('sprout-keycastr::install')
  end
end
