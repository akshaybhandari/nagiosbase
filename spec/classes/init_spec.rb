require 'spec_helper'
describe 'nagiosbase' do

  context 'with defaults for all parameters' do
    it { should contain_class('nagiosbase') }
  end
end
