# c33s fork of inkblots shorewall

https://github.com/inkblot/puppet-shorewall


to easily use with hiera:


```
shorewall::rules:
  http_allow:  { action: 'ACCEPT', proto: 'tcp', source: 'net', dest: '$FW', port: '80', order: '50', comment: 'http access', ipv4: true, ipv6: false  }
  https_allow: { action: 'ACCEPT', proto: 'tcp', source: 'net', dest: '$FW', port: '443', order: '50', comment: 'https access', ipv4: true, ipv6: false  }
```
