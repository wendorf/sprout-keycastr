require 'spec_helper'

describe 'sprout-keycastr' do
  let(:domain) { 'net.stephendeken.KeyCastr' }

  before :all do
    expect(File).not_to be_exists('/Applications/KeyCastr.app')
    expect(system('soloist')).to be_true
  end

  it 'installs KeyCastr' do
    expect(File).to be_exists('/Applications/KeyCastr.app')
  end

  it 'adds KeyCastr to the the accessability DB' do
    run_query = %q(sudo sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db")
    results = `echo "SELECT allowed FROM access WHERE client = '#{domain}';" | #{run_query}`
    expect(results.strip).to eq('1')
  end

  it 'starts KeyCastr on startup' do
    results = `osascript -e 'tell application "System Events" to get every login item whose name is "KeyCastr"'`
    expect(results.strip).to match(/KeyCastr/)
  end
end
