require 'spec_helper'
describe 'demo' do
  context 'with default values for all parameters on debian' do
    let :facts do
      {
        :os => { :family => 'Debian' }
      }
    end
    it do
      should contain_class('demo')
      is_expected.to compile.with_all_deps
      is_expected.to contain_package('ntp').with('ensure' => 'installed')
    end
  end

  context 'with single server value on debian' do
    let :facts do
      {
        :os => { :family => 'Debian' }
      }
    end
    let :params do
      {
        servers: ['first.ntp.server']
      }
    end
    it do
      is_expected.to contain_class('demo')
      is_expected.to compile.with_all_deps
      is_expected.to contain_package('ntp').with('ensure' => 'installed')
      is_expected.to contain_concat__fragment('server line for first.ntp.server').with({
        'target'  => '/etc/ntpd.conf',
        'content' => 'server first.ntp.server',
      })
    end
  end
  
  context 'with multiple server value on debian' do
    let :facts do
      {
        :os => { :family => 'Debian' }
      }
    end
    let :params do
      {
        servers: ['first.ntp.server', 'second.ntp.server']
      }
    end
    it do
      is_expected.to contain_class('demo')
      is_expected.to compile.with_all_deps
      is_expected.to contain_package('ntp').with('ensure' => 'installed')
      is_expected.to contain_concat__fragment('server line for first.ntp.server').with({
        'target'  => '/etc/ntpd.conf',
        'content' => 'server first.ntp.server',
      })
      is_expected.to contain_concat__fragment('server line for second.ntp.server').with({
        'target'  => '/etc/ntpd.conf',
        'content' => 'server second.ntp.server',
      })
    end
  end
  
  context 'with default values for all parameters on redhat' do
    let :facts do
      {
        :os => { :family => 'RedHat' }
      }
    end
    it do
      should contain_class('demo')
      is_expected.to compile.with_all_deps
      is_expected.to contain_package('ntpd').with('ensure' => 'installed')
    end
  end
end
