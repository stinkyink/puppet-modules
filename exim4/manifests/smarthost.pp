class exim4::params {
  $hostnames = ::$fqdn
  $smarthost = ''

  $passwd_file = '/etc/exim4/passwd.client'
  $passwd_content = '';

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'exim4',
    default                   => 'exim'
  }
}

