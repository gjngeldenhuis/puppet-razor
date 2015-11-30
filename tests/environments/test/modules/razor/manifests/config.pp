# == Class razor::config
#
# This class is called from razor for service config.
#
class razor::config {
#  file { $::razor::params::config_file:
#    owner => 'root',
#    group => 'root',
#    mode  => '0644',
#    content => template('razor/config.yaml.erb'),
#  }
  concat { $::razor::params::config_file:
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  concat::fragment { 'beginning':
    target  => $::razor::params::config_file,
    content => "---\n# Managed by Puppet Razor Module",
    order   => '00',
  }

  razor::environment { 'all':
    auth              => { 'enabled' => false, 'config' => 'shiro.ini'},
    microkernel       => { 'debug_level' => 'debug', 'kernel_args' => ''},
    secure_api        => false,
    protect_new_nodes => false,
    store_hook_input  => false, #boolean
    store_hook_output => false, #boolean
    match_nodes_on    => ['mac'], #string
    checkin_interval  => 15,
    task_path         => 'tasks',
    repo_store_root   => '/var/lib/razor/repo-store',
    broker_path       => 'brokers',
    hook_path         => 'hooks',
    fact_matching     => { 'blacklist' => ['domain','filesystems'],'match_on' => ['unique_fact','other_facts_.*/']},
  }


}
#auth:
  # You can enable or disable authentication support.  When disabled, all
  # authentication is ignored and access to `/api` is unrestricted.
  # When enabled a valid username and password must be present in all
  # requests to `/api`.
#  enabled: false
  # The path to the authentication configuration file.  We use Apache Shiro
  # to manage authentication, since it provides a solid and effective
  # abstraction over common third party sources of authentication and role
  # management information.
  #
  # You can learn more about the content of this file in their documentation:
  # http://shiro.apache.org/configuration.html
  #
  # If this is an absolute path it will be used as-is, but if you give a
  # relative path it is relative to the root directory of the
  # Razor installation.
#  config: shiro.ini
