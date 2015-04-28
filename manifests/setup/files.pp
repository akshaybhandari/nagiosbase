class nagiosbase::setup::files {
  file { "nagios_privileged_${hostname}":
    ensure => directory,
    path   => '/usr/lib/nagios/plugins/privileged/',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    require => Package['nagios-nrpe-server'],
  }
  file { "check_memory.sh_${hostname}":
    ensure => present,
    path   => '/usr/lib/nagios/plugins/check_memory.sh',
    source => 'puppet:///modules/nagiosbase/check_memory.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}
