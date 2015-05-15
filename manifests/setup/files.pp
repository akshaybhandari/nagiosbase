class nagiosbase::setup::files {
  case $::osfamily {
    'redhat': {
      $plugin_path = '/usr/lib64/nagios/plugins'
    }
    'debian': {
      $plugin_path = '/usr/lib/nagios/plugins'
    }
    default: { fail("No such osfamily: ${::osfamily} yet defined") }
  }
  file { "nagios_privileged_${hostname}":
    ensure => directory,
    path   => "${plugin_path}/privileged/",
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    require => Package['nagios-nrpe-server'],
  }
  file { "check_memory.sh_${hostname}":
    ensure => present,
    path   => "${plugin_path}/check_memory.sh",
    source => 'puppet:///modules/nagiosbase/check_memory.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    require => Package['nagios-nrpe-server'],
  }
  file { "check_service.sh_${hostname}":
    ensure => present,
    path   => "${plugin_path}/check_service.sh",
    source => 'puppet:///modules/nagiosbase/check_service.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    require => Package['nagios-nrpe-server'],
  }
}
