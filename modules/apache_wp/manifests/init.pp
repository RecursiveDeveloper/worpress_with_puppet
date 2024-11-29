class apache_wp () {
  class { 'apache':
    default_vhost => false,
    mpm_module    => 'prefork'
  }

  apache::vhost { 'unirblog.com':
    port          => 80,
    docroot       => '/var/www/wordpress',
    docroot_owner => 'vagrant',
    docroot_group => 'vagrant',
  }

  class { 'apache::mod::php': }
}
