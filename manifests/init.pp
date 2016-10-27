# $Id: $
class keyboard (
  $model     = 'pc105',
  $layout    = 'de',
  $variant   = 'nodeadkeys',
  $options   = 'terminate:ctrl_alt_bksp'
) {

  package { 'keyboard-configuration':
    ensure => present
  }

  file { '/etc/default/keyboard':
    content => inline_template('# KEYBOARD CONFIGURATION FILE
# Consult the keyboard(5) manual page.
XKBMODEL="<%= @model %>"
XKBLAYOUT="<%= @layout %>"
XKBVARIANT="<%= @variant %>"
XKBOPTIONS="<%= @options %>"
BACKSPACE="guess"
')
  }

  exec { 'apply-keyboard-configuration':
    command     => '/usr/sbin/dpkg-reconfigure -f noninteractive keyboard-configuration',
    subscribe   => File['/etc/default/keyboard'],
    require     => [ File['/etc/default/keyboard'], Package['keyboard-configuration'], ],
    refreshonly => true
  }
}
