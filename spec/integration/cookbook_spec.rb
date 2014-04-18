require 'spec_helper'

describe 'sprout-keycastr' do
  before :all do
    expect(File).not_to be_exists('/Applications/KeyCastr.app')
    expect(system('soloist')).to be_true
  end

  it 'installs KeyCastr' do
    expect(File).to be_exists('/Applications/KeyCastr.app')
  end
end
