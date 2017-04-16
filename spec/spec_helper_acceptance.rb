require 'beaker-rspec'
require 'beaker/puppet_install_helper'

run_puppet_install_helper unless ENV['BEAKER_provision'] == 'no'
modules = ['puppetlabs-stdlib', 'puppetlabs-apt', 'puppetlabs-concat', 'herculesteam-augeasproviders_shellvar', 'herculesteam-augeasproviders_core', 'stm-debconf']

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    puppet_module_install(source: proj_root, module_name: 'tvheadend')
    hosts.each do |host|
      # module is a reserved word in ruby, so we use modul here
      modules.each do |modul|
        on host, puppet('module', 'install', modul), acceptable_exit_codes: [0]
      end
    end
  end
end
