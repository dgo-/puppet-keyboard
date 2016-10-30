# puppet-keyboard
Puppet Module to set keyboard layout on Debian based systems

## usage
install default german keyboard
```puppet
include keyboard
```

install german keyboard by parameters
```puppet
class keyboard {
  model     => 'pc105',
  layout    => 'de',
  variant   => 'nodeadkeys',
  options   => 'terminate:ctrl_alt_bksp'
{
```
