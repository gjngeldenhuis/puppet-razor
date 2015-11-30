include razor
razor::environment { 'production':
  database_connection => 'jdbc:postgresql:razor_prd?user=razor&password=mypass'
}
