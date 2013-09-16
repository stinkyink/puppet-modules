class exim4(
  $hostnames      = params_lookup('hostnames'),
  $smarthost      = params_lookup('smarthost'),
  $passwd_content = params_lookup('passwd_content'),
  $package        = params_lookup('package'),
  $template       = params_lookup('template')
) inherits exim4::params {

  $has_smarthost = !empty($smarthost)
  $configtype = $has_smarthost ? {
    true    => 'smarthost',
    false   => 'local',
    default => 'local'
  }

  $config_file_content = $exim4::template ? {
    ''      => undef,
    default => template($exim4::template),
  }

  package { $exim4::package:
    ensure => present
  }

  file { $exim4::passwd_file:
    ensure  => file,
    owner   => root,
    group   => 'Debian-exim',
    mode    => 640,
    content => $exim4::passwd_content,
    notify  => Exec["/usr/sbin/update-exim4.conf"],
    require => Package[$exim4::package]
  }

  file { $exim4::config_file:
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 644,
    content => $config_file_content,
    notify  => Exec["/usr/sbin/update-exim4.conf"],
    require => Package[$exim4::package]
  }

  exec { "/usr/sbin/update-exim4.conf":
    refreshonly => true
  }
}
