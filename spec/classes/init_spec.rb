require 'spec_helper'

describe 'libpam_ssh' do
  let :facts do {
    :operatingsystem => 'Ubuntu',
    :osfamily        => 'debian',
    :lsbdistid       => 'Ubuntu',
    :lsbdistcodename => 'lucid',
  } end

  context 'by default' do
    it { should compile }
  end
end
