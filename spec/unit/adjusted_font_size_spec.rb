require 'unit/spec_helper'

describe 'sprout-keycastr::adjusted_font_size' do
  let(:chef_run) { ChefSpec::Runner.new }
  before do
    chef_run.node.set['sprout']['keycastr']['domain'] = 'foo.bar.baz'
    chef_run.node.set['sprout']['keycastr']['font_size'] = 321
    chef_run.converge(described_recipe)
  end

  it 'ensures KeyCastr is installed' do
    expect(chef_run).to include_recipe('sprout-keycastr::install')
  end

  it 'updates the font size' do
    expect(chef_run).to write_osx_defaults('foo.bar.baz', 'default.fontSize').with_float(321)
  end
end
