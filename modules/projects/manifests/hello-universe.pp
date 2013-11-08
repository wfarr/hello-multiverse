class projects::hello-universe {
  require git
  include ruby

  File {
    owner => 'hello-universe',
  }

  exec { '/usr/bin/apt-get update':
  }

  ->
  package { ['bison', 'curl', 'build-essential', 'rubygems']: }

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

  ->
  file { '/app/.profile':
    content => "source ${ruby::chruby_root}/share/chruby/chruby.sh\n\nsource ${ruby::chruby_root}/share/chruby/auto.sh\n",
  }

}
