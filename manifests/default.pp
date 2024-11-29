node default {
  class { 'wordpress::conf': }

  class { 'apache_wp': }

  class { 'mysql_wp': }

  class { 'wordpress::wp': 
    require => Notify['Apache Installation Complete']
  }

  class { 'wordpress::wpcli': 
    require => Notify['Wordpress Installation Complete']
  }

  notify { 'MySQL Installation Complete':
    require => Class['mysql_wp']
  }

  notify { 'Apache Installation Complete':
    require => Class['apache_wp']
  }

  notify { 'Wordpress Installation Complete':
    require => Class['wordpress::wp']
  }

  notify { 'Wordpress cli Installation Complete':
    require => Class['wordpress::wpcli']
  }
}
