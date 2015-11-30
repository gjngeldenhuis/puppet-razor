# == Class razor::install
#
# This class is called from razor for install.
#
class razor::repos {
  if $::razor::manage_repos {
    case $::osfamily {
      'Debian': {
        apt::source { 'puppetlabs':
          location => 'http://apt.puppetlabs.com',
          repos    => 'main',
          key      => {
            'id'     => '47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30',
            'server' => 'pgp.mit.edu',
          },
        }
      }
      'RedHat': {
        #not yet managed
      }
      default: {
        fail("${::operatingsystem} not supported")
      }
    }
  }
}
