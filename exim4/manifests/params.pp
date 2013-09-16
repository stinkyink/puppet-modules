class exim4::params {
  $hostnames = $::fqdn
  $smarthost = ''

  $config_file = '/etc/exim4/update-exim4.conf.conf'
  $template = 'exim4/update-exim4.conf.erb'

  $passwd_file = '/etc/exim4/passwd.client'
  $passwd_content = ''

  $package = 'exim4'
}
