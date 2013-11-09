class projects::hello-universe {
  require git
  include ruby

  File {
    owner => 'hello-universe',
  }

  exec { '/usr/bin/apt-get update':
  }

  ->
  package {
    [
      'bison',
      'curl',
      'build-essential',
      'libxml2-dev',
      'libxml2',
      'libxslt1-dev',
      'libxslt1.1',
      'zlib1g',
      'zlib1g-dev',
      'libssl-dev',
    ]:
      ensure => installed,
  }

  ->
  user { 'hello-universe':
    home  => '/app',
    shell => '/bin/bash',
  }

  ->
  repository { '/app':
    source   => 'git://github.com/wfarr/hello-universe.git',
    user     => 'hello-universe',
    provider => git,
  }

  ->
  ruby::local { '/app':
    version => '1.9.3-p231-tcs-github-1.0.32',
  }

  ->
  file { '/app/.profile':
    content => template('projects/profile.erb'),
  }

}
