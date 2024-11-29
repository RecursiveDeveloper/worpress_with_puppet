class wordpress::wpcli () {
  $modules_path = "/etc/puppetlabs/code/environments/production/modules/wordpress"

  exec { 'wpcli_install':
    cwd     => "/home/vagrant",
    user    => "vagrant",
    command => "$modules_path/scripts/install_wpcli.sh",
  }

  exec { 'wpblog_install':
    cwd     => "/var/www/wordpress",
    user    => "vagrant",
    command => "$modules_path/scripts/blog_config.sh",
  }
}
