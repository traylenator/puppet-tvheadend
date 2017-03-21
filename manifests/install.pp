class tvheadend::install (
  $repo     = $tvheadend::repo,
  $release  = $tvheadend::release,
) inherits tvheadend {

  include ::apt

  apt::source { 'tvheadend':
    comment  => 'tvheadend.org apt repository',
    location => 'https://dl.bintray.com/tvheadend/deb',
    release  => $release,
    repos    => $repo,
    key      => {
      'id'     => '379CE192D401AB61',
      'server' => 'hkp://keyserver.ubuntu.com:80 ',
    },
    include  => {
      'src' => true,
      'deb' => true,
    },
  }

  package{'tvheadend':
    ensure  => present,
    require => Apt::Source['tvheadend'],
  }
}
