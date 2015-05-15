class nagiosbase::setup {
  class { 'nagiosbase::setup::host':
    require => [ File['/etc/nagios/nrpe.cfg'], Package['nagios-nrpe-server'] ],
  } ->
  class { 'nagiosbase::setup::services': } ->
  class { 'nagiosbase::setup::files': } ->
  class { 'nagiosbase::setup::commands': }
}
