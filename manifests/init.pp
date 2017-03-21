class tvheadend (
  Enum['release','stable','unstable','obsolete'] $repo = 'stable',
  String $release = $facts['lsbdistcodename'],
) {

  include ::tvheadend::install

}
