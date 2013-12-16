logrotate::rule { 'messages':
  path         => '/var/log/messages',
  rotate       => 5,
  rotate_every => 'week',
  postrotate   => '/usr/bin/killall -HUP syslogd',
}

logrotate::rule { 'apache':
  path          => '/var/log/httpd/*.log',
  rotate        => 5,
  mail          => 'test@example.com',
  size          => '100k',
  sharedscripts => true,
  postrotate    => '/etc/init.d/httpd restart',
}
