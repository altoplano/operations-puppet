# RT - Request Tracker
#
#  This will create a server running RT with apache.
#
class misc::rt-apache::server ( $dbuser, $dbpass, $site = 'rt.wikimedia.org', $dbhost = 'localhost', $dbport = '3306', $datadir = '/var/lib/mysql' ) {
  system_role { 'misc::rt-apache::server': description => 'RT server with Apache' }


  if ! defined(Class['webserver::php5']) {
    class {'webserver::php5': ssl => true; }
  }


  $rt_mysql_user = $dbuser
  $rt_mysql_pass = $dbpass
  $rt_mysql_host = $dbhost
  $rt_mysql_port = $dbport

  package { [ 'request-tracker4',
              'rt4-db-mysql',
              'rt4-clients',
              'libdbd-pg-perl' ]:
    ensure => latest;
  }

  $rtconf = '# This file is for the command-line client, /usr/bin/rt.\n\nserver http://localhost/rt\n'

  file {
    '/etc/request-tracker4/RT_SiteConfig.d/50-debconf':
      require => package['request-tracker4'],
      content => template('rt/50-debconf.erb'),
      notify  => Exec['update-rt-siteconfig'];
    '/etc/request-tracker4/RT_SiteConfig.d/51-dbconfig-common':
      require => package['request-tracker4'],
      content => template('rt/51-dbconfig-common.erb'),
      notify  => Exec['update-rt-siteconfig'];
    '/etc/request-tracker4/RT_SiteConfig.d/80-wikimedia':
      require => package['request-tracker4'],
      source  => 'puppet:///files/rt/80-wikimedia',
      notify  => Exec['update-rt-siteconfig'];
    '/etc/request-tracker4/RT_SiteConfig.pm':
      require => package['request-tracker4'],
      owner   => 'root',
      group   => 'www-data',
      mode    => '0440';
    '/etc/request-tracker4/rt.conf':
      require => Package['request-tracker4'],
      content => $rtconf;
  }

  exec { 'update-rt-siteconfig':
    command     => '/usr/sbin/update-rt-siteconfig-4',
    subscribe   => file[
                        '/etc/request-tracker4/RT_SiteConfig.d/50-debconf',
                        '/etc/request-tracker4/RT_SiteConfig.d/51-dbconfig-common',
                        '/etc/request-tracker4/RT_SiteConfig.d/80-wikimedia' ],
    require     => package[ 'request-tracker4', 'rt4-db-mysql', 'rt4-clients' ],
    refreshonly => true,
    notify      => Service[apache2];
  }

  file { "/etc/apache2/sites-available/${site}":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('rt/rt4.apache.erb'),
  }

  # use this to have a NameVirtualHost *:443
  # avoid [warn] _default_ VirtualHost overlap

  file { '/etc/apache2/ports.conf':
    ensure => present,
    mode   => '0444',
    owner  => root,
    group  => root,
    source => 'puppet:///files/apache/ports.conf.ssl';
  }

  apache_module { 'perl':
    name => 'perl',
  }

  apache_site { "${site}":
    name => "${site}"
  }

}
