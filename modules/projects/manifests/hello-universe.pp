class projects::hello-universe {

  exec { 'apt-get update':
  }

  ->
  package { ['git-core', 'build-essential']:
    ensure   => present,
    provider => apt,
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
  file { '/app/.ruby-version':
    content => "1.9.3-p231-tcs-github\n",
  }

}
