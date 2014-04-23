require 'unit/spec_helper'

describe 'sprout-keycastr::enable_accessibility' do
  run_on_db = 'sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db"'

  let(:chef_run) { ChefSpec::Runner.new }
  let(:shellout) { double('shellout', run_command: nil, stdout: test_results) }
  let(:insert_statement) do
    %Q(echo "INSERT INTO access VALUES('kTCCServiceAccessibility','foo.bar.baz',0,1,1,NULL);" | #{run_on_db})
  end
  let(:update_statement) do
    %Q(echo "UPDATE access SET allowed = 1 WHERE client = 'foo.bar.baz';" | #{run_on_db})
  end

  before do
    chef_run.node.set['sprout']['keycastr']['domain'] = 'foo.bar.baz'
    Mixlib::ShellOut.stub(:new).with(
      %Q(echo "SELECT allowed FROM access WHERE client = 'foo.bar.baz';" | #{run_on_db})
    ).and_return(shellout)
    chef_run.converge(described_recipe)
  end

  context 'when no entry exists in the accessibility DB' do
    let(:test_results) { "\n" }

    it 'adds a KeyCastr entry' do
      expect(chef_run).to run_execute(insert_statement)
    end

    it 'does not try to update an entry' do
      expect(chef_run).to_not run_execute(update_statement)
    end
  end

  context 'when there is an entry in the TCC DB' do
    context 'but access is not granted' do
      let(:test_results) { "0\n" }

      it 'does not try to add a KeyCastr entry' do
        expect(chef_run).to_not run_execute(insert_statement)
      end

      it 'updates the entry' do
        expect(chef_run).to run_execute(update_statement)
      end
    end

    context 'and access is already granted' do
      let(:test_results) { "1\n" }

      it 'does not try to add a KeyCastr entry' do
        expect(chef_run).to_not run_execute(insert_statement)
      end

      it 'does not try to update an entry' do
        expect(chef_run).to_not run_execute(update_statement)
      end
    end
  end
end
