# Internal: Manage the default suse logrotate rules.
#
# Examples
#
#   include logrotate::defaults::suse
class logrotate::defaults::suse {
  Logrotate::Rule {
    missingok    => true,
    rotate_every => 'month',
    create       => true,
    create_owner => 'root',
    create_group => 'utmp',
    rotate       => 99,
    maxage       => 365,
    size         => '400k'
  }
}
