class projects::hello-universe {

  package { 'git-core':
    ensure => $ensure,
  }

  ->
  user { 'hello-universe':
    home  => '/app',
    group => 'wheel',
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
