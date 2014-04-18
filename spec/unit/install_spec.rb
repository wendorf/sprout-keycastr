require 'unit/spec_helper'

describe 'sprout-keycastr::install' do
  let(:chef_run) { ChefSpec::Runner.new }
  before do
    chef_run.converge(described_recipe)
  end

  it 'installs keycastr in /Applications' do
    m = ChefSpec::Matchers::ResourceMatcher.new(:dmg_package, :install, 'KeyCastr')
    expect(chef_run).to m.with(
      dmg_name: 'KeyCastr',
      owner: 'fauxhai',
      source: chef_run.node['sprout']['keycastr']['source'],
      checksum: chef_run.node['sprout']['keycastr']['checksum']
    )
  end

end
