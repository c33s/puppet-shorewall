# ex: si ts=4 sw=4 et

define shorewall::mark (
    $value,
    $source,
    $dest,
    $proto,
    $port     = '-',
    $priority = '10',
) {
    if versioncmp($::shorewall_version, '4.6.0') < 0 {
        $tcrules_filename = 'tcrules'
    } else {
        $tcrules_filename = 'mangle'
    }
    concat::fragment { "mark-${source}-${dest}-${proto}-${port}":
        order   => $priority,
        target  => "/etc/shorewall/${tcrules_filename}",
        content => "${value} ${source} ${dest} ${proto} ${port}\n",
    }
}
