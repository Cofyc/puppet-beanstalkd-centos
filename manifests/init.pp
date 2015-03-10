class beanstalkd {
  file { "/tmp/puppet-$name.rpm":
    source => 'puppet:///modules/beanstalkd/beanstalkd-1.10-1.el7.centos.x86_64.rpm',
  } ->
  package { $name:
    ensure          => present,
    provider        => rpm,
    install_options => ['-ivh'],
    source          => "/tmp/puppet-$name.rpm",
  }
  service { $name:
    ensure => running,
  }
}
