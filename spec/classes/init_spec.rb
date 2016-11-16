require 'spec_helper'
describe 'demo' do
  context 'with default values for all parameters' do
    it { 
      should contain_class('demo')
      is_expected.to compile.with_all_deps
      is_expected.to contain_package('ntp').with({
        'ensure' => 'installed',
      })
    }
  end
end
