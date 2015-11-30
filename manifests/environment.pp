define razor::environment (
  $environment_name = $title,
  $database_connection = undef,
  $auth = undef, #hash
  $microkernel = undef, #hash
  $secure_api = undef, # boolean
  $protect_new_nodes = undef, #boolean
  $store_hook_input = undef, #boolean
  $store_hook_output = undef, #boolean
  $match_nodes_on = undef, #array
  $checkin_interval = undef, #string
  $task_path = undef, #string
  $repo_store_root = undef, #string
  $broker_path = undef, #string
  $hook_path = undef, #string
  $fact_matching = undef #hash
)
{
  if ! defined(Class['razor']){
    fail('A razor database environment needs a razor class defined.')
  }

  concat::fragment{ "razor_environment${name}":
    target => $::razor::params::config_file,
    content => template('razor/razor_environment.erb'),
    order   => '10',
  }

  exec { "database_init_${name}":
    command => "",
  }

# razor-admin -e production migrate-database
# service razor-server start
}
