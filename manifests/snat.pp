define shorewall::snat (
  String $action,
  Optional[String] $source = '0.0.0.0/0',
  String $dest,
  Optional[String] $proto = '-',
  Optional[String] $port = '-',
  Optional[String] $ipsec = '-',
  Optional[String] $mark = '-',
  Optional[String] $user = '-',
  Optional[String] $switch = '-',
  Optional[String] $origdest = '-',
  Optional[String] $probability = '-',
  Optional[String] $comment = '',
) {
    concat::fragment { "snat-${name}":
      order   => '50',
      target  => "/etc/shorewall/snat",
      content => epp('shorewall/snat.epp', {
        action => $action,
        source => $source,
        dest => $dest,
        proto => $proto,
        port => $port,
        ipsec => $ipsec,
        mark => $mark,
        user => $user,
        switch => $switch,
        origdest => $origdest,
        probability => $probability,
        comment => $comment,
      }),
    }
}
