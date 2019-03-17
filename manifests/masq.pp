# ex: si ts=4 sw=4 et

define shorewall::masq (
    $sources,
) {
    if versioncmp($::shorewall_version, '5.0.14') < 0 {
        $masq_filename = 'masq'
    } else {
        $masq_filename = 'snat'
    }
    concat::fragment { "masq-${name}":
        order   => '50',
        target  => "/etc/shorewall/${masq_filename}",
        content => inline_template("<% @sources.each { |source| %><%= @name %> <%= source %>\n<% } %>"),
    }

}    
