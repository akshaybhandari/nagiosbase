class nagiosbase::setup::commands {
  case $::osfamily {
    'redhat': {
      $plugin_dir = '/usr/lib64/nagios/plugins'
      $nrpe_cfgdir = '/etc/nrpe.d'
    }
    'debian': {
      $plugin_dir = '/usr/lib/nagios/plugins'
      $nrpe_cfgdir = '/etc/nagios/nrpe.d'
    }
    default: { fail("No such osfamily: ${::osfamily} yet defined") }
  }
  #basic checks
  file_line { "check_users_${hostname}":
    ensure  => present,
    path    => "${nrpe_cfgdir}/nrpe_command.cfg",
    line    => "command[check_users]=${plugin_dir}/check_users -w 5 -c 10",
    require => File['nrpe_command.cfg'],
    notify  => Service['nagios-nrpe-server'],
  }
  file_line { "check_memory_${hostname}":
    ensure  => present,
    path    => "${nrpe_cfgdir}/nrpe_command.cfg",
    line    => "command[check_memory]=${plugin_dir}/check_memory.sh -w 80 -c 90",
    require => File['nrpe_command.cfg'],
    notify  => Service['nagios-nrpe-server'],
  }
  file_line { "check_all_disks_${hostname}":
    ensure  => present,
    path    => "${nrpe_cfgdir}/nrpe_command.cfg",
    line    => "command[check_all_disks]=${plugin_dir}/check_disk -w 20% -c 10%",
    require => File['nrpe_command.cfg'],
    notify  => Service['nagios-nrpe-server'],
  }
  file_line { "check_load_${hostname}":
    ensure  => present,
    path    => "${nrpe_cfgdir}/nrpe_command.cfg",
    line    => "command[check_load]=${plugin_dir}/check_load -w 15,10,5 -c 30,25,20",
    require => File['nrpe_command.cfg'],
    notify  => Service['nagios-nrpe-server'],
  }
}
