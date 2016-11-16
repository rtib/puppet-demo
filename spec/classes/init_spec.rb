require 'spec_helper'
describe 'demo' do
  context 'with default values for all parameters on debian' do
    let :facts do
      {
        osfamily: 'Debian'
      }
    end
    it do
      should contain_class('demo')
      is_expected.to compile.with_all_deps
      is_expected.to contain_package('ntp').with('ensure' => 'installed')
    end
  end

  context 'with default values for all parameters on redhat' do
    let :facts do
      {
        osfamily: 'Redhat'
      }
    end
    it do
      should contain_class('demo')
      is_expected.to compile.with_all_deps
      is_expected.to contain_package('ntpd').with('ensure' => 'installed')
    end
  end
end
