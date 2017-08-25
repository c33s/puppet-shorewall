# ex: si ts=4 sw=4 et

define shorewall::param (
    $param         = $name,
    $values,
    $ipv4          = $::shorewall::ipv4,
    $ipv6          = $::shorewall::ipv6,
    $order         = '50',
) {
    validate_array($values)
    validate_re($param, '^[A-Z]{1}[A-Za-z_0-9]+$')

    if $ipv4 {
        concat::fragment { "param-ipv4-${name}":
            order   => $order,
            target  => '/etc/shorewall/params',
            content => template('shorewall/params.erb'),
        }
    }

    if $ipv6 {
        concat::fragment { "param-ipv6-${name}":
            order   => $order,
            target  => '/etc/shorewall6/params',
            content => template('shorewall/params.erb'),
        }
    }
}
