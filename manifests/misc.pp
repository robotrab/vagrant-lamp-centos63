class misc {

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

  exec { "grap-epel":
    command => "/bin/rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm",
    creates => "/etc/yum.repos.d/epel.repo",
    alias   => "grab-epel",
  }

  package { "vim-enhanced":
    ensure  => present,
  }

  package { "git.x86_64":
    ensure  => present,
  }

}
