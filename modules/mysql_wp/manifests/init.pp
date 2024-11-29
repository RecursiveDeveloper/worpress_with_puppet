class mysql_wp () {
  class { 'mysql::server':
    root_password           => $wordpress::conf::root_password,
    remove_default_accounts => true,
    restart                 => true,
  }

  mysql::db { $wordpress::conf::db_name :
    user     => $wordpress::conf::db_user,
    password => $wordpress::conf::db_user_password,
    host     => $wordpress::conf::db_host,
    grant    => ['ALL'],
  }

  class { '::mysql::client':
    require => Class['::mysql::server'],
    bindings_enable => true
  }
}
