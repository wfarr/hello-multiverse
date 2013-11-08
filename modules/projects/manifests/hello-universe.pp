class projects::hello-universe {

  package { 'git-core':
    ensure => $ensure,
  }

  ->
  group { 'hello-universe': }

  ->
  user { 'hello-universe':
    home  => '/app',
    gid   => 'hello-universe',
    shell => '/bin/bash',
  }

  ->
  repository { '/app':
    source   => 'git://github.com/wfarr/hello-universe.git',
    user     => 'hello-universe',
    provider => git,
  }

  ->
  file { '/app/.ruby-version':
    content => "1.9.3-p231-tcs-github\n",
  }

}
