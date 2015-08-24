# == Class razor::install
#
# This class is called from razor for install.
#
class razor::install {

  package { $::razor::package_name:
    ensure => present,
  }
}
