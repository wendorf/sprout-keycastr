require 'unit/spec_helper'

describe 'sprout-keycastr::adjusted_window_placement' do
  let(:chef_run) { ChefSpec::Runner.new }
  let(:placement) { :top_right }
  before do
    chef_run.node.set['sprout']['keycastr']['domain'] = 'foo.bar.baz'
    chef_run.node.set['sprout']['keycastr']['window_placement'] = placement
    chef_run.converge(described_recipe)
  end

  it 'ensures KeyCastr is installed' do
    expect(chef_run).to include_recipe('sprout-keycastr::install')
  end

  it 'updates window placement' do
    key = 'NSWindow Frame KCBezelWindow default.bezelWindow'
    expect(chef_run).to write_osx_defaults('foo.bar.baz', key).with_string(
      '2354 1353 200 0 0 0 2560 1418 '
    )
  end

  context 'when another window placement is given' do
    let(:placement) { :bottom_left }
    it 'updates window placement to the new value' do
      key = 'NSWindow Frame KCBezelWindow default.bezelWindow'
      expect(chef_run).to write_osx_defaults('foo.bar.baz', key).with_string(
        '17 13 200 0 0 0 2560 1337 '
      )
    end
  end

  context 'when an invalid window placement is given' do
    let(:placement) { :invalid }
    it 'does not converge this recipe' do
      key = 'NSWindow Frame KCBezelWindow default.bezelWindow'
      expect(chef_run).to_not write_osx_defaults('foo.bar.baz', key)
    end
  end
end
