require 'spec_helper'

describe 'razor' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "razor class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('razor::params') }
          it { is_expected.to contain_class('razor::install').that_comes_before('razor::config') }
          it { is_expected.to contain_class('razor::config') }
          it { is_expected.to contain_class('razor::service').that_subscribes_to('razor::config') }

          it { is_expected.to contain_service('razor') }
          it { is_expected.to contain_package('razor').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'razor class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('razor') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
