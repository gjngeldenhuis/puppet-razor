# == Class razor::service
#
# This class is meant to be called from razor.
# It ensure the service is running.
#
class razor::service {

  service { $::razor::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
