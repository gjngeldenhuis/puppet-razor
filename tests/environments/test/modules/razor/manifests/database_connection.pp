define razor::database_connection (
  $environment_name = '',
  $dbname = '',
  $dbuser = '',
  $dbpassword = '',
)
{
  if ! defined(Class['razor']){
    fail('A razor database connections needs a razor class defined.')
  }

  concat::fragment{ "razor_db_connection_${name}":
    target => $::razor::params::config_file,
    content => template('razor/db_connection.erb'),
    order   => '10',
  }
}
