require 'unit/spec_helper'

describe 'sprout-keycastr::default' do
  let(:runner) { ChefSpec::Runner.new }

  it 'installs keycastr' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('sprout-keycastr::install')
  end
end
