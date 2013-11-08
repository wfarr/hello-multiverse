class projects::hello-universe {
  require git

  Exec {
    path => '/usr/bin:/bin',
  }

  File {
    owner => 'hello-universe',
  }

  exec { 'apt-get update':
  }

  ->
  package { 'build-essential':
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
  ruby::local { '/app/.ruby-version':
    version => '1.9.3-p231-tcs-github',
  }

}
