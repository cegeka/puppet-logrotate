#!/usr/bin/env rspec

require 'spec_helper'

describe 'logrotate' do
  it { should contain_class 'logrotate' }
end
