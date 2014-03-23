# == Class
#
# apt_sources
#
# == Synopsis
#
# This class is used for managing Debian's sources.list file with Puppet.
#
# == Author
#
# John McCarthy <midactsmystery@gmail.com>
#
# - http://www.midactstech.blogspot.com -
# - https://www.github.com/Midacts -
#
# == Date
#
# 23rd of March, 2014
#
# -- Version 1.0 --
#
class apt_sources {

  file { '/etc/apt/sources.list':
    ensure	=> present,
    content	=> template('apt_sources/sources.list.erb'),
    owner	=> root,
    group	=> root,
    mode	=> 644,
  }
    
  exec { 'apt-get update':
    command	=> '/usr/bin/apt-get update',
    subscribe	=> File['/etc/apt/sources.list'],
    refreshonly	=> true,
  }

}
