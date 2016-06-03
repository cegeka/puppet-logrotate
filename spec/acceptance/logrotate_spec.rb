require 'spec_helper_acceptance'

describe 'logrotate' do

  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        logrotate::rule { 'messages':
          path         => '/var/log/messages',
          rotate       => 5,
          rotate_every => 'week',
          postrotate   => '/usr/bin/killall -HUP syslogd',
        }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file('/etc/logrotate.d/messages') do
      it { should contain '-HUP syslogd' }
    end
  end
end
