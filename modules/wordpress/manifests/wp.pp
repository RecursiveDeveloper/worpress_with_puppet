class wordpress::wp () {
    exec { 'download_wordpress':
        cwd     => "/tmp",
        path    => ['/bin'],
        command => "wget -O latest.tar.gz http://wordpress.org/latest.tar.gz"
    }

    file { '/tmp/latest.tar.gz':
        ensure  => present,
    }

    exec { 'extract':
        cwd     => "/tmp",
        command => "tar -xvzf latest.tar.gz",
        require => File['/tmp/latest.tar.gz'],
        path    => ['/bin'],
    }
    
    exec { 'copy':
        command => "cp -r /tmp/wordpress/* /var/www/wordpress",
        require => Exec['extract'],
        path    => ['/bin'],
    }

    file { '/var/www/wordpress/wp-config.php':
        ensure  => present,
        require => Exec['copy'],
        content => template("wordpress/wp-config.php.erb")
    }

    exec { 'change_ownership': 
        command => "chown -R vagrant:vagrant /var/www/wordpress",
        path => ['/bin'],
    }
}
