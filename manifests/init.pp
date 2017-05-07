class tvheadend (
  Enum['release','stable','unstable','obsolete'] $release = 'stable',
  String $distribution = $facts['lsbdistcodename'],
  String $user = 'hts',
  String $home = '/var/lib/hts',
  String $group = 'hts',
  Optional[Array[String]] $secondary = ['video'],
  String $admin_username = 'hts',
  Optional[String] $admin_password = undef,
) {

  contain ::tvheadend::install
  contain ::tvheadend::config
  contain ::tvheadend::service

  Class['::tvheadend::install']
  -> Class['::tvheadend::config']
  ~> Class['::tvheadend::service']
}
