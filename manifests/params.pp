# == Class razor::params
#
# This class is meant to be called from razor.
# It sets variables according to platform.
#
class razor::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'razor'
      $service_name = 'razor'
    }
    'RedHat', 'Amazon': {
      $package_name = 'razor'
      $service_name = 'razor'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
