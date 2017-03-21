require 'spec_helper'
describe 'tvheadend' do
  context 'with default values for all parameters' do
    it { should contain_class('tvheadend') }
  end
end
