require 'unit/spec_helper'

describe 'sprout-keycastr::install' do
  let(:runner) { ChefSpec::Runner.new }
  before do
    runner.converge(described_recipe)
  end

  it 'installs homebrew cask' do
    expect(runner).to include_recipe 'homebrew::cask'
  end

  it 'installs keycastr' do
    runner.converge(described_recipe)
    expect(runner).to install_cask('keycastr')
  end
end
