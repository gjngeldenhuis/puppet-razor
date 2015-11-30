# == Class razor::params
#
# This class is meant to be called from razor.
# It sets variables according to platform.
#
class razor::params {
  $manage_repos = 'true'
  $config_file = '/etc/razor/config.yaml'
  $microkernel_tarfile = 'http://links.puppetlabs.com/razor-microkernel-latest.tar'
  case $::osfamily {
    'Debian': {
      $package_name = 'razor-server'
      $service_name = 'razor-server'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
