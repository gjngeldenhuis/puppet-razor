# Class: razor
# ===========================
#
# Full description of class razor here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class razor (
  $package_name = $::razor::params::package_name,
  $service_name = $::razor::params::service_name,
) inherits ::razor::params {

  # validate parameters here
  class { '::razor::repos': } ->
  class { '::razor::install': } ->
  class { '::razor::config': } ~>
  class { '::razor::service': } ->
  Class['::razor']
}
