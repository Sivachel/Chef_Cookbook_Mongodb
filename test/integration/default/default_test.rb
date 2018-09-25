# # encoding: utf-8

# Inspec test for recipe mongod::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


# This is an example test, replace it with your own test.
describe service("mongod") do
  it { should be_running }
  it { should be_enabled}
end

describe package 'mongodb-org' do
  it { should be_installed }
  its('version') { should match /3\./ }
end

describe port('0.0.0.0', 27017) do
  it { should be_listening }
end
