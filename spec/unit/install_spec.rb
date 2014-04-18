require 'unit/spec_helper'

describe 'sprout-keycastr::install' do
  let(:runner) { ChefSpec::Runner.new }
  before do
    runner.converge(described_recipe)
  end

  it 'installs keycastr in /Applications' do
    m = ChefSpec::Matchers::ResourceMatcher.new(:dmg_package, :install, 'KeyCastr')
    expect(runner).to m.with(
      dmg_name: 'KeyCastr',
      owner: 'fauxhai',
      source: runner.node['sprout']['keycastr']['source'],
      checksum: runner.node['sprout']['keycastr']['checksum']
    )
  end

end
