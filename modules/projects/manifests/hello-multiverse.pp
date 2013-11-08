class projects::hello-multiverse {

  package { 'git-core':
    ensure => $ensure,
  }

  ->
  group { 'hello-multiverse': }

  ->
  user { 'hello-multiverse':
    home  => '/app',
    gid   => 'hello-multiverse',
    shell => '/bin/bash',
  }

  ->
  repository { '/app':
    source   => 'git://github.com/wfarr/hello-multiverse.git',
    user     => 'hello-multiverse',
    provider => git,
  }

  ->
  file { '/app/.ruby-version':
    content => "1.9.3-p231-tcs-github\n",
  }

}
