# ex: si ts=4 sw=4 et

define shorewall::param (
    $param         = $name,
    $values,
    $ipv4          = $::shorewall::ipv4,
    $ipv6          = $::shorewall::ipv6,
    $order         = '50',
) {
    validate_array($values)
    validate_re($param, '^[a-zA-Z_]+$')

    if $ipv4 {
        concat::fragment { "param-ipv4-${name}":
            order   => $order,
            target  => '/etc/shorewall/params',
            content => template('shorewall/params.erb'),
        }
    }

    if $ipv6 {
        fail("ipv6 not implemented in param")
    }
}
