# Puppet manifest for my PHP dev machine
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
class phpdevweb
{
    File {
        owner   => "root",
        group   => "root",
        mode    => 644,
        require => Package["httpd"],
        notify  => Service["httpd"]
    }

    host { "mysql-fuelinteractive.edgewebhosting.net":
        ip => "10.10.146.18",
        ensure => present
    }

    #exec { 'yum-update':
    #    command => '/usr/bin/yum -y update',
    #    require => Exec["grap-epel"]
    #}
    exec { "grap-epel":
        command => "/bin/rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm",
        creates => "/etc/yum.repos.d/epel.repo",
        alias   => "grab-epel",
    }

    package { "iptables":
        ensure => present;
    }

    service { "iptables":
        require => Package["iptables"],
        hasstatus => true,
        status => "true",
        ensure => stopped
        # hasrestart => false,
    }

    #file { "/etc/sysconfig/iptables":
    #    owner   => "root",
    #    group   => "root",
    #    mode    => 600,
    #    replace => true,
    #    ensure  => present,
    #    source  => "/vagrant/files/iptables.txt",
    #    require => Package["iptables"],
    #    notify  => Service["iptables"],
    #}

    package { "vim-enhanced":
        ensure  => present,
    }

    package { "git":
        ensure  => present,
    }

    package { "httpd":
        ensure => present
    }

    package { "httpd-devel":
        ensure  => present
    }

    package { "mod_ssl":
        ensure  => present
    }

    service { 'httpd':
        name      => 'httpd',
        require   => Package["httpd"],
        ensure    => running,
        enable    => true
    }

    file { "/etc/httpd/conf.d/vhost.conf":
        replace => true,
        ensure  => present,
        source  => "/vagrant/files/httpd/conf.d/vhost.conf",
    }

    file { "/etc/httpd/vhosts_ssl":
        ensure => "directory",
    }

    file { "/etc/httpd/vhosts":
        replace => true,
        ensure  => present,
        source  => "/vagrant/files/httpd/vhosts",
        recurse => true,
    }

    #class { 'mysql': }
    #class { 'mysql::server':
    #    config_hash => { 'root_password' => 'media1' }
    #}

    package { "php":
        ensure  => present,
    }

    package { "php-cli":
        ensure  => present,
    }

    package { "php-common":
        ensure  => present,
    }

    package { "php-devel":
        ensure  => present,
    }

    package { "php-gd":
        ensure  => present,
    }

    package { "php-mcrypt":
        ensure  => present,
    }

    package { "php-intl":
        ensure  => present,
    }

    package { "php-mbstring":
        ensure  => present,
    }

    package { "php-mysql":
        ensure  => present,
    }

    package { "php-pdo":
        ensure  => present,
    }

    package { "php-pear":
        ensure  => present,
    }

    package { "php-soap":
        ensure  => present,
    }

    package { "php-xml":
        ensure  => present,
    }

    package { "uuid-php":
        ensure  => present,
    }

    package { "php-pecl-memcache":
        ensure  => present,
    }

    package { "php-pecl-xdebug":
        ensure  => present,
        require => Exec["grab-epel"]
    }

    package { "php-pecl-apc":
        ensure  => present,
    }

    file { "/etc/php.ini":
        replace => true,
        ensure  => present,
        source  => "/vagrant/files/php.ini",
    }
}
include phpdevweb
